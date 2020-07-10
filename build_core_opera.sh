#!/bin/bash

SETCOLOR_GREEN="echo -en \\E[1;32m"
SETCOLOR_NORMAL="echo -en \\E[0;39m"

cd cores/libretro-opera
$SETCOLOR_GREEN && echo "Cleaning opera..." && $SETCOLOR_NORMAL
make -f Makefile clean &>/dev/null

$SETCOLOR_GREEN && echo "Building opera..." && $SETCOLOR_NORMAL
make -f Makefile -j`nproc` &>/dev/null

strip -s opera_libretro.dll
cp opera_libretro.dll ../../cores_dist/
cd ../..

$SETCOLOR_GREEN && echo "Done." && $SETCOLOR_NORMAL

