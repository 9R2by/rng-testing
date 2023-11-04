# rng-testing

## 2<sup>32</sup>-1 numbers:

A bash script that will create 2<sup>32</sup>-1 non random numbers is in the folder *pow_2_32_dieharder_input_generator*. It will generate numbers in an ascending order, starting from 0 up to 2<sup>32</sup>-1 and write those to a file with an appropiate header that can be analysed by *dieharder*.
The script is executed by invoking *init.sh* once and then starting the script by executing *start.sh*.
The number file is called *32.example.input* and the dieharder report will be written to the file *uint32_t_dieharder.report*. The generated number file will have around 43GB in size. The dieharder report is in the appendix A. The testing stopped after rgb_bitdist 10, because of a not provided n-tuple. Further testing was conducted manually, the entries have been added.


The script can be run in the background like this:
```bash
cd dieharder_lea_testing
nohup ./start.sh >/dev/null 2>&1 & # runs script in the background without occuping the shell
```
To check what is currently working, you can use 
```bash 
top
```
for example.

Dependencies:

* dieharder
* clang





## Script to test AES OFB and MT19937 generated random numbers with dieharder

This bash script *dieharder_gen_and_testing.sh* will create 10 billion (10<sup>10</sup>) random numbers per generator (so 20 billion) and writes those to files (2x15GB). This will consum a lot of time and memory. Be aware that if you are short of memory you should not run this script. I included the respective reports in appendix B and C.
It creates 4 files in the folder where it has been executed with the names:


* aes_ofb_rands.header
  * includes the header of the generated file (until line 6)
* mt19937_rands.header
  * includes the header of the generated file (until line 6)
* aes_ofb_dieharder.report
  * the results from the all dieharder tests   
* mt19937_dieharder.report
  * the results from the all dieharder tests
      
The script was tested on Fedora 38, Debian 12.2 and Ubuntu 20.04.6 LTS using dieharder version 3.31.1.
Using dieharder on Ubuntu 22.04.3 LTS had some issues with the file reading. I am unsure about the reasons.

The script can be run in the background like this:
```bash
nohup ./dieharder_gen_and_testing.sh >/dev/null 2>&1 &
```

Dependencies:

* dieharder



 

## Warning
Your device may become unstable as dieharder seems to use a lot of memory and cpu ressources. Please use a server or a device that you can leave unattended for longer periods of time and that run no important software. I tested it on a virtual server.


 ## Appendix A
dieharder tests on 2<sup>32</sup>-1 numbers starting from 0 to 2<sup>32</sup>-1 ascending in a file (version 3.31.1  Copyright 2003 Robert G. Brown):       

|   rng_name    |           filename             | rands/second |     
|---------------|--------------------------------|--------------|
|    file_input |         32.example.input       |  1.02e+07    |        
  
