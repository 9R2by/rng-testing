#!/bin/bash

./clean.sh

./compile.sh

./lea_output_generation

./dieharder.sh

mv  uint32_t_dieharder.report  ./../dieharder_reports/lea_0_0_0_x.report