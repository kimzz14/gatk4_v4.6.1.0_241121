#InDel
bash pipe/gatk-SplitVCF_InDel.sh
bash pipe/gatk-VariantFiltration-InDel.sh
bash pipe/gatk-SelectVariants-InDel.sh
bash pipe/gatk-VariantsToTable.sh pooled.HaplotypeCaller.all.indel.filtered
