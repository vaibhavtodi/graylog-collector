#!/bin/sh
exec 2>&1

export JAVA=/usr/lib/jvm/java-7-oracle
export JAVA_HOME=/usr/bin/java

# Setting all Java options
export GRAYLOG_SERVER_JAVA_OPTS="-Xms1g -Xmx1500m -XX:NewRatio=1 -XX:PermSize=128m -XX:MaxPermSize=256m -server -XX:+ResizeTLAB -XX:+UseConcMarkSweepGC -XX:+CMSConcurrentMTEnabled -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC -XX:-OmitStackTraceInFastThrow"

# Starting the  Graylog-Server Service
#exec /usr/bin/java -Xms1g -Xmx1g -XX:NewRatio=1 -XX:PermSize=128m -XX:MaxPermSize=256m -server -XX:+ResizeTLAB -XX:+UseConcMarkSweepGC -XX:+CMSConcurrentMTEnabled -XX:+CMSClassUnloadingEnabled -XX:+UseParNewGC -XX:-OmitStackTraceInFastThrow -jar -Dlog4j.configuration=file:///etc/graylog/server/log4j.xml -Djava.library.path=/usr/share/graylog-server/lib/sigar -Dgraylog2.installation_source=deb /usr/share/graylog-server/graylog.jar server -f /etc/graylog/server/server.conf -np
exec /usr/bin/java $GRAYLOG_SERVER_JAVA_OPTS -jar -Dlog4j.configuration=file:///etc/graylog/server/log4j.xml -Djava.library.path=/usr/share/graylog-server/lib/sigar -Dgraylog2.installation_source=deb /usr/share/graylog-server/graylog.jar server -f /etc/graylog/server/server.conf -np
