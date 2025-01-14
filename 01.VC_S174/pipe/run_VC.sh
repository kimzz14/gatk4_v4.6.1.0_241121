bash pipe/gatk-CombineGVCFs.sh
bash pipe/gatk-GenotypeGVCFs.sh

bash pipe/run_VC-SNP.sh &
bash pipe/run_VC-InDel.sh &
bash pipe/run_VC-All.sh &
