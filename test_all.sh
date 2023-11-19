#!/bin/bash

./dieharder_gen_and_testing.sh

cd dieharder_lea_input_testing || exit

./start.sh

cd ..

cd dieharder_lea_output_testing_0_0_0_x || exit

./start.sh

cd ..

cd dieharder_lea_output_testing_x_0_0_0 || exit

./start.sh
