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
serverCreds.txt format: unlimited servers, one server per line.

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
Capture a remote web page

Notice: Requires PhantomJS
```
dailyCrunch webcapture url_to_capture output_path screenshot_width screenshot_height
```
#### countfiles
Count total files in given directory or with specifc extension

Find all files:
```
dailyCrunch countfiles directory_path
```
Find files with specific extension:
```
dailyCrunch countfiles directory_path file_extension
```
#### countfilesbulk
Count files in a list directories in text file, one directory per line
```
dailyCrunch countfilesbulk path_to_list_file.txt
```
#### hardstart
Restart Apache & MySQL
```
dailyCrunch hardstart
```
#### phpproc
List all active PHP processes
```
dailyCrunch phpproc
```
#### pythonproc
List all active Python processes
```
dailyCrunch pythonproc
```
#### proc
List all active processes for any program
```
dailyCrunch proc program_name
```
#### bigdogs
Find biggest X number of files in given directory
```
dailyCrunch bigdogs number_of_big_files directory_to_search_in
```
#### syncservers
Take backup of a specific directory and synch with unlimited servers
```
dailyCrunch synchservers file_with_server_info.txt directory_to_sync directory_to_save_backup_into
```
file_with_server_info.txt format: unlimited servers, one server per line 
*server_user|server_ip|server_password|server_remote_directory*
