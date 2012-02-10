#!/bin/bash

# Simple script create a mapping file for the iostat cacti extension.
# It simply lists the items in /dev/mapper, grabbing the minor device
# number for each, and writes it out to a file that will then be read
# by the perl script used by net-snmp.

OUTTMP=/tmp/iostat-mapping.tmp
OUTFILE=/tmp/iostat-mapping.cache

ls -l /dev/mapper | grep -v control | awk '{ print "dm-" $6 "," $10 }' >> $OUTTMP
mv -f $OUTTMP $OUTFILE