|      test_name       | ntup | tsamples | psamples | p-value   | Assessment |
|----------------------|------|----------|----------|-----------|------------|
| diehard_birthdays    | 0    | 100      | 100      | 0.00000000| FAILED     |
| diehard_operm5      | 0    | 1000000  | 100      | 0.00000000| FAILED     |
| diehard_rank_32x32  | 0    | 40000    | 100      | 0.00000000| FAILED     |
| diehard_rank_6x8    | 0    | 100000   | 100      | 0.00000000| FAILED     |
| diehard_bitstream   | 0    | 2097152  | 100      | 0.00000000| FAILED     |
| diehard_opso        | 0    | 2097152  | 100      | 0.00000000| FAILED     |
| diehard_oqso        | 0    | 2097152  | 100      | 0.00000000| FAILED     |
| diehard_dna         | 0    | 2097152  | 100      | 0.00000000| FAILED     |
| diehard_count_1s_str| 0    | 256000   | 100      | 0.00000000| FAILED     |
| diehard_count_1s_byt| 0    | 256000   | 100      | 0.00000000| FAILED     |
| diehard_parking_lot | 0    | 12000    | 100      | 0.00000000| FAILED     |
| diehard_2dsphere    | 2    | 8000     | 100      | 0.00000000| FAILED     |
| diehard_3dsphere    | 3    | 4000     | 100      | 0.00000000| FAILED     |
| diehard_squeeze     | 0    | 100000   | 100      | 0.00000000| FAILED     |
| diehard_sums        | 0    | 100      | 100      | 0.00000000| FAILED     |
| diehard_runs        | 0    | 100000   | 100      | 0.00000000| FAILED     |
| diehard_runs        | 0    | 100000   | 100      | 0.00000000| FAILED     |
| diehard_craps       | 0    | 200000   | 100      | 0.00000000| FAILED     |
| diehard_craps       | 0    | 200000   | 100      | 0.00000000| FAILED     |
| marsaglia_tsang_gcd | 0    | 10000000 | 100      | 0.00000000| FAILED     |
| marsaglia_tsang_gcd | 0    | 10000000 | 100      | 0.00000000| FAILED     |
| sts_monobit         | 1    | 100000   | 100      | 0.00000000| FAILED     |
| sts_runs            | 2    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 1    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 2    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 3    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 3    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 4    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 4    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 5    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 5    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 6    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 6    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 7    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 7    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 8    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 8    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 9    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 9    | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 10   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 10   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 11   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 11   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 12   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 12   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 13   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 13   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 14   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 14   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 15   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 15   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 16   | 100000   | 100      | 0.00000000| FAILED     |
| sts_serial          | 16   | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 1    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 2    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 3    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 4    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 5    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 6    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 7    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 8    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 9    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_bitdist         | 10   | 100000   | 100      | 0.00000000| FAILED     |
| rgb_minimum_distance| 0    | 10000    | 1000     | 0.00000000| FAILED     |
| rgb_permutations    | 5    | 100000   | 100      | 0.00000000| FAILED     |
| rgb_lagged_sum      | 0    | 1000000  | 100      | 0.00000000| FAILED     |
| rgb_kstest_test     | 0    | 10000    | 1000     | 0.00000000| FAILED     |
| dab_bytedistrib     | 0    | 51200000 | 1        | 0.00000000| FAILED     |
| dab_dct             | 256  | 50000    | 1        | 0.00000000| FAILED     |
| dab_filltree        | 32   | 15000000 | 1        | 0.00000000| FAILED     |
| dab_filltree        | 32   | 15000000 | 1        | 0.00000000| FAILED     |
| dab_monobit2        | 12   | 65000000 | 1        | 1.00000000| FAILED     |

        
              
        

## Appendix B

dieharder tests on AES_OFB (version 3.31.1  Copyright 2003 Robert G. Brown):
| rng_name            | filename                  | rands/second  |
|---------------------|---------------------------|---------------|
| file_input          | aes_ofb_rands.input       |  9.18e+06     |

