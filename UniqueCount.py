#!/usr/bin/env python

import sys

for line in sys.stdin:
    keyIndex = int(sys.argv[1])
    valueIndex = int(sys.argv[2])
    fields = line.split(",")
    print("UniqValueCount:" + fields[keyIndex] + "\t" + fields[valueIndex])
