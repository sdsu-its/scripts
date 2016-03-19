import sys


def sanitze(s):
    return s.replace("'", "")


csvFile = sys.argv[1]

userList = open(csvFile)
sqlFile = open("users.sql", "w")

# Read User List
line = userList.readline()
while line != "" and line is not None:
    try:
        values = line.split(",")

        # Get CSV Values for that line
        userID = values[0].strip()
        firstName = values[1].strip()
        lastName = values[2].strip()
        emailAddress = values[3].strip().lower()

        # Check if ID is valid
        if not userID.isdigit() or len(userID) > 9:
            print("ID: '%s' is not a valid ID" % userID)
            continue

        else:
            sqlLine = "REPLACE INTO users(id,first_name,last_name,email) VALUES (%s,'%s','%s','%s');\n" % (
                userID, sanitze(firstName), sanitze(lastName), sanitze(emailAddress))
            sqlFile.write(sqlLine)

    except Exception, e:
        print("Problem Processing Line '%s' - %s" % (line, e.message))

    finally:
        line = userList.readline()

# Close Files on Complete
userList.close()
sqlFile.close()
