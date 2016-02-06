#!/bin/bash
# Fetch the latest version of FIT-Welcome, build it and deploy the WAR to the
# TomCat Server.
#
# RUN AS TOMCAT USER - ensures correct permissions
###############################################################################

cd /home/tomcat/fit-welcome;

# Pull the latest code from the GitHub Repo
git pull;

# Build a fresh WAR file
./gradlew clean;
./gradlew build;
./gradlew war;

# Move the built war file to the WebApps folder in TomCat
cp build/libs/fit-welcome.war /usr/share/tomcat/webapps/fit_welcome.war;

# Clean up the folder after build
./gradlew clean;
