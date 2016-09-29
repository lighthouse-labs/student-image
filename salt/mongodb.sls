

# Official Mongodb Community Edition Repo
mongodb-repo:
  pkgrepo.managed:
    - humanname: MongoDB Org Repo
    - name: "deb http://repo.mongodb.org/apt/ubuntu\ xenial/mongodb-org/3.2 multiverse"
    - file: /etc/apt/sources.list.d/mongodb-org.list
    - keyid: EA312927
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: mongodb-org

mongodb-org:
  pkg.installed:
    - pkgs:
      - mongodb-org


/lib/systemd/system/mongod.service:
  file.managed:
    - mode: 755
    - template: jinja
    - source: salt://services/mongod.service
    - require:
      - pkg: mongodb-org

mongod.service:
  service.running:
    - enable: True
    - require:
      - file: /lib/systemd/system/mongod.service
