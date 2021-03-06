#!/bin/bash

SETCOLOR_GREEN="echo -en \\E[1;32m"
SETCOLOR_NORMAL="echo -en \\E[0;39m"

pushd . &>/dev/null
cd ../cores/libretro-fbneo
cd src/burner/libretro

$SETCOLOR_GREEN && echo "Cleaning fbneo..." && $SETCOLOR_NORMAL
make clean &>/dev/null

$SETCOLOR_GREEN && echo "Building fbneo..." && $SETCOLOR_NORMAL
make -j`nproc` &>/dev/null
strip -s fbneo_libretro.dll
cp fbneo_libretro.dll ../../../../../retroarch_dist/cores/

$SETCOLOR_GREEN && echo "Cleaning fbneo..." && $SETCOLOR_NORMAL
make clean &>/dev/null

popd &>/dev/null

$SETCOLOR_GREEN && echo "Done." && $SETCOLOR_NORMAL

