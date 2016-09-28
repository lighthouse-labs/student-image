.PHONEY: reset clean up upload vagrantfile

DATE_STAMP=$(shell date +%Y%m%d-%H%M%S)
GIT_SHORT=$(shell git rev-parse --short HEAD)
PACKER_FILE=lighthouse-ubuntu-16.04-amd64.json
BOX_NAME=ubuntu-16.04-amd64
BOX_FILE=$(BOX_NAME).box
BOX_VERSION=$(DATE_STAMP)-$(GIT_SHORT)
S3_BUCKET=s3://lighthouse-labs-ca
S3_PATH=vagrant/$(BOX_VERSION)
S3_BUCKET_PATH=$(S3_BUCKET)/$(S3_PATH)
S3_BOX_NAME=$(BOX_NAME).box

pillar: ./pillar/build.sls
	echo "build_date: ${DATE_STAMP}" > ./pillar/build.sls
	echo "build_hash: ${GIT_SHORT}" >> ./pillar/build.sls

build: pillar
	packer build -only=virtualbox-iso $(PACKER_FILE)

build-docker: pillar
	packer build -only=docker $(PACKER_FILE)

clean:
	rm $(BOX_FILE) || /usr/bin/true
	@vagrant box remove $(BOX_NAME) || /usr/bin/true
	@rm Vagrantfile || /usr/bin/true
	@rm -rf output-virtualbox-iso

install:
	vagrant box add --name $(BOX_NAME) $(BOX_FILE)

vagrantfile: Vagrantfile.template
	cat Vagrantfile.template | sed 's/BOX_NAME/$(subst /,\/,$(BOX_NAME))/g' | sed 's/BOX_CHECKSUM/$(shell shasum -a 256 $(BOX_FILE)| cut -c -64)/g' | sed 's/BOX_PATH/$(subst /,\/,$(S3_PATH))/g' | sed  's/BOX_FILE/$(S3_BOX_NAME)/g' > Vagrantfile

upload: vagrantfile
	s3cmd put -P $(BOX_FILE) $(S3_BUCKET_PATH)/$(S3_BOX_NAME)
	s3cmd put -P Vagrantfile $(S3_BUCKET_PATH)/Vagrantfile

reset: clean build
