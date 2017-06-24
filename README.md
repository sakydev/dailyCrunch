# What is dailyCrunch?
A simple BASH file that can speedup daily tasks for developer / sysadmin.

# Why dailyCrunch?
The sole reason for creation of this project is my utter hatred toward repitiive tasks :P

There are a lot of tasks that I encounter multiple times a day so every time I have to do something twice, I add it to this file and I don't have to perform task next time. 

Even though I created it for myself, I'm pretty sure there are parts of it that can be useful for other developers too. I'll keep adding more commands in future.

# Usage
#### svnupdate
Update SVN across unlimited servers

Notice: Requires sshpass on executing server and svn on remote servers
```
dailyCrunch svnupdate serverCreds.txt
```
serverCreds.txt Format: Unlimited servers, one server per line.

*server_user|server_ip|server_password|directory_to_update_on_remote_server* 

#### golunch
Closes Sublime, Chrome, Skype and locks screen

```
dailyCrunch golunch
```
#### blast
Play all MP3 tracks in given directory

Notice: Requires VLC, Desktop only
``` 
dailyCrunch blast path_to_directory
```
#### ytaudio
Download MP3 audio for a YouTube video

Notice: Requires YouTube-dl, FFMPEG
```
dailyCrunch ytaudio youtube_video_url path_to_output_directory
```
#### webcapture
#### countfiles
#### countfilesbulk
#### hardstart
#### phpproc
#### pythonproc
#### proc
#### dirsize
#### syncservers
