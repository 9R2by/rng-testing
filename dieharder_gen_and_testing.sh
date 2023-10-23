#!/bin/bash

rm aes_ofb_rands.input
rm mt19937_rands.input

# generate 10000 random numbers with aes ofb
dieharder -o -f aes_ofb_rands.input -t 10000000000 -g 205
#head -n 3 aes_ofb_rands.input > aes_ofb_rands.header

# generate 10000 random numbers with mt19937
dieharder -o -f mt19937_rands.input -t 10000000000
#head -n 3 mt19937_rands.input > mt19937_rands.header

# testing generated aes ofb numbers
#dieharder -g 202 -f aes_ofb_rands.input -a > ./dieharder_reports/aes_ofb_dieharder.report
dieharder -g 202 -f aes_ofb_rands.input -a > aes_ofb_dieharder.report

#testing generated mt19937 numbers
#dieharder -g 202 -f mt19937_rands.input -a > ./dieharder_reports/mt19937_dieharder.report
dieharder -g 202 -f mt19937_rands.input -a > mt19937_dieharder.report

