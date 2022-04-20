#!/bin/sh
# Copy to /iflytek/ci/sxs-engine-ast-rebuild.sh

# Retrieve version number
#PROC_VERSION=`curl http://192.168.65.191:8080/view/daily/job/sxs-engine-ast-daily/ws/pom.xml | grep 'SNAPSHOT</version>' | sed -e 's/[[:space:]]*<[/a-zA-Z0-9]*[[:space:]]*>//g' | awk 'NR==1{print}' | sed -e 's/\n//g'`
if [ "x$PROC_VERSION" = "x" ]; then
    PROC_VERSION=1.0.1-SNAPSHOT
fi

# Settings
PROC_DIR=/iflytek/server
HTTP_FILE=http://192.168.65.191:8080/view/智慧小海/job/@project.artifactId@-daily/lastSuccessfulBuild/artifact/target/@project.artifactId@-$PROC_VERSION-distribution.tar.gz

PROC_NAME=@project.artifactId@-$PROC_VERSION
PROC_SHORTNAME=@project.artifactId@
PROC_HOME=$PROC_DIR/$PROC_NAME

echo PROC_HOME: $PROC_HOME
echo PROC_SHORTNAME: $PROC_SHORTNAME
echo PROC_VERSION: $PROC_VERSION
echo PROC_NAME: $PROC_NAME

PROC_LINK=$PROC_DIR/$PROC_SHORTNAME
TAR_FILE=/var/tmp/$PROC_NAME.tar.gz

PROC_START=$PROC_HOME/bin/start.sh
PROC_STOP=$PROC_HOME/bin/stop.sh
PROC_CTL=$PROC_HOME/bin/ctl.sh

# if runing then stop
if [ -d "$PROC_HOME/bin" ]; then
   chmod +x $PROC_HOME/bin/*.sh
   if [ -f "$PROC_CTL" ]; then
     STATUS=`sh $PROC_CTL status`
     STATUS_RESULT=`echo $STATUS|grep 'already running'|wc -l`
     if [ ! $STATUS_RESULT = 0 ]; then
        sh $PROC_STOP
     fi     
   fi
fi

#deleted
if [ -d "$PROC_HOME" ]; then
   rm -rf $PROC_HOME
   echo $PROC_HOME removed!
fi
if [ -f "$TAR_FILE" ]; then
   rm -rf $TAR_FILE
   echo $TAR_FILE removed!
fi

#create dst folder
if [ ! -d "$PROC_DIR" ]; then
   mkdir -p $PROC_DIR
   echo $PROC_DIR created!
fi

# to base path
cd $PROC_DIR
wget -O $TAR_FILE $HTTP_FILE
mkdir -p $PROC_HOME && tar -xzf $TAR_FILE -C $PROC_HOME --strip-components 1
echo $PROC_HOME created!

# Some text replaces
#sed -i 's/^#CONF_DIR=/CONF_DIR=/g' $PROC_HOME/bin/setenv.sh

if [ -d "$PROC_HOME/bin" ]; then
   chmod +x $PROC_HOME/bin/*.sh
   sh $PROC_START
else
   echo "no shell script"
fi

rm -rf $TAR_FILE

# create link
rm -f $PROC_LINK
ln -s $PROC_HOME $PROC_LINK
echo $PROC_LINK recreated to $PROC_HOME!
