#redownload music playlist
#WARNING takes fucking forever
mkdir ~/Music/downloaded_tempdir
cd ~/Music/downloaded_tempdir
youtube-dl https://www.youtube.com/playlist\?list=PLU6u2aLdEBuPrq2NydvfyTFW6nBOSr6c3\
	 --yes-playlist\
	 --no-call-home\
	 --ignore-config\
	 --no-overwrites
	# --embed-thumbnail - screwed for now
cp ../0\ convert.sh .
./0\ convert.sh
mv --no-clobber ./* --target ../
cd ..
rm --recursive downloaded_tempdir
echo \'Music placed in $USER/Music.\'
cd
