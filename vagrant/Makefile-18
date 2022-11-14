.PHONY: reset up upload vagrantfile artifacts pillar run info

ARTIFACTS_PATH=artifacts
DATE_STAMP=$(shell cat ${ARTIFACTS_PATH}/date || date +%Y%m%d-%H%M%S)
GIT_SHORT=$(shell cat ${ARTIFACTS_PATH}/git_short || git rev-parse --short HEAD)
PACKER_FILE=lighthouse-ubuntu-18.04-amd64.json
BOX_VERSION=$(DATE_STAMP)-$(GIT_SHORT)
BOX_NAME=ubuntu-18.04-amd64-$(BOX_VERSION)
BOX_FILE=$(BOX_NAME).box
S3_BUCKET=s3://lighthouse-labs-ca
S3_ROOT_PATH=vagrant
S3_PATH=$(S3_ROOT_PATH)/$(BOX_VERSION)
S3_ARTIFACT_BUCKET_PATH=$(S3_BUCKET)/$(S3_ROOT_PATH)
S3_BUCKET_PATH=$(S3_BUCKET)/$(S3_PATH)
S3_BOX_NAME=$(BOX_NAME).box


info:
	@echo "DATE_STAMP: ${DATE_STAMP}"
	@echo "GIT_SHORT: ${GIT_SHORT}"

pillar: artifacts
	echo "build_date: $(shell cat ${ARTIFACTS_PATH}/date)" > ./pillar/build.sls
	echo "build_hash: $(shell cat ${ARTIFACTS_PATH}/git_short)" >> ./pillar/build.sls

artifacts:
	install -d "${ARTIFACTS_PATH}"
	echo "${DATE_STAMP}" >  ${ARTIFACTS_PATH}/date
	echo "${GIT_SHORT}" >  ${ARTIFACTS_PATH}/git_short
	echo "${DATE_STAMP}-${GIT_SHORT}" > ${ARTIFACTS_PATH}/latest

build-pre: artifacts pillar

build: build-pre
	packer build -only=virtualbox-iso $(PACKER_FILE)
	mv ${ARTIFACTS_PATH}/ubuntu-18.04-amd64.box ${ARTIFACTS_PATH}/${BOX_FILE}

build-docker: pillar
	packer build -only=docker $(PACKER_FILE)

clean:
	# @vagrant box remove $(BOX_NAME) || /usr/bin/true
	@rm -rf output-virtualbox-iso
	@rm -rf ${ARTIFACTS_PATH}
	@rm -rf Vagrantfile

install:
ifeq ($(strip $(shell vagrant box list | grep '${BOX_NAME}')),)
	vagrant box add --name $(BOX_NAME) ${ARTIFACTS_PATH}/$(BOX_FILE)
else
	echo "Box already installed"
endif

run: vagrantfile install
	cp ${ARTIFACTS_PATH}/Vagrantfile ./Vagrantfile
	vagrant up
	vagrant ssh

vagrantfile: Vagrantfile.template
	cat Vagrantfile.template | sed 's/BOX_NAME/$(subst /,\/,$(BOX_NAME))/g' | sed 's/BOX_CHECKSUM/$(shell shasum -a 256 $(ARTIFACTS_PATH)/$(BOX_FILE)| cut -c -64)/g' | sed 's/BOX_PATH/$(subst /,\/,$(S3_PATH))/g' | sed  's/BOX_FILE/$(S3_BOX_NAME)/g' > ${ARTIFACTS_PATH}/Vagrantfile

upload: vagrantfile
	s3cmd put -P ${ARTIFACTS_PATH}/$(BOX_FILE) $(S3_BUCKET_PATH)/$(S3_BOX_NAME)
	s3cmd put -P ${ARTIFACTS_PATH}/Vagrantfile $(S3_BUCKET_PATH)/Vagrantfile
	# s3cmd put -Pf ${ARTIFACTS_PATH}/Vagrantfile $(S3_ARTIFACT_BUCKET_PATH)/Vagrantfile
	# s3cmd put -Pf ${ARTIFACTS_PATH}/latest $(S3_ARTIFACT_BUCKET_PATH)/latest

reset: clean build
