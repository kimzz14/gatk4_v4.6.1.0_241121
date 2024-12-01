sh pipe/step01_GATK-CombineGVCFs.sh
sh pipe/step02_GATK-GenotypeGVCFs.sh

sh pipe/run_VC-SNP.sh &
sh pipe/run_VC-InDel.sh &
sh pipe/run_VC-All.sh &