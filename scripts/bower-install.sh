#!/usr/bin/bashir

cd ..

bower install

# Common server and client libs
readonly COMMON_LIB_DIR=autosaur/client/lib/external
mkdir -p "${COMMON_LIB_DIR}"
cp --verbose \
    bower_components/blueimp-md5/js/md5.js \
    "${COMMON_LIB_DIR}"


