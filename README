# What is it?
This is a guide and scripts for running an analogue of lofi radio 24/7 on your server, which will work regardless of your computer :)

# Guide to setting up youtube radio
This is not an original development, but a compilation from other projects, links to them are below


## Help

If you have any problems, you can ask questions in the [telegram](https://t.me/joinchat/FYOaAF_8mp8pgDjf) or [discord](https://discord.com/invite/4CKq3JB) channels [rikani](https: //rikani.ru) NOTE THAT GROUS ARE IN RUSSIAN!

## Start

Installation requires:

* VPS server with [Ubuntu](https://ubuntu.com/download) 20.04 (but should work on other versions too) Dietpi Tested and working
* Management Console - [Putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe)
* File transfer program - [WinSCP](https://winscp.net/eng/download.php)

### Training
Download and install - [Putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) and [WinSCP](https://winscp.net/eng/download.php)

The installation is standard, click "Next, Next" in the wizard and you're done.


After purchasing a VPS (server), you need to go to it and install the programs necessary for work, for this we launch putty and drive in the address:

![screen01](https://rikani.ru/files/putty01.png)

Then the login and password, **stars are not displayed**, this is normal, **PASSWORD IS ENTERED**

![screen01](https://rikani.ru/files/putty02.png)

We go under your user, most often it is **ubuntu**, but there may be something else that will give you hosting.

Create folders in which we will then put videos and tracks
```
mkdir ~/music; mkdir ~/video
```

Next, go under the Administrator, for this you need to run the command below. You may need to enter the password again, the asterisks are not displayed again.
```
sudo su
```

Installing basic programs for customization
```
apt update; apt install -y git ansible
```

And download scripts for configuration
```
cd; git clone https://github.com/reyvonger/rikani_radio.git
```

Now we need to upload video and audio files to the server, for this we use [WinSCP](https://winscp.net/eng/download.php)

We connect to the server, specify the transfer protocol ** SCP **, the host name is the server address, the hosting should give you the user and password

![screen03](https://rikani.ru/files/scp01.png)

* The video must be called **video.mp4** and placed in the video folder. yes, video.mp4 in video folder :)
* Music must be in **mp3** format and must not start with special characters like: % - " @ and similar
* You need to put it in the /home/%USERNAME%/ directory in the music and video folders. USERNAME will most likely be ubuntu (example: /home/ubuntu/music), but it may be different.


![screen04](https://rikani.ru/files/scp02.png)

After downloading the video and tracks, we return to [Putty] (https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe) and drive in the following command, You need to change YT_TOKEN to your token from your personal account [youtube ](https://studio.youtube.com) and change user to the username given to you by your hosting

![screen05](https://rikani.ru/files/token.png)

```
cd ~/rikani_radio && ansible-playbook -i inventory.ini main.yaml -e user=ubuntu -e YT_TOKEN=e3gu-424p-fzj4-zha0-2v2b
```
* YT_TOKEN= - this part must be **left**, this is not a token, the token comes after the **equals** symbol
* You must run **sudo su** before running this command
* After executing this command, the stream will start on your youtube account, if you want to add tracks or change videos - just change them and run the last command again.
* After executing the script, the music is restarted


## Setting
With the **-e key=value** option, some settings can be changed.
Below are examples of default values:

* -e user=root - if your user is not **root**, sometimes hoster can give login **ubuntu**
* -e VBR=10000k - bitrate
* -e FPS=25 - frames per second
* -e QUAL=veryfast - stream quality (supported by ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow)
* -e crf=25 - 0 to 51, compression range where 51 is the worst quality and 0 is lossless. 25 is the optimal value. more details [in ffmpeg documentation](https://trac.ffmpeg.org/wiki/Encode/H.264)
* -e track_output=true - display the track name on the screen
* -e fontcolor=white - font color for track output
* -e fontsize=24 - font size
* -e boxcolor=black@0.5 - color of the frame with the track name
* -e boxborderw=5 - the size of the frame with the track name
* -e x=0 - position of the block with the track name along the X axis
* -e y=0 - position of the block with the name of the track along the Y axis
* -e youtube_protocol=rtmp - YouTube streaming protocol, supported values ​​- rtmp, hls. it is recommended to use hls.


## Used projects

* [docker-music-stack](https://github.com/VITIMan/docker-music-stack/) - Victoriano Navarro
* [docker-ffmpeg](https://github.com/jrottenberg/ffmpeg) - Julien Rottenberg

## The authors

* **Sonya RIKANI** - *Idea* - [rikani.ru](https://rikani.ru)
* **Vladimir Pankin** - *Implementation* - [pankin.org](https://pankin.org) 
* **Zarigata** - *Translation* 
