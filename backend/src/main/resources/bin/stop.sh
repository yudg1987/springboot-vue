#!/bin/sh

#####################
# resolve links - $0 may be a softlink
#####################

PRG="$0"
while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

PRGDIR=`dirname "$PRG"`
EXECUTABLE=ctl.sh
CONSOLE_OUT=$PRGDIR/../logs/@project.artifactId@.log

if [ ! -x "$PRGDIR"/"$EXECUTABLE" ]; then
	echo "Cannot find $PRGDIR/$EXECUTABLE"
	echo "The file is absent or does not have execute permission"
	echo "This file is needed to run this program"
exit 1
fi

exec "$PRGDIR"/"$EXECUTABLE" stop
echo "Stopped success!"