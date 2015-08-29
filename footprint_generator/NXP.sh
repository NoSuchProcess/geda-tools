#!/bin/bash

mkdir -p NXP


# http://www.nxp.com/documents/reflow_soldering/SO-SOJ-REFLOW.pdf
# http://www.nxp.com/documents/outline_drawing/sot163-1_po.pdf, etc
./fpgen --module so --name  SOT96-1 --pins  8 --size-x  4.00 --size-y  5.00 --pad-width 0.60 --pitch=1.27 --internal 4.00 --external  6.60 > NXP/SOT96-1.fp
./fpgen --module so --name SOT176-1 --pins  8 --size-x  7.60 --size-y  7.70 --pad-width 0.60 --pitch=1.27 --internal 8.00 --external 11.00 > NXP/SOT176-1.fp
./fpgen --module so --name SOT108-1 --pins 14 --size-x  4.00 --size-y  8.80 --pad-width 0.60 --pitch=1.27 --internal 4.00 --external  6.60 > NXP/SOT108-1.fp
./fpgen --module so --name SOT109-1 --pins 16 --size-x  4.00 --size-y 10.00 --pad-width 0.60 --pitch=1.27 --internal 4.00 --external  6.60 > NXP/SOT109-1.fp
./fpgen --module so --name SOT109-2 --pins 16 --size-x  4.00 --size-y 10.00 --pad-width 0.60 --pitch=1.27 --internal 4.00 --external  6.60 > NXP/SOT109-2.fp
./fpgen --module so --name SOT109-3 --pins 16 --size-x  4.00 --size-y 10.00 --pad-width 0.60 --pitch=1.27 --internal 4.00 --external  6.60 > NXP/SOT109-3.fp
./fpgen --module so --name SOT162-1 --pins 16 --size-x  7.60 --size-y 10.50 --pad-width 0.60 --pitch=1.27 --internal 8.00 --external 11.00 > NXP/SOT162-1.fp
./fpgen --module so --name SOT163-1 --pins 20 --size-x  7.60 --size-y 13.00 --pad-width 0.60 --pitch=1.27 --internal 8.00 --external 11.00 > NXP/SOT163-1.fp
./fpgen --module so --name SOT137-1 --pins 24 --size-x  7.60 --size-y 15.60 --pad-width 0.60 --pitch=1.27 --internal 8.00 --external 11.00 > NXP/SOT137-1.fp
./fpgen --module so --name SOT136-1 --pins 28 --size-x  7.60 --size-y 18.10 --pad-width 0.60 --pitch=1.27 --internal 8.00 --external 11.00 > NXP/SOT136-1.fp
./fpgen --module so --name SOT287-1 --pins 32 --size-x  7.60 --size-y 20.70 --pad-width 0.60 --pitch=1.27 --internal 8.00 --external 11.00 > NXP/SOT287-1.fp
./fpgen --module so --name SOT449-1 --pins 40 --size-x 10.30 --size-y 26.20 --pad-width 0.60 --pitch=1.27 --internal 7.30 --external 12.10 > NXP/SOT449-1.fp


