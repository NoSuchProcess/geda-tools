#!/bin/bash
# http://platan.ru/pdf/ec251.pdf

mkdir -p DIP-SOCKET

./fpgen --module dil --name "SCS-8"  --pins 8  --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.16 --size-y 10.16 --round > DIP-SOCKET/SCS-8.fp
./fpgen --module dil --name "SCS-14" --pins 14 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.16 --size-y 17.78 --round > DIP-SOCKET/SCS-14.fp
./fpgen --module dil --name "SCS-16" --pins 16 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.16 --size-y 20.32 --round > DIP-SOCKET/SCS-16.fp
./fpgen --module dil --name "SCS-18" --pins 18 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.16 --size-y 22.86 --round > DIP-SOCKET/SCS-18.fp
./fpgen --module dil --name "SCS-20" --pins 20 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.16 --size-y 25.40 --round > DIP-SOCKET/SCS-20.fp
./fpgen --module dil --name "SCS-22" --pins 22 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.16 --size-y 27.94 --round > DIP-SOCKET/SCS-22.fp
./fpgen --module dil --name "SCS-24" --pins 24 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.16 --size-y 30.48 --round > DIP-SOCKET/SCS-24.fp
./fpgen --module dil --name "SCS-28" --pins 28 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.16 --size-y 35.56 --round > DIP-SOCKET/SCS-28.fp
./fpgen --module dil --name "SCS-32" --pins 32 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.16 --size-y 40.64 --round > DIP-SOCKET/SCS-32.fp
./fpgen --module dil --name "SCL-24" --pins 24 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.78 --size-y 30.48 --round > DIP-SOCKET/SCL-24.fp
./fpgen --module dil --name "SCL-28" --pins 28 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.78 --size-y 35.56 --round > DIP-SOCKET/SCL-28.fp
./fpgen --module dil --name "SCL-32" --pins 32 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.78 --size-y 40.64 --round > DIP-SOCKET/SCL-32.fp
./fpgen --module dil --name "SCL-40" --pins 40 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.78 --size-y 50.80 --round > DIP-SOCKET/SCL-40.fp
./fpgen --module dil --name "SCL-42" --pins 42 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.78 --size-y 53.34 --round > DIP-SOCKET/SCL-42.fp
./fpgen --module dil --name "SCL-48" --pins 48 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.78 --size-y 60.90 --round > DIP-SOCKET/SCL-48.fp
./fpgen --module dil --name "SCL-64" --pins 64 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.78 --size-y 81.05 --round > DIP-SOCKET/SCL-64.fp

./fpgen --module dil --name "ICSS-20" --pins 20 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x  9.91 --size-y 17.0 --round > DIP-SOCKET/ICSS-20.fp
./fpgen --module dil --name "ICSS-24" --pins 24 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 10.16 --size-x 12.45 --size-y 21.3 --round > DIP-SOCKET/ICSS-24.fp
./fpgen --module dil --name "ICSS-28" --pins 28 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 10.16 --size-x 12.45 --size-y 25.1 --round > DIP-SOCKET/ICSS-28.fp
./fpgen --module dil --name "ICSS-30" --pins 30 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 10.16 --size-x 12.45 --size-y 26.6 --round > DIP-SOCKET/ICSS-30.fp
./fpgen --module dil --name "ICSS-32" --pins 32 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 10.16 --size-x 12.45 --size-y 28.0 --round > DIP-SOCKET/ICSS-32.fp
./fpgen --module dil --name "ICSS-40" --pins 40 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.53 --size-y 35.8 --round > DIP-SOCKET/ICSS-40.fp
./fpgen --module dil --name "ICSS-42" --pins 42 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.53 --size-y 37.3 --round > DIP-SOCKET/ICSS-42.fp
./fpgen --module dil --name "ICSS-48" --pins 48 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.53 --size-y 43.0 --round > DIP-SOCKET/ICSS-48.fp
./fpgen --module dil --name "ICSS-52" --pins 52 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.53 --size-y 46.5 --round > DIP-SOCKET/ICSS-52.fp
./fpgen --module dil --name "ICSS-56" --pins 56 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.53 --size-y 50.0 --round > DIP-SOCKET/ICSS-56.fp
./fpgen --module dil --name "ICSS-64" --pins 64 --pitch 1.778 --pad-width 1.20 --pad-length 2.20 --row 19.05 --size-x 21.34 --size-y 57.0 --round > DIP-SOCKET/ICSS-64.fp

./fpgen --module dil --name "TRS-6"  --pins 6  --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.14 --size-y  7.58 --round > DIP-SOCKET/TRS-6.fp
./fpgen --module dil --name "TRS-8"  --pins 8  --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.14 --size-y 10.14 --round > DIP-SOCKET/TRS-8.fp
./fpgen --module dil --name "TRS-14" --pins 14 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.14 --size-y 17.76 --round > DIP-SOCKET/TRS-14.fp
./fpgen --module dil --name "TRS-16" --pins 16 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.14 --size-y 20.30 --round > DIP-SOCKET/TRS-16.fp
./fpgen --module dil --name "TRS-18" --pins 18 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.14 --size-y 22.84 --round > DIP-SOCKET/TRS-18.fp
./fpgen --module dil --name "TRS-20" --pins 20 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.14 --size-y 25.38 --round > DIP-SOCKET/TRS-20.fp
./fpgen --module dil --name "TRS-22" --pins 22 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.14 --size-y 27.94 --round > DIP-SOCKET/TRS-22.fp
./fpgen --module dil --name "TRS-24" --pins 24 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.14 --size-y 30.46 --round > DIP-SOCKET/TRS-24.fp
./fpgen --module dil --name "TRS-28" --pins 28 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row  7.62 --size-x 10.14 --size-y 35.56 --round > DIP-SOCKET/TRS-28.fp
./fpgen --module dil --name "TRL-24" --pins 24 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.72 --size-y 30.46 --round > DIP-SOCKET/TRL-24.fp
./fpgen --module dil --name "TRL-28" --pins 28 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.72 --size-y 35.54 --round > DIP-SOCKET/TRL-28.fp
./fpgen --module dil --name "TRL-32" --pins 32 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.72 --size-y 40.64 --round > DIP-SOCKET/TRL-32.fp
./fpgen --module dil --name "TRL-40" --pins 40 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.72 --size-y 50.78 --round > DIP-SOCKET/TRL-40.fp
./fpgen --module dil --name "TRL-48" --pins 48 --pitch 2.54 --pad-width 1.20 --pad-length 2.20 --row 15.24 --size-x 17.72 --size-y 60.90 --round > DIP-SOCKET/TRL-48.fp
