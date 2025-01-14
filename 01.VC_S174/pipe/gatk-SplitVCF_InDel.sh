gatk --java-options '-Djava.io.tmpdir=./tmp' SelectVariants \
    --reference ../db/ref.fa \
    --select-type INDEL \
    --variant result/pooled.HaplotypeCaller.all.vcf \
    --output  result/pooled.HaplotypeCaller.all.indel.vcf \
    1>        result/pooled.HaplotypeCaller.all.indel.vcf.log \
    2>        result/pooled.HaplotypeCaller.all.indel.vcf.err
