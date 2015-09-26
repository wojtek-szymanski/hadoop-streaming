#!/usr/bin/env bash

${HADOOP_HOME}/bin/hdfs dfs -rm -f -r input output
${HADOOP_HOME}/bin/hdfs dfs -put /media/wojtek/data3/hadoop/apat63_99.txt input

${HADOOP_HOME}/bin/hadoop jar ${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-streaming-2.7.1.jar \
-input input \
-output output \
-mapper "AttributeCount.py 1" \
-reducer aggregate \
-file AttributeCount.py
