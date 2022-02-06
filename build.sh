#!/bin/bash

cp -r $INPUT_PATH ~/micropython/ports/$INPUT_PORT/modules/$INPUT_MODULE
make -C ~/micropython/ports/$INPUT_PORT

buildDir=("$HOME/micropython/ports/$INPUT_PORT/build-*")
cp $buildDir/firmware.uf2 $INPUT_FILENAME