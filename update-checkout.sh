#!/bin/bash
# Fetch the latest version of the Video Inventory Management System, build it and deploy
# the WAR to the Server.
#
# RUN AS TOMCAT USER - to ensures correct permissions and ownership
###############################################################################

echo "Deploying Video-INV -- WAR file";

cd /home/tomcat/video-inv;

# Pull the latest code from the GitHub Repo
git pull;

# ===== Build WAR =====
echo "Building WAR";
./gradlew clean;
./gradlew build;
./gradlew war;

# Move the built war file to the WebApps folder in TomCat
cp build/libs/video_inv.war /usr/share/tomcat/webapps/video_inv.war;
echo "WAR File Copied to WebApps Folder";

# Clean up the folder after build
./gradlew clean;

echo "Deploy Completed Successfully!";
