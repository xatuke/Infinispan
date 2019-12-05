#!/bin/bash

 

source "`dirname "$0"`/functions.sh"

 

CLIENT_HOME=/home/jnikom/Kiva/Downloads/Java/Infinispan/dev/HotRod_01

 

add_classpath "${ISPN_HOME}"/*.jar

add_classpath "${ISPN_HOME}/lib"

add_classpath "${ISPN_HOME}/modules/memcached"

add_classpath "${ISPN_HOME}/modules/hotrod"

add_classpath "${ISPN_HOME}/modules/websocket"

 

add_jvm_args $JVM_PARAMS

add_jvm_args '-Djava.net.preferIPv4Stack=true'

add_jvm_args '-Djgroups.bind_addr=10.100.9.28'

add_jvm_args '-Djgroups.udp.mcast_addr=228.10.10.10'

add_jvm_args '-Djgroups.udp.mcast_port=45588'

add_jvm_args '-Djgroups.udp.ip_ttl=5'

add_jvm_args '-Xms512m'

add_jvm_args '-Xmx3g'

 

# RHQ monitoring options

add_jvm_args '-Dcom.sun.management.jmxremote.ssl=false'

add_jvm_args '-Dcom.sun.management.jmxremote.authenticate=false'

add_jvm_args -Dcom.sun.management.jmxremote.port=$(find_tcp_port)

 

# Workaround for JDK6 NPE: http://bugs.sun.com/view_bug.do?bug_id=6427854

add_jvm_args '-Dsun.nio.ch.bugLevel=""'

 

# Sample JPDA settings for remote socket debugging

#add_jvm_args "-Xrunjdwp:transport=dt_socket,address=8686,server=y,suspend=n"

 

# LOG4J configuration

LOG4J_CONFIG=file:///${CLIENT_HOME}/log4j.properties

 

add_program_args "$@"

 

start org.infinispan.server.core.Main
