#!/bin/bash
# Fetch the latest version of FIT-Welcome, build it and deploy the WAR, Alerts and
# FollowUp Jar to the Server.
#
# Jars are deployed to the Scripts Directory and WAR is deployed to the WebApps folder
# in TomCat.
#
# RUN AS TOMCAT USER - to ensures correct permissions and ownership
###############################################################################

echo "Deploying Fit-Welcome -- WAR file, Follow-Up, and Alerts";

cd /home/tomcat/fit-welcome;

# Pull the latest code from the GitHub Repo
git pull;

# ===== Build WAR =====
echo "Building WAR";
./gradlew clean;
./gradlew build;
./gradlew war;

# Move the built war file to the WebApps folder in TomCat
cp build/libs/fit-welcome.war /usr/share/tomcat/webapps/fit_welcome.war;
echo "WAR File Copied to WebApps Folder";

# Clean up the folder after build
./gradlew clean;


#  ===== Build FollowUp =====
cd followup;

# Build FatJar
echo "Building FatJar for FollowUp";
./gradlew clean;
./gradlew build;
./gradlew fatJar;

# Move the Jar to the Scripts Folder
cp build/libs/followup-all-1.0.jar /srv/scripts/fit-welcome-followup/followup.jar
echo "FollowUp Jar Copied to Scripts Folder";

# Clean up the folder after build
./gradlew clean;

cd ..;

# ====== Build Alerts =====
cd alerts;

# Build FatJar
echo "Building FatJar for Alerts";
./gradlew clean;
./gradlew build;
./gradlew fatJar;

# Move the Jar to the Scripts Folder
cp build/libs/alerts-all-1.0.jar /srv/scripts/fit-welcome-alerts/alerts.jar
echo "Alerts Jar Copied to Scripts Folder";

# Clean up the folder after build
./gradlew clean;

echo "Deploy Completed Successfully!";
