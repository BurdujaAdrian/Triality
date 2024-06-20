#!/bin/bash

libs="-luser32 -l opengl32 -lgdi32"
warnings="-Wno-writable-strings -Wno-format-security -Wno-deprecated-declarations -Wno-return-type"
includes="-Ithird_party -Ithird_party/Include"

clang++ $includes -g src/main.cpp -otri.exe $libs $warnings -v