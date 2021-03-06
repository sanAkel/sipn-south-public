#!/bin/bash
#
# Downloads and updates the 
# Sea ice Concentration product for OSISAF
# SSMIS Sea Ice Concentration Maps on 10 km Polar Stereographic Grid
# OSI-401-b
# http://osisaf.met.no/p/ice/index.html#conc-ssmis
# http://osisaf.met.no/docs/osisaf_cdop2_ss2_pum_ice-conc_v1p4.pdf
#
# www.osisaf.met.no
#
# Contact: François Massonnet - francois.massonnet@uclouvain.be
#

set -o nounset
set -o errexit
set -x

yearb=2015
yeare=2018
ftype="multi" # multi (= operational, OSI-401b) 

outdir=${TECLIM_CLIMATE_DATA}/obs/ice/siconc/OSI-SAF/OSI-401-b/raw

mkdir -p $outdir

#------------------------

for year in `seq $yearb $yeare`
do
  for month in 01 02 03 04 05 06 07 08 09 10 11 12
  do
    rootaddress="ftp://osisaf.met.no/archive/ice/conc/"
    wget -N -c $rootaddress/${year}/${month}/ice_conc_?h_polstere-100_${ftype}_${year}${month}??1200.nc -P $outdir
  done # month
done # year
