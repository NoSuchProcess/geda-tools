#!/bin/bash

mkdir -p ST

#LQFP32 UFQFPN32 SDIP32 TSSOP20 SO20 UFQFPN20

./fpgen --module qfp --name UFQFPN20 --pins 20 --pad-width 0.30 --pitch 0.50 --external 3.30 --internal 2.20 --size 3.0 > ST/UFQFPN20.fp
./fpgen --module qfp --name QFN50P500X500-32_350X350 --pins 32 --pad-width 0.30 --pitch 0.50 --external 5.30 --internal 4.10 --thermal 3.45 > ST/UFQFPN32.fp
./fpgen --module qfp --name LQFP32-07X07 --pins 32 --pad-width 0.50 --pitch 0.80 --internal  7.30 --external  9.70 --size  7.0 > ST/LQFP32.fp
./fpgen --module so  --name TSSOP20 --pins 20 --pad-width 0.40 --pitch 0.65 --internal 4.40 --external 7.10 --size-x 4.4 --size-y 6.5 > ST/TSSOP20.fp

# http://www.st.com/web/en/resource/technical/document/datasheet/DM00090510.pdf
./fpgen --module qfp --name LQFP100-140x140 --pins 100 --pad-width 0.30 --pitch 0.50 --internal 14.30 --external 16.70 --size 14.0 > ST/LQFP100-140x140.fp
./fpgen --module qfp --name LQFP64-100x100  --pins  64 --pad-width 0.30 --pitch 0.50 --internal 10.30 --external 12.70 --size 10.0 > ST/LQFP64-100x100.fp
./fpgen --module qfp --name LQFP48-70x70    --pins  48 --pad-width 0.30 --pitch 0.50 --internal  7.30 --external  9.70 --size  7.0 > ST/LQFP48-70x70.fp
./fpgen --module qfp --name UFQFPN4870x70 --pins 48 --pad-width 0.30 --pitch 0.50 --internal 6.20 --external 7.30 --thermal 5.60 > ST/UFQFPN48-70x70.fp
# TODO: UFBGA100
# TODO: UFBGA64
# TODO: WLCSP49