# http://www.nxp.com/documents/reflow_soldering/HTQFP-HLQFP-LQFP-REFLOW.pdf
./fpgen --module qfp --name HTQFP32  --pins  32 --pitch 0.50 --external  7.40 --internal  5.50 --pad-width 0.25  --size  5.90 --thermal 3.50 > NXP/SOT547-1.fp
./fpgen --module qfp --name HTQFP32  --pins  32 --pitch 0.50 --external  7.40 --internal  5.30 --pad-width 0.28  --size  5.90 --thermal 3.10 > NXP/SOT547-2.fp
./fpgen --module qfp --name HTQFP48  --pins  48 --pitch 0.50 --external  9.50 --internal  7.30 --pad-width 0.25  --size  7.20 --thermal 4.60 > NXP/SOT545-2.fp
./fpgen --module qfp --name HTQFP80  --pins  80 --pitch 0.65 --external 16.35 --internal 14.15 --pad-width 0.40  --size 14.25 --thermal 5.90 > NXP/SOT513-1.fp
./fpgen --module qfp --name HLQFP100 --pins 100 --pitch 0.50 --external 16.50 --internal 14.20 --pad-width 0.30  --size 14.90 > NXP/SOT470-1.fp
./fpgen --module qfp --name LQFP32   --pins  32 --pitch 0.80 --external  9.50 --internal  7.30 --pad-width 0.40  --size  7.25 > NXP/SOT358-1.fp
./fpgen --module qfp --name LQFP32   --pins  32 --pitch 0.50 --external  7.40 --internal  5.20 --pad-width 0.30  --size  5.90 > NXP/SOT401-1.fp
./fpgen --module qfp --name LQFP44   --pins  44 --pitch 0.80 --external 12.35 --internal 10.35 --pad-width 0.40  --size 10.25 > NXP/SOT389-1.fp
./fpgen --module qfp --name LQFP48   --pins  48 --pitch 0.50 --external  9.50 --internal  7.30 --pad-width 0.285 --size  7.20 > NXP/SOT313-2.fp
./fpgen --module qfp --name LQFP64   --pins  64 --pitch 0.50 --external 12.50 --internal 10.30 --pad-width 0.285 --size 10.20 > NXP/SOT314-2.fp
./fpgen --module qfp --name LQFP64   --pins  64 --pitch 0.40 --external  9.40 --internal  7.20 --pad-width 0.23  --size  6.90 > NXP/SOT414-1.fp
./fpgen --module qfp --name LQFP80   --pins  80 --pitch 0.50 --external 14.50 --internal 12.30 --pad-width 0.285 --size 12.20 > NXP/SOT315-1.fp
./fpgen --module qfp --name LQFP100  --pins 100 --pitch 0.50 --external 16.50 --internal 14.20 --pad-width 0.300 --size 14.90 > NXP/SOT407-1.fp
./fpgen --module qfp --name LQFP128  --pins 128 --pitch 0.40 --external 16.40 --internal 14.20 --pad-width 0.23  --size 14.90 > NXP/SOT420-1.fp
./fpgen --module qfp --name LQFP144  --pins 144 --pitch 0.50 --external 22.35 --internal 20.15 --pad-width 0.285 --size 20.20 > NXP/SOT486-1.fp
./fpgen --module qfp --name LQFP160  --pins 160 --pitch 0.50 --external 26.35 --internal 24.15 --pad-width 0.285 --size 24.20 > NXP/SOT435-1.fp
./fpgen --module qfp --name LQFP176  --pins 176 --pitch 0.50 --external 26.35 --internal 24.15 --pad-width 0.285 --size 24.20 > NXP/SOT506-1.fp

./fpgen --module qfp --name LQFP128  --pins 128 --pins-y 38 --pins-x 26 --pitch 0.50 --external-y 22.50 --external 16.50 --internal-y 20.30 --internal 14.30 --pad-width 0.285 --size-y  20.20 --size-x 14.20 > NXP/SOT425-1.fp


# SO-SOJ-REFLOW.pdf
./fpgen --module so --name SO8  --pins  8 --pad-length 1.30 --pad-width 0.60 --pitch 1.27 --internal 5.30 --size-x 7.00 --size-y 5.50 > NXP/SOT96-1.fp
./fpgen --module so --name SO8  --pins  8 --pad-length 1.50 --pad-width 0.60 --pitch 1.27 --internal 9.50 --size-x 11.40 --size-y 8.40 > NXP/SOT176-1.fp
./fpgen --module so --name SO14 --pins 14 --pad-length 1.30 --pad-width 0.60 --pitch 1.27 --internal 5.30 --size-x 7.00 --size-y 9.30 > NXP/SOT108-1.fp
./fpgen --module so --name SO16 --pins 16 --pad-length 1.30 --pad-width 0.60 --pitch 1.27 --internal 5.30 --size-x 7.00 --size-y 10.50 > NXP/SOT109-1.fp
./fpgen --module so --name SO16 --pins 16 --pad-length 1.50 --pad-width 0.60 --pitch 1.27 --internal 9.50 --size-x 11.40 --size-y 10.90 > NXP/SOT162-1.fp
./fpgen --module so --name SO20 --pins 20 --pad-length 1.50 --pad-width 0.60 --pitch 1.27 --internal 9.50 --size-x 11.40 --size-y 13.40 > NXP/SOT163-1.fp
./fpgen --module so --name SO24 --pins 24 --pad-length 1.50 --pad-width 0.60 --pitch 1.27 --internal 9.50 --size-x 11.40 --size-y 16.00 > NXP/SOT137-1.fp
./fpgen --module so --name SO28 --pins 28 --pad-length 1.50 --pad-width 0.60 --pitch 1.27 --internal 9.50 --size-x 11.40 --size-y 18.50 > NXP/SOT136-1.fp
./fpgen --module so --name SO32 --pins 32 --pad-length 1.50 --pad-width 0.60 --pitch 1.27 --internal 9.50 --size-x 11.40 --size-y 21.20 > NXP/SOT287-1.fp

./fpgen --module so --name SOJ40 --pins 40 --pad-length 2.40 --pad-width 0.70 --pitch 1.27 --internal 9.70 --size-x 12.35 --size-y 26.50 > NXP/SOT449-1.fp

