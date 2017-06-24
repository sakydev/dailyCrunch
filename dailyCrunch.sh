#!/bin/bash

case "$1" in

# Count number of lines matches
help) 
  echo "List of paramters: "
  echo "command: svnupdate file_path.txt : file_format: server_user_name|server_ip|server_pass|directory_to_update"
  ;;
svnupdate)
  echo "Bulk svn update of servers in file:" $2
  while IFS='' read -r line || [[ -n "$line" ]]; do
    server_user=$(echo $line| cut -d'|' -f 1)
    server_ip=$(echo $line| cut -d'|' -f 2)
    server_pasword=$(echo $line| cut -d'|' -f 3)
    server_directory=$(echo $line| cut -d'|' -f 4)
    echo "Porcessing server :" $server_ip "as user :" $server_user "to update directory :" $server_directory
    sshpass -p $server_pasword $server_user@$server_ip svn update $server_directory

  done < "$2"
  ;;
hardstart)
  echo "Restarting Apache & MySQL"
  service apache2 restart && service mysql restart
  ;;
phpproc) 
  echo "List of active PHP processes"
  ps aux | grep php
  ;;
pythonproc) 
  echo "List of active Python processes"
  ps aux | grep python
    ;;
proc)
  if [ -z "$2" ]; then
    echo "Invalid second paramter"
  else
    echo "List of active $2 processes"
    ps aux | grep $2
  fi
  ;;
dirsize)
  echo "Biggest $3 files in $2 directory"
  du -a $2 | sort -n -r | head -n $3
  ;;
syncservers)
  echo "Backing up and synching directory: " $3 " with servers in file:" $2
  backup_directory=$4
  directory_to_sync=$3
  zip -r 
  while IFS='' read -r line || [[ -n "$line" ]]; do
    server_user=$(echo $line| cut -d'|' -f 1)
    server_ip=$(echo $line| cut -d'|' -f 2)
    server_pasword=$(echo $line| cut -d'|' -f 3)
    remote_server_directory=$(echo $line| cut -d'|' -f 4)
    echo "Porcessing server :" $server_ip "as user :" $server_user "to synch directory :" $remote_server_directory
    sshpass -p $server_pasword $server_user@$server_ip rm -rf $remote_server_directory
    sshpass -p $server_pasword scp -r $directory_to_sync $server_user@$server_ip:$remote_server_directory
  done < "$2"
  ;;
esac