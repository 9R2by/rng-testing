#!/bin/bash

chmod +x *.sh

./clean.sh

./compile.sh

./lea_output_generation

./dieharder.sh