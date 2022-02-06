#!/bin/sh

# Check port
if [ $INPUT_PORT != "rp2" ]; then
    echo "Only the rp2 port is currently supported" 1>&2
    exit 1
fi

if [ $CACHE_HIT == 'true' ]; then
    # Restore the gcc-arm-none-eabi package
    sudo cp --verbose --force --recursive ~/gcc-arm-none-eabi/* /

else;
    # Install arm compiler and prepare cache
    sudo apt install gcc-arm-none-eabi -y

    mkdir -p ~/gcc-arm-none-eabi
    sudo dpkg -L gcc-arm-none-eabi \
        | while IFS= read -r f; do
            if test -f $f; then
                echo $f;
            fi; 
        done \
        | xargs cp --parents --target-directory ~/gcc-arm-none-eabi/


    # Clone and setup micropython
    git clone https://github.com/micropython/micropython.git ~/micropython

    make -C ~/micropython/mpy-cross
    make -C ~/micropython/ports/$INPUT_PORT submodules
fi