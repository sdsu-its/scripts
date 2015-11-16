#!/bin/bash
# Fetch the latest version of a website from github and copy it to a folder.
###############################################################################

GITHUBURL="https://codeload.github.com/sdsu-its/fit-new-tab/zip/master"
REPONAME="fit-new-tab"
WEBPATH="/home/me/its/public_html/FIT/"

mkdir tmp
cd tmp
curl $GITHUBURL --output master.zip --silent -k
unzip -qq master.zip

chmod 0644 *
cp -rf $REPONAME"-master/." $WEBPATH
cd ..
rm -rf tmp
