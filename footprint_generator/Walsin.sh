#!/bin/bash

mkdir -p WALSIN

./fpgen --module 2pin --name CHIP-R-0201 --internal 0.30 --pad-length 0.30 --pad-width 0.30 > WALSIN/R0201.fp
./fpgen --module 2pin --name CHIP-R-0402 --internal 0.50 --pad-length 0.50 --pad-width 0.60 > WALSIN/R0402.fp
./fpgen --module 2pin --name CHIP-R-0603 --internal 0.90 --pad-length 0.60 --pad-width 0.90 > WALSIN/R0603.fp
./fpgen --module 2pin --name CHIP-R-0805 --internal 1.20 --pad-length 0.70 --pad-width 1.30 > WALSIN/R0805.fp
./fpgen --module 2pin --name CHIP-R-1206 --internal 2.00 --pad-length 0.90 --pad-width 1.60 > WALSIN/R1206.fp
./fpgen --module 2pin --name CHIP-R-1218 --internal 2.00 --pad-length 0.90 --pad-width 4.80 > WALSIN/R1218.fp
./fpgen --module 2pin --name CHIP-R-2010 --internal 3.80 --pad-length 0.90 --pad-width 2.80 > WALSIN/R2010.fp
./fpgen --module 2pin --name CHIP-R-2512 --internal 3.80 --pad-length 1.60 --pad-width 3.50 > WALSIN/R2512.fp

./fpgen --module 2pin --name MLCC-0402 --internal 0.50 --pad-length 0.50 --pad-width 0.50 > WALSIN/C0402.fp
./fpgen --module 2pin --name MLCC-0508 --internal 0.50 --pad-length 1.00 --pad-width 2.00 > WALSIN/C0508.fp
./fpgen --module 2pin --name MLCC-0603 --internal 0.70 --pad-length 0.80 --pad-width 0.80 > WALSIN/C0603.fp
./fpgen --module 2pin --name MLCC-0612 --internal 0.80 --pad-length 1.00 --pad-width 3.20 > WALSIN/C0612.fp
./fpgen --module 2pin --name MLCC-0805 --internal 1.00 --pad-length 0.90 --pad-width 1.30 > WALSIN/C0805.fp
./fpgen --module 2pin --name MLCC-1206 --internal 2.20 --pad-length 0.90 --pad-width 1.60 > WALSIN/C1206.fp
./fpgen --module 2pin --name MLCC-1210 --internal 2.20 --pad-length 0.90 --pad-width 2.50 > WALSIN/C1210.fp
./fpgen --module 2pin --name MLCC-1808 --internal 3.30 --pad-length 1.05 --pad-width 2.30 > WALSIN/C1808.fp
./fpgen --module 2pin --name MLCC-1812 --internal 3.50 --pad-length 0.90 --pad-width 3.80 > WALSIN/C1812.fp
./fpgen --module 2pin --name MLCC-2220 --internal 4.70 --pad-length 0.90 --pad-width 5.60 > WALSIN/C2220.fp

mkdir -p WALSIN/{reflow,wave}
#                                            B                 C                D             F             G
./fpgen --module 2pin --name 0201 --internal 0.30 --pad-length 0.30 --pad-width 0.30 --size-x 1.10 --size-y 0.50 > WALSIN/reflow/R0201.fp
./fpgen --module 2pin --name 0402 --internal 0.50 --pad-length 0.50 --pad-width 0.60 --size-x 1.90 --size-y 1.00 > WALSIN/reflow/R0402.fp
./fpgen --module 2pin --name 0603 --internal 0.90 --pad-length 0.60 --pad-width 0.90 --size-x 2.35 --size-y 1.45 > WALSIN/reflow/R0603.fp
./fpgen --module 2pin --name 0805 --internal 1.20 --pad-length 0.70 --pad-width 1.30 --size-x 2.85 --size-y 1.90 > WALSIN/reflow/R0805.fp
./fpgen --module 2pin --name 1206 --internal 2.00 --pad-length 0.90 --pad-width 1.60 --size-x 4.05 --size-y 2.25 > WALSIN/reflow/R1206.fp
./fpgen --module 2pin --name 1218 --internal 2.00 --pad-length 0.90 --pad-width 4.80 --size-x 4.20 --size-y 5.50 > WALSIN/reflow/R1218.fp
./fpgen --module 2pin --name 2010 --internal 3.80 --pad-length 0.90 --pad-width 2.80 --size-x 5.85 --size-y 3.15 > WALSIN/reflow/R2010.fp
./fpgen --module 2pin --name 2512 --internal 3.80 --pad-length 1.60 --pad-width 3.50 --size-x 7.25 --size-y 3.85 > WALSIN/reflow/R2512.fp

./fpgen --module 2pin --name 0603 --internal 0.90 --pad-length 0.90 --pad-width 0.80 --size-x 3.40 --size-y 1.90 > WALSIN/wave/R0603.fp
./fpgen --module 2pin --name 0805 --internal 1.30 --pad-length 1.05 --pad-width 1.30 --size-x 4.30 --size-y 2.70 > WALSIN/wave/R0805.fp
./fpgen --module 2pin --name 1206 --internal 2.30 --pad-length 1.25 --pad-width 1.70 --size-x 5.90 --size-y 3.20 > WALSIN/wave/R1206.fp
./fpgen --module 2pin --name 1218 --internal 2.30 --pad-length 1.25 --pad-width 4.80 --size-x 5.90 --size-y 5.60 > WALSIN/wave/R1218.fp
./fpgen --module 2pin --name 2010 --internal 3.50 --pad-length 1.40 --pad-width 2.50 --size-x 7.00 --size-y 3.60 > WALSIN/wave/R2010.fp
./fpgen --module 2pin --name 2512 --internal 4.50 --pad-length 2.00 --pad-width 3.20 --size-x 9.00 --size-y 4.30 > WALSIN/wave/R2512.fp
