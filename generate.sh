#!/usr/bin/env ash

# -p - proto file(s)
# -d - destination dir
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -p)
    PROTO_FILES="$2"
    shift # past argument
    ;;
    -d)
    DESTINATION_DIR="$2"
    shift # past argument
    ;;
esac
shift # past argument or value
done

$CODE_HOME/node_modules/protobufjs/bin/pbjs $PROTO_FILES > $DESTINATION_DIR/proto.json
node node_modules/proto2ts/command.js --file $DESTINATION_DIR/proto.json > $DESTINATION_DIR/proto.d.ts
