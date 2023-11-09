#!/bin/bash

./clean.sh

./compile.sh

./lea_input_generation

./dieharder.sh


mv  uint32_t_dieharder.report  ./../dieharder_reports/lea_input.report