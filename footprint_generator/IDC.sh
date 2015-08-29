#!/bin/bash
# http://platan.ru/pdf/ec251.pdf

mkdir -p IDC

./fpgen --module conn --name "IDC-6"  --pins-x 2 --pins-y  3 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 15.24 --round > IDC/IDC-6.fp
./fpgen --module conn --name "IDC-8"  --pins-x 2 --pins-y  4 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 17.78 --round > IDC/IDC-8.fp
./fpgen --module conn --name "IDC-10" --pins-x 2 --pins-y  5 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 20.32 --round > IDC/IDC-10.fp
./fpgen --module conn --name "IDC-12" --pins-x 2 --pins-y  6 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 22.86 --round > IDC/IDC-12.fp
./fpgen --module conn --name "IDC-14" --pins-x 2 --pins-y  7 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 25.40 --round > IDC/IDC-14.fp
./fpgen --module conn --name "IDC-16" --pins-x 2 --pins-y  8 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 27.94 --round > IDC/IDC-16.fp
./fpgen --module conn --name "IDC-20" --pins-x 2 --pins-y 10 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 33.02 --round > IDC/IDC-20.fp
./fpgen --module conn --name "IDC-24" --pins-x 2 --pins-y 12 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 38.10 --round > IDC/IDC-24.fp
./fpgen --module conn --name "IDC-26" --pins-x 2 --pins-y 13 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 40.64 --round > IDC/IDC-26.fp
./fpgen --module conn --name "IDC-30" --pins-x 2 --pins-y 15 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 45.72 --round > IDC/IDC-30.fp
./fpgen --module conn --name "IDC-34" --pins-x 2 --pins-y 17 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 50.80 --round > IDC/IDC-34.fp
./fpgen --module conn --name "IDC-40" --pins-x 2 --pins-y 20 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 58.42 --round > IDC/IDC-40.fp
./fpgen --module conn --name "IDC-44" --pins-x 2 --pins-y 22 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 63.50 --round > IDC/IDC-44.fp
./fpgen --module conn --name "IDC-50" --pins-x 2 --pins-y 25 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 71.12 --round > IDC/IDC-50.fp

./fpgen --module conn --name "PCI-33" --pins-x 3 --pins-y 11 --pitch 2.54 --pad-width 1.50 --pad-length 1.50 --size-x 9.0 --size-y 71.12 --round > IDC/PCI-33.fp
