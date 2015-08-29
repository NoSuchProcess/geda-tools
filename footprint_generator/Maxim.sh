#!/bin/bash

mkdir -p Maxim

./fpgen --module qfp --name T3255 --pins 32 --pad-width 0.30 --pitch 0.50 --external 5.63 --internal 4.03 --thermal 3.15 > Maxim/T3255.fp
./fpgen --module qfp --name T4055 --pins 40 --pad-width 0.25 --pitch 0.40 --external 5.63 --internal 4.03 --thermal 3.15 > Maxim/T4055.fp
./fpgen --module qfp --name T4866 --pins 48 --pad-width 0.20 --pitch 0.40 --external 6.75 --internal 5.05 --thermal 4.50 > Maxim/T4866.fp
