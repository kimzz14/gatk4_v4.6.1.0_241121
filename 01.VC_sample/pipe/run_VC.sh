sh pipe/step01_GATK-CombineGVCFs.sh
sh pipe/step02_GATK-GenotypeGVCFs.sh

sh run_VC-SNP.sh &
sh run_VC-InDel.sh &
sh run_VC-All.sh &