| test_name           | ntup | tsamples | psamples | p-value   | Assessment |
|---------------------|------|----------|----------|-----------|------------|
| diehard_birthdays   | 0    | 100      | 100      | 0.58246773 | PASSED     |
| diehard_operm5      | 0    | 1000000  | 100      | 0.14919492 | PASSED     |
| diehard_rank_32x32  | 0    | 40000    | 100      | 0.97040800 | PASSED     |
| diehard_rank_6x8    | 0    | 100000   | 100      | 0.74416271 | PASSED     |
| diehard_bitstream   | 0    | 2097152  | 100      | 0.14661745 | PASSED     |
| diehard_opso        | 0    | 2097152  | 100      | 0.12494528 | PASSED     |
| diehard_oqso        | 0    | 2097152  | 100      | 0.50795601 | PASSED     |
| diehard_dna         | 0    | 2097152  | 100      | 0.89690202 | PASSED     |
| diehard_count_1s_str| 0    | 256000   | 100      | 0.03794882 | PASSED     |
| diehard_count_1s_byt| 0    | 256000   | 100      | 0.87014928 | PASSED     |
| diehard_parking_lot | 0    | 12000    | 100      | 0.84439484 | PASSED     |
| diehard_2dsphere    | 2    | 8000     | 100      | 0.76865475 | PASSED     |
| diehard_3dsphere    | 3    | 4000     | 100      | 0.35496139 | PASSED     |
| diehard_squeeze     | 0    | 100000   | 100      | 0.82046110 | PASSED     |
| diehard_sums        | 0    | 100      | 100      | 0.43550263 | PASSED     |
| diehard_runs        | 0    | 100000   | 100      | 0.82811339 | PASSED     |
| diehard_runs        | 0    | 100000   | 100      | 0.47160274 | PASSED     |
| diehard_craps       | 0    | 200000   | 100      | 0.38469264 | PASSED     |
| diehard_craps      | 0    | 200000   | 100      | 0.26685127 | PASSED     |
| marsaglia_tsang_gcd| 0    | 10000000 | 100      | 0.86522648 | PASSED     |
| marsaglia_tsang_gcd| 0    | 10000000 | 100      | 0.95048583 | PASSED     |
| sts_monobit        | 1    | 100000   | 100      | 0.73538605 | PASSED     |
| sts_runs           | 2    | 100000   | 100      | 0.86159956 | PASSED     |
| sts_serial         | 1    | 100000   | 100      | 0.49131381 | PASSED     |
| sts_serial         | 2    | 100000   | 100      | 0.93330011 | PASSED     |
| sts_serial         | 3    | 100000   | 100      | 0.51021318 | PASSED     |
| sts_serial         | 3    | 100000   | 100      | 0.19688806 | PASSED     |
| sts_serial         | 4    | 100000   | 100      | 0.37570116 | PASSED     |
| sts_serial         | 4    | 100000   | 100      | 0.62325708 | PASSED     |
| sts_serial         | 5    | 100000   | 100      | 0.55339652 | PASSED     |
| sts_serial         | 5    | 100000   | 100      | 0.97925037 | PASSED     |
| sts_serial         | 6    | 100000   | 100      | 0.15960580 | PASSED     |
| sts_serial         | 6    | 100000   | 100      | 0.57534898 | PASSED     |
| sts_serial         | 7    | 100000   | 100      | 0.51906182 | PASSED     |
| sts_serial         | 7    | 100000   | 100      | 0.50486328 | PASSED     |
| sts_serial         | 8    | 100000   | 100      | 0.62771241 | PASSED     |
| sts_serial         | 8    | 100000   | 100      | 0.99567586 | WEAK       |
| sts_serial         | 9    | 100000   | 100      | 0.11772840 | PASSED     |
| sts_serial         | 9    | 100000   | 100      | 0.67534274 | PASSED     |
| sts_serial         | 10   | 100000   | 100      | 0.90534755 | PASSED     |
| sts_serial         | 10   | 100000   | 100      | 0.95391566 | PASSED     |
| sts_serial         | 11   | 100000   | 100      | 0.67715806 | PASSED     |
| sts_serial         | 11   | 100000   | 100      | 0.75411684 | PASSED     |
| sts_serial         | 12   | 100000   | 100      | 0.16992509 | PASSED     |
| sts_serial         | 12   | 100000   | 100      | 0.47535025 | PASSED     |
| sts_serial         | 13   | 100000   | 100      | 0.67726141 | PASSED     |
| sts_serial         | 13   | 100000   | 100      | 0.76096866 | PASSED     |
| sts_serial         | 14   | 100000   | 100      | 0.92506355 | PASSED     |
| sts_serial         | 14   | 100000   | 100      | 0.76482758 | PASSED     |
| sts_serial         | 15   | 100000   | 100      | 0.78507036 | PASSED     |
| sts_serial         | 15   | 100000   | 100      | 0.97971099 | PASSED     |
| sts_serial         | 16   | 100000   | 100      | 0.58075035 | PASSED     |
| sts_serial         | 16   | 100000   | 100      | 0.69227048 | PASSED     |  
| rgb_bitdist        | 1    | 100000   | 100      | 0.98743024 | PASSED     |
| rgb_bitdist        | 2    | 100000   | 100      | 0.18142819 | PASSED     |
| rgb_bitdist        | 3    | 100000   | 100      | 0.68788042 | PASSED     |
| rgb_bitdist        | 4    | 100000   | 100      | 0.94526219 | PASSED     |
| rgb_bitdist        | 5    | 100000   | 100      | 0.43932893 | PASSED     |
| rgb_bitdist        | 6    | 100000   | 100      | 0.10868803 | PASSED     |
| rgb_bitdist        | 7    | 100000   | 100      | 0.53639512 | PASSED     |
| rgb_bitdist        | 8    | 100000   | 100      | 0.13934468 | PASSED     |
| rgb_bitdist        | 9    | 100000   | 100      | 0.00653834 | PASSED     |
| rgb_bitdist        | 10   | 100000   | 100      | 0.68308562 | PASSED     |
| rgb_bitdist        | 11   | 100000   | 100      | 0.80308751 | PASSED     |
| rgb_bitdist        | 12   | 100000   | 100      | 0.50276380 | PASSED     |
| rgb_minimum_distance| 2    | 10000    | 1000     | 0.72102349 | PASSED     |
| rgb_minimum_distance| 3    | 10000    | 1000     | 0.26397266 | PASSED     |
| rgb_minimum_distance| 4    | 10000    | 1000     | 0.99711981 | WEAK       |
| rgb_minimum_distance| 5    | 10000    | 1000     | 0.59797746 | PASSED     |
| rgb_permutations   | 2    | 100000   | 100      | 0.92963008 | PASSED     |
| rgb_permutations   | 3    | 100000   | 100      | 0.69079015 | PASSED     |
| rgb_permutations   | 4    | 100000   | 100      | 0.66080007 | PASSED     |
| rgb_permutations   | 5    | 100000   | 100      | 0.16532260 | PASSED     |
| rgb_lagged_sum     | 0    | 1000000  | 100      | 0.31392043 | PASSED     |
| rgb_lagged_sum     | 1    | 1000000  | 100      | 0.77092895 | PASSED     |
| rgb_lagged_sum     | 2    | 1000000  | 100      | 0.46902396 | PASSED     |
| rgb_lagged_sum     | 3    | 1000000  | 100      | 0.17788692 | PASSED     |
| rgb_lagged_sum     | 4    | 1000000  | 100      | 0.69971854 | PASSED     |
| rgb_lagged_sum     | 5    | 1000000  | 100      | 0.75999745 | PASSED     |
| rgb_lagged_sum     | 6    | 1000000  | 100      | 0.10497798 | PASSED     |
| rgb_lagged_sum     | 7    | 1000000  | 100      | 0.46868951 | PASSED     |
| rgb_lagged_sum     | 8    | 1000000  | 100      | 0.84474854 | PASSED     |
| rgb_lagged_sum     | 9    | 1000000  | 100      | 0.05550077 | PASSED     |
| rgb_lagged_sum     | 10   | 1000000  | 100      | 0.23123265 | PASSED     |
| rgb_lagged_sum     | 11   | 1000000  | 100      | 0.17160455 | PASSED     |
| rgb_lagged_sum     | 12   | 1000000  | 100      | 0.16455956 | PASSED     |
| rgb_lagged_sum     | 13   | 1000000  | 100      | 0.57190750 | PASSED     |
| rgb_lagged_sum     | 14   | 1000000  | 100      | 0.54834056 | PASSED     |
| rgb_lagged_sum     | 15   | 1000000  | 100      | 0.90005379 | PASSED     |
| rgb_lagged_sum     | 16   | 1000000  | 100      | 0.49593500 | PASSED     |
| rgb_lagged_sum     | 17   | 1000000  | 100      | 0.12189935 | PASSED     |
| rgb_lagged_sum     | 18   | 1000000  | 100      | 0.84457075 | PASSED     |
| rgb_lagged_sum     | 19   | 1000000  | 100      | 0.09729297 | PASSED     |
| rgb_lagged_sum     | 20   | 1000000  | 100      | 0.41446958 | PASSED     |
| rgb_lagged_sum     | 21   | 1000000  | 100      | 0.05563072 | PASSED     |
| rgb_lagged_sum     | 22   | 1000000  | 100      | 0.79077228 | PASSED     |
| rgb_lagged_sum     | 23   | 1000000  | 100      | 0.10164415 | PASSED     |
| rgb_lagged_sum     | 24   | 1000000  | 100      | 0.59515097 | PASSED     |
| rgb_lagged_sum     | 25   | 1000000  | 100      | 0.96099666 | PASSED     |
| rgb_lagged_sum     | 26   | 1000000  | 100      | 0.88343840 | PASSED     |
| rgb_lagged_sum     | 27   | 1000000  | 100      | 0.73340701 | PASSED     |
| rgb_lagged_sum     | 28   | 1000000  | 100      | 0.48045874 | PASSED     |
| rgb_lagged_sum     | 29   | 1000000  | 100      | 0.31842824 | PASSED     |
| rgb_lagged_sum     | 30   | 1000000  | 100      | 0.71938315 | PASSED     |
| rgb_lagged_sum     | 31   | 1000000  | 100      | 0.42611754 | PASSED     |
| rgb_lagged_sum     | 32   | 1000000  | 100      | 0.60076933 | PASSED     |
| rgb_kstest_test    | 0    | 10000    | 1000     | 0.19088245 | PASSED     |
| dab_bytedistrib    | 0    | 51200000 | 1        | 0.50686689 | PASSED     |
| dab_dct            | 256  | 50000    | 1        | 0.48313556 | PASSED     |
| dab_filltree       | 32   | 15000000 | 1        | 0.95817101 | PASSED     |
| dab_filltree       | 32   | 15000000 | 1        | 0.17774779 | PASSED     |
| dab_filltree2      | 0    | 5000000  | 1        | 0.02012868 | PASSED     |
| dab_filltree2      | 1    | 5000000  | 1        | 0.09522431 | PASSED     |
| dab_monobit2       | 12   | 65000000 | 1        | 0.68697989 | PASSED     |



