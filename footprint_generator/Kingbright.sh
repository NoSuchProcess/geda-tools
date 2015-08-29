#!/bin/bash

mkdir -p Kingbright

./fpgen --module dil --name "CX56-11"  --pins 36 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 19.0 --size-y 50.3 --round --rotate -90 > Kingbright/CX56-11.fp
./fpgen --module dil --name "CX56-12"  --pins 12 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 19.0 --size-y 50.3 --round --rotate -90 > Kingbright/CX56-12.fp
./fpgen --module dil --name "CX56-21"  --pins 12 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 19.0 --size-y 50.3 --round --rotate -90 > Kingbright/CX56-21.fp

./fpgen --module dil --name "DX04-11"  --pins 16 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 12.70 --size-x 16.0 --size-y 20.2 --round --rotate -90 > Kingbright/DX04-11.fp
./fpgen --module dil --name "DX08-11"  --pins 18 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 22.00 --size-x 25.9 --size-y 35.8 --round --rotate -90 > Kingbright/DX08-11.fp

./fpgen --module dil --name "DX56-11"  --pins 18 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 19.0 --size-y 25.0 --round --rotate -90 > Kingbright/DX56-11.fp


# KB05-THROUGH-HOLE DISPLAY.pdf
./fpgen --module dil --name "SX03"    --pins 14 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row  7.62 --size-x 10.16 --size-y 19.06 --round > Kingbright/SX03.fp
./fpgen --module dil --name "SX32"    --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row  5.08 --size-x  7.50 --size-y 13.00 --round > Kingbright/SX32.fp
./fpgen --module dil --name "SX36"    --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row  5.08 --size-x  7.50 --size-y 14.00 --round > Kingbright/SX36.fp
./fpgen --module dil --name "SX39"    --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row  7.62 --size-x 10.00 --size-y 13.00 --round > Kingbright/SX39.fp

./fpgen --module dil --name "SX04" --pins 14 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row  7.50 --size-x  9.80 --size-y 18.75 --round > Kingbright/SX04.fp
./fpgen --module dil --name "SX43" --pins 14 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row  7.62 --size-x 12.60 --size-y 19.00 --round > Kingbright/SX43.fp
./fpgen --module dil --name "SX05" --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 19.00 --size-y 12.70 --round --rotate -90 > Kingbright/SX05.fp
./fpgen --module dil --name "SX52" --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 17.50 --size-y 12.40 --round --rotate -90 > Kingbright/SX52.fp
./fpgen --module dil --name "SX56" --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 19.05 --size-y 12.70 --round --rotate -90 > Kingbright/SX56.fp

./fpgen --module dil --name "SX08-11" --pins 16 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 20.00 --size-y 27.70 --round > Kingbright/SX08-11.fp
./fpgen --module dil --name "SX08-12" --pins 16 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 20.00 --size-y 27.70 --round > Kingbright/SX08-12.fp
./fpgen --module dil --name "SX08-21" --pins 18 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 18.60 --size-y 25.00 --round > Kingbright/SX08-21.fp

./fpgen --module dil --name "SX10-11" --pins 14 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 15.24 --size-x 22.50 --size-y 32.90 --round > Kingbright/SX10-11.fp
./fpgen --module dil --name "SX10-21" --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 30.40 --size-x 34.00 --size-y 24.00 --round --rotate -90 > Kingbright/SX10-21.fp

./fpgen --module dil --name  "SX15" --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 40.64 --size-x 47.00 --size-y 33.15 --round --rotate -90 > Kingbright/SX15.fp
./fpgen --module dil --name "SBX15" --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 40.64 --size-x 47.00 --size-y 33.15 --round --rotate -90 > Kingbright/SX15.fp

./fpgen --module dil --name  "SX18" --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 48.26 --size-x 56.00 --size-y 38.00 --round --rotate -90 > Kingbright/SX18.fp
./fpgen --module dil --name "SBX18" --pins 10 --pitch 2.54 --pad-width 1.30 --pad-length 2.50 --row 48.26 --size-x 56.00 --size-y 38.00 --round --rotate -90 > Kingbright/SX18.fp

# KB09 TECHNICAL NOTES 1.pdf
./fpgen --module so --name "KCSX02" --pins 10 --pitch 1.44 --pad-width 0.9 --pad-length 2.8 --row 10.0 --rotate -90 > Kingbright/SMD_KCSX02.fp
./fpgen --module so --name "KCDX02" --pins 20 --pitch 1.44 --pad-width 0.9 --pad-length 2.8 --row 10.0 --rotate -90 > Kingbright/SMD_KCDX02.fp
./fpgen --module so --name "KCSX03" --pins 10 --pitch 1.50 --pad-width 1.0 --pad-length 3.0 --row 12.0 --rotate -90 > Kingbright/SMD_KCSX03.fp
./fpgen --module so --name "KCDX03" --pins 20 --pitch 1.50 --pad-width 1.0 --pad-length 3.0 --row 12.0 --rotate -90 > Kingbright/SMD_KCDX03.fp
./fpgen --module so --name "KCSX39" --pins 10 --pitch 1.90 --pad-width 1.5 --pad-length 2.6 --row 14.3 --rotate -90 > Kingbright/SMD_KCSX39.fp
./fpgen --module so --name "KCDX39" --pins 10 --pitch 2.54 --pad-width 2.2 --pad-length 3.4 --row 15.0 --rotate -90 > Kingbright/SMD_KCDX39.fp
./fpgen --module so --name "KCSX04" --pins 10 --pitch 1.88 --pad-width 1.2 --pad-length 3.0 --row 15.0 --rotate -90 > Kingbright/SMD_KCSX04.fp
./fpgen --module so --name "KCDX04" --pins 20 --pitch 1.88 --pad-width 1.2 --pad-length 3.0 --row 15.0 --rotate -90 > Kingbright/SMD_KCDX04.fp
./fpgen --module so --name "KCSX51" --pins 10 --pitch 2.40 --pad-width 1.8 --pad-length 3.4 --row 17.5 --rotate -90 > Kingbright/SMD_KCSX51.fp
./fpgen --module so --name "KCDX51" --pins 10 --pitch 2.54 --pad-width 2.2 --pad-length 3.4 --row 17.5 --rotate -90 > Kingbright/SMD_KCDX51.fp
./fpgen --module so --name "KCSX56" --pins 10 --pitch 2.54 --pad-width 1.7 --pad-length 3.4 --row 19.0 --rotate -90 > Kingbright/SMD_KCSX56.fp
./fpgen --module so --name "KCDX56" --pins 20 --pitch 2.54 --pad-width 1.7 --pad-length 3.4 --row 19.0 --rotate -90 > Kingbright/SMD_KCDX56.fp

./fpgen --module so --name "KCPSX04" --pins 10 --pitch 1.90 --pad-width 1.2 --pad-length 2.5 --row 19.0 --rotate -90 > Kingbright/SMD_KCPSX04.fp
./fpgen --module so --name "KCPSX04" --pins 6 --pitch 2.60 --pad-width 1.3 --pad-length 1.3 --row 14.2 --rotate -90 >> Kingbright/SMD_KCPSX04.fp

./fpgen --module so --name "KCPDX04" --pins 20 --pitch 1.90 --pad-width 1.2 --pad-length 2.5 --row 19.0 --rotate -90 > Kingbright/SMD_KCPDX04.fp
./fpgen --module so --name "KCPDX04" --pins 12 --pitch 2.60 --pad-width 1.3 --pad-length 1.3 --row 14.2 --rotate -90 >> Kingbright/SMD_KCPDX04.fp
