#!/usr/bin/env sh
#redownload music playlist
#WARNING takes fucking forever
CURDIR=$(pwd)	#get our current directory
mkdir $HOME/Music/downloaded_tempdir
cd $HOME/Music/downloaded_tempdir
youtube-dl https://www.youtube.com/playlist\?list=$PLAYLIST_UUID\
	 --yes-playlist\
	 --no-call-home\
	 --ignore-config\
	 --no-overwrites\
	 --verbose
	# --embed-thumbnail - screwed for now
cp ../0\ convert.sh .
./0\ convert.sh	#run a conversion script
mv --no-clobber ./*mp3 --target ../
cd ..
rm --recursive downloaded_tempdir
echo \'Music placed in $USER/Music.\'
cd $CURDIR	#go back to out current directory
