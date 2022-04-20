# Local address default as below, if you have more net-interface, you must specify one
LOCAL_ADDRESS=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
#echo LOCAL_ADDRESS:$LOCAL_ADDRESS

# Solves the problem of multiple NIC
LOCAL_ADDRESS=`echo $LOCAL_ADDRESS | awk '{print $1}'`
#echo LOCAL_ADDRESS RANDOM:$LOCAL_ADDRESS

JAVA_OPTS="$JAVA_OPTS -server"
JAVA_OPTS="$JAVA_OPTS -Xms8g -Xmx8g"
JAVA_OPTS="$JAVA_OPTS -Xss512k -XX:NewSize=4917m -XX:MaxNewSize=4917m -XX:MetaspaceSize=512m -XX:MaxMetaspaceSize=512m"
JAVA_OPTS="$JAVA_OPTS -XX:+UseParNewGC -XX:ParallelGCThreads=8 -XX:MaxTenuringThreshold=9 -XX:+UseConcMarkSweepGC"
JAVA_OPTS="$JAVA_OPTS -XX:CMSInitiatingOccupancyFraction=60  -XX:+UseCMSInitiatingOccupancyOnly"
#JAVA_OPTS="$JAVA_OPTS -XX:+ScavengeBeforeFullGC -XX:+CMSParallelRemarkEnabled"
JAVA_OPTS="$JAVA_OPTS -XX:+CMSClassUnloadingEnabled -XX:SoftRefLRUPolicyMSPerMB=0"
JAVA_OPTS="$JAVA_OPTS -XX:-ReduceInitialCardMarks -XX:+CMSClassUnloadingEnabled -XX:+ExplicitGCInvokesConcurrentAndUnloadsClasses"
JAVA_OPTS="$JAVA_OPTS -Djava.nio.channels.spi.SelectorProvider=sun.nio.ch.EPollSelectorProvider"
JAVA_OPTS="$JAVA_OPTS -Dclient.encoding.override=UTF-8 -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8"
JAVA_OPTS="$JAVA_OPTS -Duser.region=CN -Duser.timezone=GMT+08"

#JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote"
#JAVA_OPTS="$JAVA_OPTS -Djava.rmi.server.hostname=0.0.0.0"
#JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=2028"
#JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
#JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"

#JAVA_OPTS="$JAVA_OPTS -Dserver.address=$LOCAL_ADDRESS"

# which spring profile will be actived
PROFILE="prod"

# standalone or cluster? true if standalone, otherwise false as cluster
STANDALONE="true"

#TMP_DIR=/tmp
#DATA_DIR=/iflytek/data
#RUN_DIR=/iflytek/run
#LOG_DIR=/iflytek/logs
#CONF_DIR=/iflytek/conf/@project.artifactId@
#FILE_ENCODING=UTF-8
