sh pipe/step01_GATK-CombineGVCFs.sh
sh pipe/step02_GATK-GenotypeGVCFs.sh

#SNP
sh pipe/step11_GATK-SplitVCF_SNP.sh
sh pipe/step12_GATK-VariantFiltration-SNP.sh
sh pipe/step13_GATK-SelectVariants-SNP.sh
sh pipe/step14_GATK-VariantsToTable-SNP.sh

#InDel
sh pipe/step21_GATK-SplitVCF_InDel.sh
sh pipe/step22_GATK-VariantFiltration-InDel.sh
sh pipe/step23_GATK-SelectVariants-InDel.sh
sh pipe/step24_GATK-VariantsToTable-InDel.sh

#All
sh pipe/step03_GATK-VariantsToTable.sh