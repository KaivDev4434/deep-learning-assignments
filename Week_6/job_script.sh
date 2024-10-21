#!/bin/bash -l
#SBATCH --job-name=Week6_Vanilla
#SBATCH --output=%x.%j.out # %x.%j expands to slurm JobName.JobID
#SBATCH --error=%x.%j.err
#SBATCH --partition=gpu
#SBATCH --qos=standard
#SBATCH --account=2024-fall-ds-677-gwang-kd454 # Replace PI_ucid which the NJIT UCID of PI
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=5:00:00  # D-HH:MM:SS
#SBATCH --mem-per-cpu=2G
#SBATCH --gres=gpu:1
# Load necessary modules
module load Miniforge3
module load CUDA

# Source conda
source conda.sh

# Check if the conda env already existes if not create a new and then activate it

# Name of the Conda environment you want to check or create
ENV_NAME="Week6Env"

# Check if the environment already exists
if conda info --envs | grep -q "$ENV_NAME"; then
    echo "Conda environment '$ENV_NAME' already exists."
else
    echo "Conda environment '$ENV_NAME' does not exist. Creating it now."
    # Create the environment (e.g., with Python 3.8)
    conda create -y -n "$ENV_NAME" python=3.9
fi

# Activate the environment
echo "Activating environment '$ENV_NAME'."
conda activate "$ENV_NAME"

#Run your code
python Week6_sample_code.py
