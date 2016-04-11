import os
import re
import shutil
import sys
from os import listdir

path = sys.argv[1]
fileName = sys.argv[2]
numberToKeep = int(sys.argv[3])

versions = []

for f in listdir(path):
    if f.__contains__('##'):
        versionNum = re.match(fileName + '##(\d*)', f).group(1)
        if versionNum is not None:
            versions.append(versionNum)

versions.sort()
if not path.endswith('/'):
    path += '/'

for v in versions[:numberToKeep - 1]:
    fileName = path + fileName + '##' + v
    print 'Removing "%s"' % fileName
    os.remove(fileName + '.war')

    shutil.rmtree(fileName)
