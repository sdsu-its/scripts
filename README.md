Scripts
========
We do a lot of automatization at ITS and we love CRON! The scripts in this repo
(which are described below) do most of the heavy lifting on [Morden](http://morden.sdsu.edu)
our small-scale production server.

#### `cal_to_sheets.js`
Google Sheets Script that fetches calendar events from a list of Google CalendarIDs
and populates them into the currently selected Google Sheet.

#### `cleanDeploy.py`
Using Continuous Deployment on TomCat, old versions can build up and take up valuable
disk space, especially if you deploy often and/or if you have large WAR files. This script removes the old war files and their unarchived folders, keeping only the newest N versions.

Takes 3 arguments, [webapps path, context name, versions to keep]

Example: `./cleanDeploy.py /usr/share/tomcat/webapps/ fit_welcome 2`

#### `db-maint.sh`
Maintains MySQL by Backing up all databases and analyzing, checking and optimizing
all primary (user created) databases. The DB is locked while some of the SQL functions
are run to ensure no data is lost. Run at a time where you will have no traffic.

#### `load_users.py`
Convert Users CSV to SQL code for [FIT Welcome](https://github.com/sdsu-its/fit-welcome).
IDs must be 9 digits long and be numeric, all others a thrown out. Uses `REPLACE`
statements to keep unsubscribe data intact for previous users.

#### `update_start_pages.sh`
Update PHP start pages to the latest code from GitHub. Requires `git`.
- [Faculty New Tab Repo](https://github.com/sdsu-its/fit-new-tab)
- [Staff New Tab Repo](https://github.com/sdsu-its/staff-new-tab)

#### ~~`update-fit-welcome.sh`~~ *Deprecated*
Update [FIT Welcome](https://github.com/sdsu-its/fit-welcome) to the latest build
from GitHub. Builds and Deploys the War File to the TomCat Server.

__Deprecated as of April, 2016:__ This script works, and even checks unit tests, but a Build Server (like [TeamCity](https://www.jetbrains.com/teamcity/)) does a better job.