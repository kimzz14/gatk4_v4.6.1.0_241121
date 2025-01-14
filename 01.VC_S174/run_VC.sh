bash pipe/gatk-CombineGVCFs.sh
bash pipe/gatk-GenotypeGVCFs.sh
bash pipe/gatk-SplitVCF_SNP.sh

#bash pipe/run_VC.sh

#bash pipe/gatk-CombineGVCFs.sh
#bash pipe/gatk-GenotypeGVCFs.sh

#bash pipe/run_VC-SNP.sh
#bash pipe/run_VC-InDel.sh
#bash pipe/run_VC-All.sh


#bash pipe/gatk-CombineGVCFs.sh
#bash pipe/gatk-GenotypeGVCFs.sh

#bash pipe/gatk-VariantsToTable.sh pooled.HaplotypeCaller.all
#SNP
#bash pipe/gatk-SplitVCF_SNP.sh
#bash pipe/gatk-VariantFiltration-SNP.sh
#bash pipe/gatk-SelectVariants-SNP.sh
#bash pipe/gatk-VariantsToTable.sh pooled.HaplotypeCaller.all.snp.filtered.pass

#InDel
#bash pipe/gatk-SplitVCF_InDel.sh
#bash pipe/gatk-VariantFiltration-InDel.sh
#bash pipe/gatk-SelectVariants-InDel.sh
#bash pipe/gatk-VariantsToTable.sh pooled.HaplotypeCaller.all.indel.filtered
