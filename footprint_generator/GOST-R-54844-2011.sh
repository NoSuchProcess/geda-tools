#!/bin/bash

PAD_WIDTH=1.2
PAD_LENGTH=2.2

for pitch in 2.5 2.54; do
space=$pitch
mkdir -p GOST-R-54844-2011/${pitch}mm
[ "${pitch}" = 2.5  ] && { space3=7.50; space4=10.00; space5=12.50; space6=15.00; space7=17.50; space9=22.50; space11=27.50; }
[ "${pitch}" = 2.54 ] && { space3=7.62; space4=10.16; space5=12.70; space6=15.24; space7=17.78; space9=22.86; space11=27.94; }

./fpgen --module dil --name '2145.4'  --pins 4  --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 7.0  --round > GOST-R-54844-2011/${space}mm/2145.4.fp
./fpgen --module dil --name '2141.6'  --pins 6  --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 9.5  --round > GOST-R-54844-2011/${space}mm/2141.6.fp
./fpgen --module dil --name '2101.8'  --pins 8  --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 12.0 --round > GOST-R-54844-2011/${space}mm/2101.8.fp
./fpgen --module dil --name '2148.10' --pins 10 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 14.5 --round > GOST-R-54844-2011/${space}mm/2148.10.fp
./fpgen --module dil --name '2149.12' --pins 12 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 17.0 --round > GOST-R-54844-2011/${space}mm/2149.12.fp
./fpgen --module dil --name '2102.14' --pins 14 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 19.5 --round > GOST-R-54844-2011/${space}mm/2102.14.fp
./fpgen --module dil --name '2103.16' --pins 16 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 22.0 --round > GOST-R-54844-2011/${space}mm/2103.16.fp
./fpgen --module dil --name '2104.18' --pins 18 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 24.5 --round > GOST-R-54844-2011/${space}mm/2104.18.fp
./fpgen --module dil --name '2140.20' --pins 20 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 27.0 --round > GOST-R-54844-2011/${space}mm/2140.20.fp
./fpgen --module dil --name '2146.22' --pins 22 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 29.5 --round > GOST-R-54844-2011/${space}mm/2146.22.fp
./fpgen --module dil --name '2142.24' --pins 24 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 32.0 --round > GOST-R-54844-2011/${space}mm/2142.24.fp
./fpgen --module dil --name '2150.28' --pins 28 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space3} --size-x 6.0 --size-y 37.0 --round > GOST-R-54844-2011/${space}mm/2150.28.fp

./fpgen --module dil --name '2105.14' --pins 14 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space4} --size-x 8.5 --size-y 19.5 --round > GOST-R-54844-2011/${space}mm/2105.14.fp
./fpgen --module dil --name '2106.16' --pins 16 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space4} --size-x 8.5 --size-y 22.0 --round > GOST-R-54844-2011/${space}mm/2106.16.fp
./fpgen --module dil --name '2107.18' --pins 18 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space4} --size-x 8.5 --size-y 24.5 --round > GOST-R-54844-2011/${space}mm/2107.18.fp
./fpgen --module dil --name '2143.20' --pins 20 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space4} --size-x 8.5 --size-y 27.0 --round > GOST-R-54844-2011/${space}mm/2143.20.fp
./fpgen --module dil --name '2108.22' --pins 22 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space4} --size-x 8.5 --size-y 29.5 --round > GOST-R-54844-2011/${space}mm/2108.22.fp
./fpgen --module dil --name '2109.24' --pins 24 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space4} --size-x 8.5 --size-y 32.0 --round > GOST-R-54844-2011/${space}mm/2109.24.fp

./fpgen --module dil --name '2114.32' --pins 32 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space5} --size-x 11.0 --size-y 42.0 --round > GOST-R-54844-2011/${space}mm/2114.32.fp

