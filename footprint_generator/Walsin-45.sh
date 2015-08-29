#!/bin/bash

mkdir -p WALSIN-45

./fpgen --module 2pin --name CHIP-R-0201 --internal 0.30 --pad-length 0.30 --pad-width 0.30 --rotate 45 > WALSIN-45/R0201.fp
./fpgen --module 2pin --name CHIP-R-0402 --internal 0.50 --pad-length 0.50 --pad-width 0.60 --rotate 45 > WALSIN-45/R0402.fp
./fpgen --module 2pin --name CHIP-R-0603 --internal 0.90 --pad-length 0.60 --pad-width 0.90 --rotate 45 > WALSIN-45/R0603.fp
./fpgen --module 2pin --name CHIP-R-0805 --internal 1.20 --pad-length 0.70 --pad-width 1.30 --rotate 45 > WALSIN-45/R0805.fp
./fpgen --module 2pin --name CHIP-R-1206 --internal 2.00 --pad-length 0.90 --pad-width 1.60 --rotate 45 > WALSIN-45/R1206.fp
./fpgen --module 2pin --name CHIP-R-1218 --internal 2.00 --pad-length 0.90 --pad-width 4.80 --rotate 45 > WALSIN-45/R1218.fp
./fpgen --module 2pin --name CHIP-R-2010 --internal 3.80 --pad-length 0.90 --pad-width 2.80 --rotate 45 > WALSIN-45/R2010.fp
./fpgen --module 2pin --name CHIP-R-2512 --internal 3.80 --pad-length 1.60 --pad-width 3.50 --rotate 45 > WALSIN-45/R2512.fp

./fpgen --module 2pin --name MLCC-0402 --internal 0.50 --pad-length 0.50 --pad-width 0.50 --rotate 45 > WALSIN-45/C0402.fp
./fpgen --module 2pin --name MLCC-0508 --internal 0.50 --pad-length 1.00 --pad-width 2.00 --rotate 45 > WALSIN-45/C0508.fp
./fpgen --module 2pin --name MLCC-0603 --internal 0.70 --pad-length 0.80 --pad-width 0.80 --rotate 45 > WALSIN-45/C0603.fp
./fpgen --module 2pin --name MLCC-0612 --internal 0.80 --pad-length 1.00 --pad-width 3.20 --rotate 45 > WALSIN-45/C0612.fp
./fpgen --module 2pin --name MLCC-0805 --internal 1.00 --pad-length 0.90 --pad-width 1.30 --rotate 45 > WALSIN-45/C0805.fp
./fpgen --module 2pin --name MLCC-1206 --internal 2.20 --pad-length 0.90 --pad-width 1.60 --rotate 45 > WALSIN-45/C1206.fp
./fpgen --module 2pin --name MLCC-1210 --internal 2.20 --pad-length 0.90 --pad-width 2.50 --rotate 45 > WALSIN-45/C1210.fp
./fpgen --module 2pin --name MLCC-1808 --internal 3.30 --pad-length 1.05 --pad-width 2.30 --rotate 45 > WALSIN-45/C1808.fp
./fpgen --module 2pin --name MLCC-1812 --internal 3.50 --pad-length 0.90 --pad-width 3.80 --rotate 45 > WALSIN-45/C1812.fp
./fpgen --module 2pin --name MLCC-2220 --internal 4.70 --pad-length 0.90 --pad-width 5.60 --rotate 45 > WALSIN-45/C2220.fp

mkdir -p WALSIN/{reflow,wave}
#                                            B                 C                D             F             G
./fpgen --module 2pin --name 0201 --internal 0.30 --pad-length 0.30 --pad-width 0.30 --size-x 1.10 --size-y 0.50 --rotate 45 > WALSIN-45/reflow/R0201.fp
./fpgen --module 2pin --name 0402 --internal 0.50 --pad-length 0.50 --pad-width 0.60 --size-x 1.90 --size-y 1.00 --rotate 45 > WALSIN-45/reflow/R0402.fp
./fpgen --module 2pin --name 0603 --internal 0.90 --pad-length 0.60 --pad-width 0.90 --size-x 2.35 --size-y 1.45 --rotate 45 > WALSIN-45/reflow/R0603.fp
./fpgen --module 2pin --name 0805 --internal 1.20 --pad-length 0.70 --pad-width 1.30 --size-x 2.85 --size-y 1.90 --rotate 45 > WALSIN-45/reflow/R0805.fp
./fpgen --module 2pin --name 1206 --internal 2.00 --pad-length 0.90 --pad-width 1.60 --size-x 4.05 --size-y 2.25 --rotate 45 > WALSIN-45/reflow/R1206.fp
./fpgen --module 2pin --name 1218 --internal 2.00 --pad-length 0.90 --pad-width 4.80 --size-x 4.20 --size-y 5.50 --rotate 45 > WALSIN-45/reflow/R1218.fp
./fpgen --module 2pin --name 2010 --internal 3.80 --pad-length 0.90 --pad-width 2.80 --size-x 5.85 --size-y 3.15 --rotate 45 > WALSIN-45/reflow/R2010.fp
./fpgen --module 2pin --name 2512 --internal 3.80 --pad-length 1.60 --pad-width 3.50 --size-x 7.25 --size-y 3.85 --rotate 45 > WALSIN-45/reflow/R2512.fp

./fpgen --module 2pin --name 0603 --internal 0.90 --pad-length 0.90 --pad-width 0.80 --size-x 3.40 --size-y 1.90 --rotate 45 > WALSIN-45/wave/R0603.fp
./fpgen --module 2pin --name 0805 --internal 1.30 --pad-length 1.05 --pad-width 1.30 --size-x 4.30 --size-y 2.70 --rotate 45 > WALSIN-45/wave/R0805.fp
./fpgen --module 2pin --name 1206 --internal 2.30 --pad-length 1.25 --pad-width 1.70 --size-x 5.90 --size-y 3.20 --rotate 45 > WALSIN-45/wave/R1206.fp
./fpgen --module 2pin --name 1218 --internal 2.30 --pad-length 1.25 --pad-width 4.80 --size-x 5.90 --size-y 5.60 --rotate 45 > WALSIN-45/wave/R1218.fp
./fpgen --module 2pin --name 2010 --internal 3.50 --pad-length 1.40 --pad-width 2.50 --size-x 7.00 --size-y 3.60 --rotate 45 > WALSIN-45/wave/R2010.fp
./fpgen --module 2pin --name 2512 --internal 4.50 --pad-length 2.00 --pad-width 3.20 --size-x 9.00 --size-y 4.30 --rotate 45 > WALSIN-45/wave/R2512.fp
