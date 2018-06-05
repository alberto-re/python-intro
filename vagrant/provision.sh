#!/usr/bin/env bash

# Dependencies needed for CentOS 7.2
sudo yum -y install git PyYAML python-jinja2 python-setuptools

if [ -d ansible ]; then
  # '-C' option is not available on all Git versions
  cd ansible && git pull && cd -
else
  git clone --recursive https://github.com/ansible/ansible
fi

# Let's do the trick
sudo -s && \
  source ansible/hacking/env-setup && \
  ansible-playbook /vagrant/playbook.yml --connection=local -i localhost,
