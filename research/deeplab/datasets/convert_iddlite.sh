#!/bin/bash
# Usage:
#   bash ./convert_iddlite.sh
#
# The folder structure is assumed to be:
#  + datasets
#     - build_data.py
#     - build_idd_lite_data.py
#     - convert_iddlite.sh
#     + idd_lite
#       + gtFine
#         + train
#         + val
#       + leftImg8bit
#         + train
#         + val

# Exit immediately if a command exits with a non-zero status.
set -e

CURRENT_DIR=$(pwd)
WORK_DIR=${CURRENT_DIR}

# Root path for IDD Lite dataset.
IDD_LITE_ROOT="${WORK_DIR}/idd_lite"

# Build TFRecords of the dataset.
# First, create output directory for storing TFRecords.
OUTPUT_DIR="${WORK_DIR}/tfrecord"
mkdir -p "${OUTPUT_DIR}"

echo "Converting IDD Lite dataset..."
python ./build_idd_lite_data.py  \
  --train_image_folder="${IDD_LITE_ROOT}/leftImg8bit/train/" \
  --train_image_label_folder="${IDD_LITE_ROOT}/gtFine/train/" \
  --val_image_folder="${IDD_LITE_ROOT}/leftImg8bit/val/" \
  --val_image_label_folder="${IDD_LITE_ROOT}/gtFine/val/" \
  --output_dir="${OUTPUT_DIR}"