## Appendix C
dieharder tests on MT19937 (version 3.31.1  Copyright 2003 Robert G. Brown):
 |  rng_name    | filename |rands/second|   file_input|   mt19937_rands.input|  8.90e+06  |
 |       test_name   |ntup| tsamples |psamples|  p-value |Assessment|
| --- | --- | --- | --- | --- | --- |
   diehard_birthdays|   0|       100|     100|0.90067579|  PASSED  
      diehard_operm5|   0|   1000000|     100|0.98114858|  PASSED  
  diehard_rank_32x32|   0|     40000|     100|0.14136388|  PASSED  
    diehard_rank_6x8|   0|    100000|     100|0.97386060|  PASSED  
   diehard_bitstream|   0|   2097152|     100|0.47561416|  PASSED  
        diehard_opso|   0|   2097152|     100|0.81025588|  PASSED  
        diehard_oqso|   0|   2097152|     100|0.45458457|  PASSED  
         diehard_dna|   0|   2097152|     100|0.89742136|  PASSED  
diehard_count_1s_str|   0|    256000|     100|0.87049394|  PASSED  
diehard_count_1s_byt|   0|    256000|     100|0.73421125|  PASSED  
 diehard_parking_lot|   0|     12000|     100|0.53884141|  PASSED  
    diehard_2dsphere|   2|      8000|     100|0.15614931|  PASSED  
    diehard_3dsphere|   3|      4000|     100|0.51838316|  PASSED  
     diehard_squeeze|   0|    100000|     100|0.85553974|  PASSED  
        diehard_sums|   0|       100|     100|0.00038410|   WEAK   
        diehard_runs|   0|    100000|     100|0.90763927|  PASSED  
        diehard_runs|   0|    100000|     100|0.59285807|  PASSED  
       diehard_craps|   0|    200000|     100|0.97702309|  PASSED  
       diehard_craps|   0|    200000|     100|0.13237254|  PASSED  
 marsaglia_tsang_gcd|   0|  10000000|     100|0.42172544|  PASSED  
 marsaglia_tsang_gcd|   0|  10000000|     100|0.86555090|  PASSED  
         sts_monobit|   1|    100000|     100|0.54200836|  PASSED  
            sts_runs|   2|    100000|     100|0.34890635|  PASSED  
          sts_serial|   1|    100000|     100|0.13430355|  PASSED  
          sts_serial|   2|    100000|     100|0.07327109|  PASSED  
          sts_serial|   3|    100000|     100|0.12161696|  PASSED  
          sts_serial|   3|    100000|     100|0.80361995|  PASSED  
          sts_serial|   4|    100000|     100|0.42400055|  PASSED  
          sts_serial|   4|    100000|     100|0.60858228|  PASSED  
          sts_serial|   5|    100000|     100|0.19944053|  PASSED  
          sts_serial|   5|    100000|     100|0.12031687|  PASSED  
          sts_serial|   6|    100000|     100|0.96282200|  PASSED  
          sts_serial|   6|    100000|     100|0.81079456|  PASSED  
          sts_serial|   7|    100000|     100|0.03060508|  PASSED  
          sts_serial|   7|    100000|     100|0.07829215|  PASSED  
          sts_serial|   8|    100000|     100|0.37201729|  PASSED  
          sts_serial|   8|    100000|     100|0.37243015|  PASSED  
          sts_serial|   9|    100000|     100|0.48726679|  PASSED  
          sts_serial|   9|    100000|     100|0.96402689|  PASSED  
          sts_serial|  10|    100000|     100|0.22887652|  PASSED  
          sts_serial|  10|    100000|     100|0.56955798|  PASSED  
          sts_serial|  11|    100000|     100|0.42291562|  PASSED  
          sts_serial|  11|    100000|     100|0.57101308|  PASSED  
          sts_serial|  12|    100000|     100|0.73941177|  PASSED  
          sts_serial|  12|    100000|     100|0.17270214|  PASSED  
          sts_serial|  13|    100000|     100|0.40026018|  PASSED  
          sts_serial|  13|    100000|     100|0.36953270|  PASSED  
          sts_serial|  14|    100000|     100|0.53461104|  PASSED  
          sts_serial|  14|    100000|     100|0.34971896|  PASSED  
          sts_serial|  15|    100000|     100|0.74634132|  PASSED  
          sts_serial|  15|    100000|     100|0.64082876|  PASSED  
          sts_serial|  16|    100000|     100|0.11367495|  PASSED  
          sts_serial|  16|    100000|     100|0.70891894|  PASSED  
         rgb_bitdist|   1|    100000|     100|0.50014579|  PASSED  
         rgb_bitdist|   2|    100000|     100|0.28651914|  PASSED  
         rgb_bitdist|   3|    100000|     100|0.98504578|  PASSED  
         rgb_bitdist|   4|    100000|     100|0.69697247|  PASSED  
         rgb_bitdist|   5|    100000|     100|0.37538685|  PASSED  
         rgb_bitdist|   6|    100000|     100|0.46637960|  PASSED  
         rgb_bitdist|   7|    100000|     100|0.98975086|  PASSED  
         rgb_bitdist|   8|    100000|     100|0.14500154|  PASSED  
         rgb_bitdist|   9|    100000|     100|0.28788446|  PASSED  
         rgb_bitdist|  10|    100000|     100|0.38096000|  PASSED  
         rgb_bitdist|  11|    100000|     100|0.16171733|  PASSED  
         rgb_bitdist|  12|    100000|     100|0.40285097|  PASSED  
