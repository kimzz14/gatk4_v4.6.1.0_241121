gatk --java-options '-Djava.io.tmpdir=./tmp' SelectVariants \
    --reference ../db/ref.fa \
    -select-type SNP \
    --variant result/pooled.HaplotypeCaller.all.vcf \
    --output  result/pooled.HaplotypeCaller.all.snp.vcf \
    1>        result/pooled.HaplotypeCaller.all.snp.vcf.log \
    2>        result/pooled.HaplotypeCaller.all.snp.vcf.err
