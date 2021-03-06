#!/usr/bin/env bash

if [ "$(uname)" == "Linux" ]; then
  sudo apt-get install postgresql -y
  sudo /etc/init.d/postgresql restart
  sudo -u postgres createuser -s $(whoami); createdb $(whoami); exit 0
fi

psql -d template1 -c 'create extension hstore;'; exit 0
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
