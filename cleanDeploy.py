#!/usr/bin/env python
import os
import re
import sys
from os import listdir

path = sys.argv[1]
fileName = sys.argv[2]
numberToKeep = int(sys.argv[3])

versions = []

for f in listdir(path):
    if f.__contains__('##'):
        match = re.match(fileName + '##(\d*)', f)
        if match is not None:
            versionNum = match.group(1)
            if versionNum is not None:
                versions.append(versionNum)
        else:
            print("No Matches Found")

versions.sort()
if not path.endswith('/'):
    path += '/'

if len(versions) > numberToKeep:
    print(versions[:numberToKeep - 2])
    for v in versions[:numberToKeep - 2]:
        filePath = path + fileName + '##' + v + ".war"
        print('Removing "%s"' % filePath)
        os.remove(filePath)
