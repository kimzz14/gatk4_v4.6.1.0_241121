gatk --java-options '-Djava.io.tmpdir=./tmp' SelectVariants \
    --reference ../db/ref.fa \
    --variant result/pooled.HaplotypeCaller.all.indel.filtered.vcf \
    --exclude-filtered \
    --exclude-non-variants \
    --output result/pooled.HaplotypeCaller.all.indel.filtered.pass.vcf \
    1>       result/pooled.HaplotypeCaller.all.indel.filtered.pass.vcf.log \
    2>       result/pooled.HaplotypeCaller.all.indel.filtered.pass.vcf.err
