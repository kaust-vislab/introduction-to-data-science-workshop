#!/bin/bash --login

set -e

# create the conda environment
export ENV_PREFIX=$PWD/env
conda env create --prefix $ENV_PREFIX --file environment.yml --force
conda activate $ENV_PREFIX
source postBuild
