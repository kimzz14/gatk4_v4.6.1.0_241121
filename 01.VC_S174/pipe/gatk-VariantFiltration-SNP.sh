gatk --java-options '-Djava.io.tmpdir=./tmp' VariantFiltration \
    --reference ../db/ref.fa \
    --variant result/pooled.HaplotypeCaller.all.snp.vcf \
    --filter-expression "QD < 2.0" \
    --filter-name "SNP_QD" \
    --filter-expression "FS > 60.0" \
    --filter-name "SNP_FS" \
    --filter-expression "SOR > 4.0" \
    --filter-name "SNP_SOR" \
    --filter-expression "MQ < 40.0" \
    --filter-name "SNP_MQ" \
    --filter-expression "MQRankSum < -12.5" \
    --filter-name "SNP_MQRankSum" \
    --filter-expression "ReadPosRankSum  < -8.0" \
    --filter-name "SNP_ReadPosRankSum" \
    --output result/pooled.HaplotypeCaller.all.snp.filtered.vcf \
    1>       result/pooled.HaplotypeCaller.all.snp.filtered.vcf.log \
    2>       result/pooled.HaplotypeCaller.all.snp.filtered.vcf.err

#--filter-expression "DP  < 645" \
#--filter-name "SNP_lowDP" \
#--filter-expression "DP  > 1290" \
#--filter-name "SNP_hiDP" \
