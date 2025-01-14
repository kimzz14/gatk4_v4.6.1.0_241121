#SNP
bash pipe/gatk-SplitVCF_SNP.sh
bash pipe/gatk-VariantFiltration-SNP.sh
bash pipe/gatk-SelectVariants-SNP.sh
bash pipe/gatk-VariantsToTable.sh pooled.HaplotypeCaller.all.snp.filtered.pass
