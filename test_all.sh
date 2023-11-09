#!/bin/bash

chmod +x *.sh

./dieharder_gen_and_testing.sh

cd dieharder_lea_input_testing

./start.sh

cd ..

cd dieharder_lea_output_testing_0_0_0_x

./start.sh

cd ..

cd dieharder_lea_output_testing_x_0_0_0

./start.sh
