#!/bin/bash -l

# Define directories, files and issue date/time
CODE_DIR=/home/users/avapps/uas/UAS
export START_DATE=$(date -u -d '-1 hour' '+%Y%m%d')
export START_TIME=$(date -u -d '-1 hour' '+%H')
export USER=avapps
export BEST_DATA_DIR=/critical/opfc/suites-oper/bestdata_main/share/bestdata_main
export START_DATE_TIME=$(date -u -d '-1 hour' '+%Y%m%d%H')
export SCRATCH_DIR=/data/scratch/avapps/uas
export HTML_DIR=/home/users/avapps/public_html/uas
export DATA_FILE=${CODE_DIR}/Best_Data_sites.nml
export URL_START=https://wwwspice/~avapps/uav/html
export MASS_DIR=moose:/adhoc/projects/avapps/uav

# Load scitools
module load scitools/default-next
# Run best data WBGT code
cd ${CODE_DIR}
time python bd_uas_forecast.py > ${HTML_DIR}/logs/${START_DATE_TIME}.txt 2>&1 &
