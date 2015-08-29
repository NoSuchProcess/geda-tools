#!/bin/bash

mkdir -p IPC-SM-782

./fpgen --module 2pin --name R0402 --internal 0.40 --pad-width 0.70 --pad-length 0.90 > IPC-SM-782/R0402.fp
./fpgen --module 2pin --name R0603 --internal 0.60 --pad-width 1.00 --pad-length 1.10 > IPC-SM-782/R0603.fp
./fpgen --module 2pin --name R0805 --internal 0.60 --pad-width 1.50 --pad-length 1.30 > IPC-SM-782/R0805.fp
./fpgen --module 2pin --name R1206 --internal 1.20 --pad-width 1.80 --pad-length 1.60 > IPC-SM-782/R1206.fp
./fpgen --module 2pin --name R1210 --internal 1.20 --pad-width 2.70 --pad-length 1.60 > IPC-SM-782/R1210.fp
./fpgen --module 2pin --name R2010 --internal 2.60 --pad-width 2.70 --pad-length 1.80 > IPC-SM-782/R2010.fp
./fpgen --module 2pin --name R2512 --internal 3.80 --pad-width 3.20 --pad-length 1.80 > IPC-SM-782/R2512.fp

./fpgen --module 2pin --name С0402 --internal 0.40 --pad-width 0.70 --pad-length 0.90 > IPC-SM-782/C0402.fp
./fpgen --module 2pin --name С0504 --internal 0.40 --pad-width 1.30 --pad-length 1.00 > IPC-SM-782/C0504.fp
./fpgen --module 2pin --name С0603 --internal 0.60 --pad-width 1.00 --pad-length 1.10 > IPC-SM-782/C0603.fp
./fpgen --module 2pin --name С0805 --internal 0.60 --pad-width 1.50 --pad-length 1.30 > IPC-SM-782/C0805.fp
./fpgen --module 2pin --name С1206 --internal 1.20 --pad-width 1.80 --pad-length 1.60 > IPC-SM-782/C1206.fp
./fpgen --module 2pin --name С1210 --internal 1.20 --pad-width 2.70 --pad-length 1.60 > IPC-SM-782/C1210.fp
./fpgen --module 2pin --name С1812 --internal 2.00 --pad-width 3.40 --pad-length 1.90 > IPC-SM-782/C1812.fp
./fpgen --module 2pin --name С1825 --internal 2.00 --pad-width 6.80 --pad-length 1.90 > IPC-SM-782/C1825.fp

./fpgen --module 2pin --name L2012 --internal 1.00 --pad-width 1.00 --pad-length 1.00 > IPC-SM-782/L2012.fp
./fpgen --module 2pin --name L3216 --internal 1.80 --pad-width 1.60 --pad-length 1.20 > IPC-SM-782/L3216.fp
./fpgen --module 2pin --name L4516 --internal 2.60 --pad-width 1.00 --pad-length 1.60 > IPC-SM-782/L4516.fp
./fpgen --module 2pin --name L2825 --internal 1.00 --pad-width 2.40 --pad-length 1.40 > IPC-SM-782/L2825.fp
./fpgen --module 2pin --name L3225 --internal 1.00 --pad-width 2.00 --pad-length 1.80 > IPC-SM-782/L3225.fp
./fpgen --module 2pin --name L4532 --internal 2.20 --pad-width 3.60 --pad-length 1.80 > IPC-SM-782/L4532.fp
./fpgen --module 2pin --name L5038 --internal 3.00 --pad-width 2.80 --pad-length 1.40 > IPC-SM-782/L5038.fp
./fpgen --module 2pin --name L3225 --internal 1.20 --pad-width 2.20 --pad-length 1.60 > IPC-SM-782/L3225.fp
./fpgen --module 2pin --name L3230 --internal 1.20 --pad-width 2.20 --pad-length 1.60 > IPC-SM-782/L3230.fp
./fpgen --module 2pin --name L4035 --internal 1.00 --pad-width 1.40 --pad-length 2.20 > IPC-SM-782/L4035.fp
./fpgen --module 2pin --name L4532 --internal 1.80 --pad-width 2.40 --pad-length 2.00 > IPC-SM-782/L4532.fp
./fpgen --module 2pin --name L5650 --internal 3.20 --pad-width 4.00 --pad-length 1.80 > IPC-SM-782/L5650.fp
./fpgen --module 2pin --name L8530 --internal 5.00 --pad-width 1.40 --pad-length 2.40 > IPC-SM-782/L8530.fp

