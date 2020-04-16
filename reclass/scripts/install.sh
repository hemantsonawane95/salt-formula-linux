#!/bin/bash

export HOSTNAME=master # might need to be changed
export DOMAIN="ceph.test" # might need to be changed
export CLUSTER_NAME=cloud
git clone https://github.com/salt-formulas/salt-formulas-scripts /srv/salt/scripts

export FORMULAS_SOURCE="pkg"
export EXTRA_FORMULAS="linux git salt reclass openssh ntp rsyslog nginx keepalived"
export MASTER_HOSTNAME=${HOSTNAME}.${DOMAIN}
export MINION_ID=${HOSTNAME}.${DOMAIN}
export RECLASS_IGNORE_CLASS_NOTFOUND=False
export RECLASS_ADDRESS="git@gitlab.iot.tcpisek.cz:cloud-models/vpc2.git"
export RECLASS_VERSION="master"
export SALT_MASTER_IP=10.12.0.206
export MASTER_IP=10.12.0.206

source /srv/salt/scripts/bootstrap.sh
#source_local_envs
/srv/salt/scripts/bootstrap.sh

