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
golunch)
  echo "Running for lunch..."
  echo "Killing Skype"
  pkill skype
  echo "Killing Submile Text"
  pkill sublime
  echo "Killing Chrome"
  pkill chrome
  gnome-screensaver-command -l
  ;;
blast)
  echo "Play all mp3 tracks in directory " $2
  if [ -z "$2" ]; then
    echo "No directory specified"
  else
    vlc $2/*.mp3 /dev/null &
  fi
  ;;
ytaudio)
  if [ -z "$2" ]; then
    echo "YouTube video URL must be provided"
  else
    echo "Downloading audio for url:" $2
    if [ -z "$3" ]; then
      output_directory='/home/blackwolf'
    else
      output_directory=$3
    fi
    echo "Saving audio to directory: " $output_directory
    youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 -o "$output_directory/%(title)s.%(ext)s" $2  
  fi
  ;;
webcapture)
  if [ -z "$2" ]; then
    echo "Website URL must be provided"
  else
    capture_url=$2
    if [ -z "$3" ]; then
      output_path=$PWD/'screenshot.png'
    fi

    if [ -z "$4" ]; then
      screenshot_widh='1280'
    else
      screenshot_widh=$4
    fi

    if [ -z "$5" ]; then
      screenshot_height='720'
    else
      screenshot_height=$5
    fi


    echo "Capturing $capture_url and saving to $output_path"
    phantomjs path_to_script.js $capture_url $output_path $screenshot_widh $screenshot_height
  fi
  ;;
countfiles)
  if [ -z "$2" ]; then
    directory=$PWD
  else
    directory=$2
  fi
  
  if [ -z "$3" ]; then
    echo "Total files in:" $directory
    find $directory -type f | wc -l
  else
    echo "Total" $3 "files in:" $directory
    find $directory -name "*.$3" | wc -l
  fi
  ;;
countfilesbulk)
  echo "Counting files in list of directories in file:" $2
  while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "Total files in $line:" 
    find $line -type f | wc -l 
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
big_dogs)
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