rgb_minimum_distance|   2|     10000|    1000|0.41160422|  PASSED  
rgb_minimum_distance|   3|     10000|    1000|0.14087287|  PASSED  
rgb_minimum_distance|   4|     10000|    1000|0.29853516|  PASSED  
rgb_minimum_distance|   5|     10000|    1000|0.08237670|  PASSED  
    rgb_permutations|   2|    100000|     100|0.59000531|  PASSED  
    rgb_permutations|   3|    100000|     100|0.62338759|  PASSED  
    rgb_permutations|   4|    100000|     100|0.91125775|  PASSED  
    rgb_permutations|   5|    100000|     100|0.98834709|  PASSED  
      rgb_lagged_sum|   0|   1000000|     100|0.91761912|  PASSED  
      rgb_lagged_sum|   1|   1000000|     100|0.99845411|   WEAK   
      rgb_lagged_sum|   2|   1000000|     100|0.99149558|  PASSED  
      rgb_lagged_sum|   3|   1000000|     100|0.27880583|  PASSED  
      rgb_lagged_sum|   4|   1000000|     100|0.80542784|  PASSED  
      rgb_lagged_sum|   5|   1000000|     100|0.42354376|  PASSED  
      rgb_lagged_sum|   6|   1000000|     100|0.67521522|  PASSED  
      rgb_lagged_sum|   7|   1000000|     100|0.56997393|  PASSED  
      rgb_lagged_sum|   8|   1000000|     100|0.13024046|  PASSED  
      rgb_lagged_sum|   9|   1000000|     100|0.70462255|  PASSED  
      rgb_lagged_sum|  10|   1000000|     100|0.23795024|  PASSED  
      rgb_lagged_sum|  11|   1000000|     100|0.41926276|  PASSED  
      rgb_lagged_sum|  12|   1000000|     100|0.45915689|  PASSED  
      rgb_lagged_sum|  13|   1000000|     100|0.33386357|  PASSED  
      rgb_lagged_sum|  14|   1000000|     100|0.29375577|  PASSED  
      rgb_lagged_sum|  15|   1000000|     100|0.60449450|  PASSED  
      rgb_lagged_sum|  16|   1000000|     100|0.46322833|  PASSED  
      rgb_lagged_sum|  17|   1000000|     100|0.67566751|  PASSED  
      rgb_lagged_sum|  18|   1000000|     100|0.64557644|  PASSED  
      rgb_lagged_sum|  19|   1000000|     100|0.11803292|  PASSED  
      rgb_lagged_sum|  20|   1000000|     100|0.81995221|  PASSED  
      rgb_lagged_sum|  21|   1000000|     100|0.99315362|  PASSED  
      rgb_lagged_sum|  22|   1000000|     100|0.95525012|  PASSED  
      rgb_lagged_sum|  23|   1000000|     100|0.50104852|  PASSED  
      rgb_lagged_sum|  24|   1000000|     100|0.72143288|  PASSED  
      rgb_lagged_sum|  25|   1000000|     100|0.81257695|  PASSED  
      rgb_lagged_sum|  26|   1000000|     100|0.14277198|  PASSED  
      rgb_lagged_sum|  27|   1000000|     100|0.72836335|  PASSED  
      rgb_lagged_sum|  28|   1000000|     100|0.67037814|  PASSED  
      rgb_lagged_sum|  29|   1000000|     100|0.92936248|  PASSED  
      rgb_lagged_sum|  30|   1000000|     100|0.85506371|  PASSED  
      rgb_lagged_sum|  31|   1000000|     100|0.92435249|  PASSED  
      rgb_lagged_sum|  32|   1000000|     100|0.79938603|  PASSED  
     rgb_kstest_test|   0|     10000|    1000|0.51734593|  PASSED  
     dab_bytedistrib|   0|  51200000|       1|0.23809723|  PASSED  
             dab_dct| 256|     50000|       1|0.30886592|  PASSED  