# TODO Tantalum Capacitors

# 13.1 Dual-In-Line component
./fpgen --module dil --name DIP-8   --pins  8 --pad-width 1.20 --pad-length 2.20 --row  7.62 --pitch 2.54 --round > IPC-SM-782/DIP-8.fp
./fpgen --module dil --name DIP-14  --pins 14 --pad-width 1.20 --pad-length 2.20 --row  7.62 --pitch 2.54 --round > IPC-SM-782/DIP-14.fp
./fpgen --module dil --name DIP-16  --pins 16 --pad-width 1.20 --pad-length 2.20 --row  7.62 --pitch 2.54 --round > IPC-SM-782/DIP-16.fp
./fpgen --module dil --name DIP-18  --pins 18 --pad-width 1.20 --pad-length 2.20 --row  7.62 --pitch 2.54 --round > IPC-SM-782/DIP-18.fp
./fpgen --module dil --name DIP-20  --pins 20 --pad-width 1.20 --pad-length 2.20 --row  7.62 --pitch 2.54 --round > IPC-SM-782/DIP-20.fp
./fpgen --module dil --name DIP-22L --pins 22 --pad-width 1.20 --pad-length 2.20 --row 10.16 --pitch 2.54 --round > IPC-SM-782/DIP-22L.fp
./fpgen --module dil --name DIP-24  --pins 24 --pad-width 1.20 --pad-length 2.20 --row  7.62 --pitch 2.54 --round > IPC-SM-782/DIP-24.fp
./fpgen --module dil --name DIP-24L --pins 24 --pad-width 1.20 --pad-length 2.20 --row 10.16 --pitch 2.54 --round > IPC-SM-782/DIP-24L.fp
./fpgen --module dil --name DIP-24X --pins 24 --pad-width 1.20 --pad-length 2.20 --row 15.24 --pitch 2.54 --round > IPC-SM-782/DIP-24X.fp
./fpgen --module dil --name DIP-28  --pins 28 --pad-width 1.20 --pad-length 2.20 --row  7.62 --pitch 2.54 --round > IPC-SM-782/DIP-28.fp
./fpgen --module dil --name DIP-28X --pins 28 --pad-width 1.20 --pad-length 2.20 --row 15.24 --pitch 2.54 --round > IPC-SM-782/DIP-28X.fp
./fpgen --module dil --name DIP-40X --pins 40 --pad-width 1.20 --pad-length 2.20 --row 15.24 --pitch 2.54 --round > IPC-SM-782/DIP-40X.fp
./fpgen --module dil --name DIP-48X --pins 48 --pad-width 1.20 --pad-length 2.20 --row 15.24 --pitch 2.54 --round > IPC-SM-782/DIP-48X.fp

# 12.3 leadless ceramic chip carriers
./fpgen --module qfp --name LCC-16  --pins  16 --external  9.80 --internal  4.60 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-16.fp
./fpgen --module qfp --name LCC-20  --pins  20 --external 11.00 --internal  5.80 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-20.fp
./fpgen --module qfp --name LCC-24  --pins  24 --external 12.40 --internal  7.20 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-24.fp
./fpgen --module qfp --name LCC-28  --pins  28 --external 13.60 --internal  8.40 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-28.fp
./fpgen --module qfp --name LCC-44  --pins  44 --external 18.80 --internal 13.60 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-44.fp
./fpgen --module qfp --name LCC-52  --pins  52 --external 21.20 --internal 16.00 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-52.fp
./fpgen --module qfp --name LCC-68  --pins  68 --external 26.20 --internal 21.00 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-68.fp
./fpgen --module qfp --name LCC-84  --pins  84 --external 31.40 --internal 26.20 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-84.fp
./fpgen --module qfp --name LCC-100 --pins 100 --external 36.40 --internal 31.20 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-100.fp
./fpgen --module qfp --name LCC-124 --pins 124 --external 44.20 --internal 39.00 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-124.fp
./fpgen --module qfp --name LCC-156 --pins 156 --external 54.20 --internal 49.00 --pad-width 0.80 --pitch 1.27 --round > IPC-SM-782/LCC-156.fp
