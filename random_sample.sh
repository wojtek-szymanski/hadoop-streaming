#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Imput mode is required: test|standalone|pseudo-dist"
  exit 1
fi

data_dir="/media/wojtek/data3/hadoop"
input_dir=${data_dir}/input
output_dir=${data_dir}/output

case "$1" in
    test )
        rm -rf ${output_dir}
        mkdir ${output_dir}
        cat ${input_dir}/cite75_99.txt | python RandomSample.py 10 >${data_dir}/output/sampled_output.txt
        exit 0
        ;;

    standalone )
        rm -rf ${output_dir}
        ;;

    pseudo-dist )
        # HDFS
        input_dir="input"
        output_dir="output"
        ;;

    *)
        echo "Unsupported input mode, allowed values are: test|standalone|pseudo-dist"
        exit 1
        ;;
esac

${HADOOP_HOME}/bin/hadoop jar ${HADOOP_HOME}/share/hadoop/tools/lib/hadoop-streaming-2.7.1.jar \
-D mapred.reduce.tasks=1 \
-input ${input_dir} \
-output ${output_dir} \
-mapper "RandomSample.py 10" \
-file RandomSample.py