./fpgen --module dil --name '2115.14' --pins 14 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 19.5 --round > GOST-R-54844-2011/${space}mm/2115.14.fp
./fpgen --module dil --name '2116.16' --pins 16 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 22.0 --round > GOST-R-54844-2011/${space}mm/2116.16.fp
./fpgen --module dil --name '2117.18' --pins 18 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 24.5 --round > GOST-R-54844-2011/${space}mm/2117.18.fp
./fpgen --module dil --name '2118.20' --pins 20 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 27.0 --round > GOST-R-54844-2011/${space}mm/2118.20.fp
./fpgen --module dil --name '2120.24' --pins 24 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 32.0 --round > GOST-R-54844-2011/${space}mm/2120.24.fp
./fpgen --module dil --name '2121.28' --pins 28 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 37.0 --round > GOST-R-54844-2011/${space}mm/2121.28.fp
./fpgen --module dil --name '2122.32' --pins 32 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 42.0 --round > GOST-R-54844-2011/${space}mm/2122.32.fp
./fpgen --module dil --name '2123.40' --pins 40 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 52.0 --round > GOST-R-54844-2011/${space}mm/2123.40.fp
./fpgen --module dil --name '2124.42' --pins 42 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 54.5 --round > GOST-R-54844-2011/${space}mm/2124.42.fp
./fpgen --module dil --name '2125.44' --pins 44 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 57.0 --round > GOST-R-54844-2011/${space}mm/2125.44.fp
./fpgen --module dil --name '2126.48' --pins 48 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 62.0 --round > GOST-R-54844-2011/${space}mm/2126.48.fp
./fpgen --module dil --name '2128.64' --pins 64 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space6} --size-x 13.5 --size-y 82.0 --round > GOST-R-54844-2011/${space}mm/2128.64.fp

./fpgen --module dil --name '2127.14' --pins 14 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space7} --size-x 16.0 --size-y 19.5 --round > GOST-R-54844-2011/${space}mm/2127.14.fp
./fpgen --module dil --name '2130.24' --pins 24 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space7} --size-x 16.0 --size-y 32.0 --round > GOST-R-54844-2011/${space}mm/2130.24.fp
./fpgen --module dil --name '2152.28' --pins 28 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space7} --size-x 16.0 --size-y 37.0 --round > GOST-R-54844-2011/${space}mm/2152.28.fp
./fpgen --module dil --name '2132.32' --pins 32 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space7} --size-x 16.0 --size-y 42.0 --round > GOST-R-54844-2011/${space}mm/2132.32.fp
./fpgen --module dil --name '2129.48' --pins 48 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space9} --size-x 21.0 --size-y 62.0 --round > GOST-R-54844-2011/${space}mm/2129.48.fp
./fpgen --module dil --name '2131.50' --pins 50 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space9} --size-x 21.0 --size-y 64.5 --round > GOST-R-54844-2011/${space}mm/2131.50.fp
./fpgen --module dil --name '2133.52' --pins 52 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space9} --size-x 21.0 --size-y 67.0 --round > GOST-R-54844-2011/${space}mm/2133.52.fp
./fpgen --module dil --name '2136.64' --pins 64 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space9} --size-x 21.0 --size-y 82.0 --round > GOST-R-54844-2011/${space}mm/2136.64.fp
./fpgen --module dil --name '2138.30' --pins 30 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space11} --size-x 26.0 --size-y 39.5 --round > GOST-R-54844-2011/${space}mm/2138.30.fp
./fpgen --module dil --name '2147.64' --pins 64 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch $pitch --row ${space11} --size-x 26.0 --size-y 82.0 --round > GOST-R-54844-2011/${space}mm/2147.64.fp
done

mkdir -p GOST-R-54844-2011/1.778mm
./fpgen --module dil --name '2171.42' --pins 42 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch 1.778 --row 15.24 --size-x 13.24 --size-y 38.5 --round > GOST-R-54844-2011/1.778mm/2171.42.fp
./fpgen --module dil --name '2151.52' --pins 52 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch 1.778 --row 15.24 --size-x 13.24 --size-y 47.7 --round > GOST-R-54844-2011/1.778mm/2151.52.fp
./fpgen --module dil --name '2110.30' --pins 30 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch 1.778 --row 10.16 --size-x 8.16  --size-y 28.5 --round > GOST-R-54844-2011/1.778mm/2110.30.fp
./fpgen --module dil --name '2111.42' --pins 42 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch 1.778 --row 15.24 --size-x 13.24 --size-y 38.6 --round > GOST-R-54844-2011/1.778mm/2111.42.fp
./fpgen --module dil --name '2112.52' --pins 52 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch 1.778 --row 15.24 --size-x 13.24 --size-y 47.8 --round > GOST-R-54844-2011/1.778mm/2112.52.fp
./fpgen --module dil --name '2113.56' --pins 56 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch 1.778 --row 15.24 --size-x 13.24 --size-y 52.1 --round > GOST-R-54844-2011/1.778mm/2113.56.fp
./fpgen --module dil --name '2153.64' --pins 64 --pad-width $PAD_WIDTH --pad-length $PAD_LENGTH --pitch 1.778 --row 19.05 --size-x 17.05 --size-y 58.7 --round > GOST-R-54844-2011/1.778mm/2153.64.fp
