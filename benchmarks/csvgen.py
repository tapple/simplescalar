#!/usr/bin/python

import os, os.path
import sys
import string

for arg in sys.argv[1:]:
    print arg

def jumpToStats(aFile):
    """Read forward in file to the beginning of the simplescalar
    statistics section"""

    for line in aFile:
        if line.strip() == "sim: ** simulation statistics **":
            return

def openStatsFile(filename, mode='rb'):
    aFile = open(filename, mode)
    jumpToStats(aFile)
    return aFile

def openStatsReader(filename, mode='r'):
    return csv.reader(openStatsFile(filename, mode))

def parseStatsLine(aString):
    tokens = aString.split()
    if not tokens:
        return None
    key, valueString = tokens[0:2]
    try:
        value = int(valueString)
    except:
        try:
            value = float(valueString)
        except:
            value = valueString
    return key, value

def statsFileIter(filename):
    try:
        aFile = openStatsFile(filename)
        for line in aFile:
            row = parseStatsLine(line)
            if not row:
                break
            yield row
    finally:
        aFile.close()

def parseFilename(filename):
    """Return the table size, associativity, and buffer size given the
    filename"""
    return [int(str.strip(string.ascii_letters + '.')) for str in
            os.path.basename(filename).split('-')[:-1]]

def csvHeader(filename):
    return ['filename', 'table size', 'table assoc', 'buffer size'] + \
        [row[0] for row in statsFileIter(filename)]

def csvRow(filename):
    return [filename] + parseFilename(filename) + \
        [row[1] for row in statsFileIter(filename)]

if __name__ == '__main__':
    import csv
    writer = csv.writer(sys.stdout)
    writer.writerow(csvHeader(sys.argv[1]))
    for arg in sys.argv[1:]:
        writer.writerow(csvRow(arg))
