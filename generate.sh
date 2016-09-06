#!/usr/bin/env ash

# -p - proto file path
# -j - json file path
# -d - destination file path
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -p)
    PROTO_FILE="$2"
    shift # past argument
    ;;
    -j)
    JSON_FILE="$2"
    shift # past argument
    ;;
    -d)
    TS_FILE="$2"
    shift # past argument
    ;;
esac
shift # past argument or value
done

$CODE_HOME/node_modules/protobufjs/bin/pbjs $PROTO_FILE > $JSON_FILE
node node_modules/proto2ts/command.js --file $JSON_FILE > $TS_FILE
