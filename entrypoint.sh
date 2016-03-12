#!/bin/sh
exec 2>&1

export JAVA=/usr/lib/jvm/java-7-oracle
export JAVA_HOME=/usr/bin/java

# Starting the Graylog-Collector Service
exec /usr/bin/java -Xms12m -Xmx64m -Djava.library.path=/usr/share/graylog-collector/lib/sigar -Dlog4j.configurationFile=/etc/graylog/collector/log4j2.xml -jar /usr/share/graylog-collector/graylog-collector.jar run -f /etc/graylog/collector/collector.conf
