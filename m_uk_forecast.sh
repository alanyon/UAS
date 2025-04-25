#!/bin/bash -l
#SBATCH --qos=normal
#SBATCH --mem=20G
#SBATCH --ntasks=8
#SBATCH --output=/home/users/avapps/uas/log.out
#SBATCH --time=120
#SBATCH --error=/home/users/avapps/uas/log.err

# Define directories, files and issue date/time
CODE_DIR=/home/users/avapps/uas/UAS
START_DATE_TIME=$(date -u -d '-3 hour' '+%Y%m%d%H')
export USER=avapps
export MOG_UK_DIR=/critical/opfc/suites-oper/uk/share/cycle
export SCRATCH_DIR=/data/scratch/avapps/uas
export HTML_DIR=/home/users/avapps/public_html/uas
export URL_START=https://wwwspice/~avapps/uav/html
export SIDEBAR=${HTML_DIR}/html/sidebar.shtml
export MASS_DIR=moose:/adhoc/projects/avapps/uav

# Load scitools
module load scitools/default-next
# Run python code
cd ${CODE_DIR}
time python m_uk_leeming.py yes
# Copy err and out files to output directory
cp ${CODE_DIR}/log.out ${HTML_DIR}/logs/mog_uk_${START_DATE_TIME}.out
cp ${CODE_DIR}/log.err ${HTML_DIR}/logs/mog_uk_${START_DATE_TIME}.err
