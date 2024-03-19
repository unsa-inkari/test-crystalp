#!/bin/bash
#SBATCH --job-name          test-crystalp
#SBATCH --time              720:00:00
#SBATCH --nodes             2
#SBATCH --tasks-per-node    24
#SBATCH --mem               62GB
#SBATCH --error             output-%j.error
#SBATCH --output            output-%j.output

# Eliminamos los modulos cargados
module purge

# Cargando los modulos necesarios
module load crystalp/23.0
source /opt/crystal23/crystalp/utils23/cry23.bashrc

export CRY23P_MACH=$(pwd)

#mkdir tmp
#export CRY23_SCRDIR=$(pwd)/tmp

scontrol show hostname 2>&1 > machines.LINUX
#sinfo -Nh | awk '{ print $1 }' 2>&1 > nodes.par
scontrol show hostname 2>&1 > nodes.par

#runcry23 test11
runPcry23 11 test11