Preparing to run test 207.  ntuple = 0
        dab_filltree|  32|  15000000|       1|0.59981030|  PASSED  
        dab_filltree|  32|  15000000|       1|0.34574527|  PASSED  
Preparing to run test 208.  ntuple = 0
       dab_filltree2|   0|   5000000|       1|0.81117673|  PASSED  
       dab_filltree2|   1|   5000000|       1|0.39332291|  PASSED  
Preparing to run test 209.  ntuple = 0
        dab_monobit2|  12|  65000000|       1|0.85095276|  PASSED 

## Appendix D
dieharder tests (version 3.31.1  Copyright 2003 Robert G. Brown):
| Test Number | Test Name                                   | Test Reliability |
|-------------|--------------------------------------------|-------------------|
| -d 0        | Diehard Birthdays Test                     | Good              |
| -d 1        | Diehard OPERM5 Test                        | Good              |
| -d 2        | Diehard 32x32 Binary Rank Test             | Good              |
| -d 3        | Diehard 6x8 Binary Rank Test               | Good              |
| -d 4        | Diehard Bitstream Test                     | Good              |
| -d 5        | Diehard OPSO                               | Suspect           |
| -d 6        | Diehard OQSO Test                          | Suspect           |
| -d 7        | Diehard DNA Test                           | Suspect           |
| -d 8        | Diehard Count the 1s (stream) Test         | Good              |
| -d 9        | Diehard Count the 1s Test (byte)           | Good              |
| -d 10       | Diehard Parking Lot Test                   | Good              |
| -d 11       | Diehard Minimum Distance (2d Circle) Test  | Good              |
| -d 12       | Diehard 3d Sphere (Minimum Distance) Test  | Good              |
| -d 13       | Diehard Squeeze Test                       | Good              |
| -d 14       | Diehard Sums Test                          | Do Not Use        |
| -d 15       | Diehard Runs Test                          | Good              |
| -d 16       | Diehard Craps Test                         | Good              |
| -d 17       | Marsaglia and Tsang GCD Test               | Good              |
| -d 100      | STS Monobit Test                           | Good              |
| -d 101      | STS Runs Test                              | Good              |
| -d 102      | STS Serial Test (Generalized)              | Good              |
| -d 200      | RGB Bit Distribution Test                  | Good              |
| -d 201      | RGB Generalized Minimum Distance Test      | Good              |
| -d 202      | RGB Permutations Test                      | Good              |
| -d 203      | RGB Lagged Sum Test                        | Good              |
| -d 204      | RGB Kolmogorov-Smirnov Test Test           | Good              |
| -d 205      | Byte Distribution                          | Good              |
| -d 206      | DAB DCT                                    | Good              |
| -d 207      | DAB Fill Tree Test                         | Good              |
| -d 208      | DAB Fill Tree 2 Test                       | Good              |
| -d 209      | DAB Monobit 2 Test                         | Good              |






 
