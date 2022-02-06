#!/bin/sh

# Check port
if [ $INPUT_PORT != "rp2" ]; then
    echo "Only the rp2 port is current supported" 1>&2
    exit 1
fi

apt install gcc-arm-none-eabi -y

git clone git@github.com:micropython/micropython.git ~/micropython

make -C ~/micropython/mpy-cross
make -C ~/micropython/ports/$INPUT_PORT submodules