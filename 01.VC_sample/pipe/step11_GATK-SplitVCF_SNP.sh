gatk --java-options '-Djava.io.tmpdir=./tmp' SelectVariants \
--reference ../reference/ref.fa \
-select-type SNP \
--variant result/pooled.HaplotypeCaller.all.vcf.gz \
--output  result/pooled.HaplotypeCaller.all.snp.vcf.gz \
1>        result/pooled.HaplotypeCaller.all.snp.vcf.gz.log \
2>        result/pooled.HaplotypeCaller.all.snp.vcf.gz.err