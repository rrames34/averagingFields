#!/bin/bash
# Set the allocation to be charged for this job
# not required if you have set a default allocation

# The name of the script is myjob

# Only 1 hour wall-clock time will be given to this job
#SBATCH -t 0-00:10:00
#SBATCH -q public
#SBATCH -p htc
#SBATCH -N 1
#SBATCH -n 128
#SBATCH -c 1
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err
#SBATCH --export=NONE
# Number of MPI processes.
module purge
module load intel/parallel-studio-2020.4
#module load openmpi/4.1.5
#module load nek5000-19.0-gcc-12.1.0
# Run the executable  with 256 MPI-rank (8 nodes*32 cores/node)
casename='cylinder'
echo $casename > SESSION.NAME
echo `pwd`'/' >> SESSION.NAME
mpiexec.hydra -genvall -n 128 $(readlink -f nek5000)
#srun --mpi=pmix -n 128 $(readlink -f nek5000)