./fpgen --module so --name SSOP14 --pins 14 --pad-length 1.20 --pad-width 0.40 --pitch 0.65 --internal 6.90 --size-x 8.35 --size-y 4.55 > NXP/SOT337-1.fp
./fpgen --module so --name SSOP16 --pins 16 --pad-length 1.20 --pad-width 0.40 --pitch 0.65 --internal 6.90 --size-x 8.35 --size-y 5.20 > NXP/SOT338-1.fp
./fpgen --module so --name SSOP16 --pins 16 --pad-length 1.00 --pad-width 0.40 --pitch 0.65 --internal 5.80 --size-x 7.05 --size-y 5.55 > NXP/SOT369-1.fp
./fpgen --module so --name SSOP16 --pins 16 --pad-length 1.20 --pad-width 0.40 --pitch 0.635 --internal 5.20 --size-x 6.65 --size-y 5.151 > NXP/SOT519-1.fp
./fpgen --module so --name SSOP20 --pins 20 --pad-length 1.00 --pad-width 0.40 --pitch 0.65 --internal 5.80 --size-x 6.65 --size-y 6.85 > NXP/SOT266-1.fp
./fpgen --module so --name SSOP20 --pins 20 --pad-length 1.10 --pad-width 0.40 --pitch 0.65 --internal 7.00 --size-x 8.35 --size-y 6.50 > NXP/SOT339-1.fp
./fpgen --module so --name SSOP24 --pins 24 --pad-length 1.10 --pad-width 0.40 --pitch 0.65 --internal 7.00 --size-x 8.35 --size-y 7.80 > NXP/SOT340-1.fp
./fpgen --module so --name SSOP24 --pins 24 --pad-length 1.20 --pad-width 0.40 --pitch 0.635 --internal 5.20 --size-x 6.65 --size-y 7.70 > NXP/SOT556-1.fp
./fpgen --module so --name SSOP28 --pins 28 --pad-length 1.10 --pad-width 0.40 --pitch 0.65 --internal 7.00 --size-x 8.35 --size-y 9.10 > NXP/SOT341-1.fp
./fpgen --module so --name SSOP48 --pins 48 --pad-length 1.20 --pad-width 0.40 --pitch 0.635 --internal 9.40 --size-x 10.85 --size-y 15.255 > NXP/SOT370-1.fp
./fpgen --module so --name SSOP56 --pins 56 --pad-length 1.20 --pad-width 0.40 --pitch 0.635 --internal 9.40 --size-x 10.85 --size-y 17.795 > NXP/SOT371-1.fp

./fpgen --module so --name TSSOP8  --pins  8 --pad-length 1.10 --pad-width 0.40 --pitch 0.65 --internal 4.30 --size-x 6.00 --size-y 3.15 > NXP/SOT505-1.fp
./fpgen --module so --name TSSOP10 --pins 10 --pad-length 1.10 --pad-width 0.25 --pitch 0.50 --internal 4.30 --size-x 6.00 --size-y 3.15 > NXP/SOT552-1.fp
./fpgen --module so --name TSSOP14 --pins 14 --pad-length 1.10 --pad-width 0.40 --pitch 0.65 --internal 5.70 --size-x 7.05 --size-y 4.55 > NXP/SOT402-1.fp
./fpgen --module so --name TSSOP16 --pins 16 --pad-length 1.10 --pad-width 0.40 --pitch 0.65 --internal 5.70 --size-x 7.05 --size-y 5.25 > NXP/SOT403-1.fp
./fpgen --module so --name TSSOP20 --pins 20 --pad-length 1.10 --pad-width 0.40 --pitch 0.65 --internal 5.70 --size-x 7.05 --size-y 6.75 > NXP/SOT360-1.fp
./fpgen --module so --name TSSOP24 --pins 24 --pad-length 1.10 --pad-width 0.40 --pitch 0.65 --internal 5.70 --size-x 7.05 --size-y 8.05 > NXP/SOT355-1.fp
./fpgen --module so --name TSSOP28 --pins 28 --pad-length 1.10 --pad-width 0.40 --pitch 0.65 --internal 5.70 --size-x 7.05 --size-y 9.10 > NXP/SOT361-1.fp
./fpgen --module so --name TSSOP32 --pins 32 --pad-length 1.20 --pad-width 0.40 --pitch 0.65 --internal 7.30 --size-x 8.75 --size-y 10.446 > NXP/SOT487-1.fp
./fpgen --module so --name TSSOP38 --pins 38 --pad-length 1.10 --pad-width 0.285 --pitch 0.50 --internal 5.70 --size-x 7.05 --size-y 9.90 > NXP/SOT510-1.fp
./fpgen --module so --name TSSOP48 --pins 48 --pad-length 1.00 --pad-width 0.285 --pitch 0.50 --internal 7.50 --size-x 9.75 --size-y 13.035 > NXP/SOT362-1.fp
./fpgen --module so --name TSSOP56 --pins 56 --pad-length 1.00 --pad-width 0.285 --pitch 0.50 --internal 7.50 --size-x 9.75 --size-y 15.035 > NXP/SOT364-1.fp
