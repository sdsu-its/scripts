#!/bin/bash
# Fetch the latest version of a website from github and copy it to a folder.
###############################################################################

GITHUBURL="https://codeload.github.com/sdsu-its/staff-new-tab/zip/master"
REPONAME="staff-new-tab"
WEBPATH="/home/me/its/public_html/Staff-Start/"

mkdir tmp
cd tmp
curl $GITHUBURL --output master.zip --silent -k
unzip -qq master.zip

chmod 0744 *
cp -rf $REPONAME"-master/." $WEBPATH
cd ..
rm -rf tmp
