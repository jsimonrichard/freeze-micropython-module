#!/bin/bash

cp -r $INPUT_PATH ~/micropython/ports/$INPUT_PORT/modules/$INPUT_MODULE
make -C ~/micropython/ports/$INPUT_PORT

local buildDir=("~/micropython/ports/$INPUT_PORT/build-*/firmware.uf2")
cp $buildDir/firmware.uf2 $INPUT_FILENAME