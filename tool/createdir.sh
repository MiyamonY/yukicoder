#! /bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ $# -ne 1 ];then
    echo "createdir.sh needs arguments."
    echo "createdir.sh ContestNo"
    exit 1
fi

mkdir -p "${SCRIPT_DIR}/../problems/$1"
cargo new "${SCRIPT_DIR}/../problems/$1/01" --name "yukicoder_$1" --vcs none
