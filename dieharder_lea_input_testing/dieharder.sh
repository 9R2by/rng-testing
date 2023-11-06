#!/bin/bash

#dieharder -o -f example.input -t 10000
#dieharder -g 202 -f example.input -a
#dieharder -o -f example.input -t 4294967295
#dieharder -g 202 -f example.input -a

dieharder -g 202 -f 32.example.input -a > uint32_t_dieharder.report

