#!/bin/bash

libs=-luser32
warnings="-Wno-writable-strings -Wno-format-security -Wno-deprecated-declarations"
clang++ -g src/main.cpp -otri.exe $libs $warnings