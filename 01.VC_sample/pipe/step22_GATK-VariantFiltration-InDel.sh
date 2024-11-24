gatk --java-options '-Djava.io.tmpdir=./tmp' VariantFiltration \
--reference ../reference/ref.fa \
--variant result/pooled.HaplotypeCaller.all.indel.vcf.gz \
--filter-expression "QD < 2.0" \
--filter-name "INDEL_QD" \
--filter-expression "FS > 200.0" \
--filter-name "INDEL_FS" \
--filter-expression "SOR > 10.0" \
--filter-name "INDEL_SOR" \
--filter-expression "InbreedingCoeff < -0.8" \
--filter-name "INDEL_InbreedingCoeff" \
--filter-expression "ReadPosRankSum < -20.0" \
--filter-name "INDEL_ReadPosRankSum" \
--output result/pooled.HaplotypeCaller.all.indel.filtered.vcf.gz \
1>       result/pooled.HaplotypeCaller.all.indel.filtered.vcf.gz.log \
2>       result/pooled.HaplotypeCaller.all.indel.filtered.vcf.gz.err

#--filter-expression "DP  < 645" \
#--filter-name "INDEL_lowDP" \
#--filter-expression "DP  > 1290" \
#--filter-name "INDEL_hiDP" \
