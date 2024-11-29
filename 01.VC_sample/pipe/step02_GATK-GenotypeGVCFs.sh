gatk --java-options '-Djava.io.tmpdir=./tmp' GenotypeGVCFs \
--reference             ../reference/ref.fa \
--variant               result/pooled.HaplotypeCaller.g.vcf \
-stand-call-conf        30 \
--max-alternate-alleles 30 \
--output                result/pooled.HaplotypeCaller.all.vcf \
1>                      result/pooled.HaplotypeCaller.all.vcf.log \
2>                      result/pooled.HaplotypeCaller.all.vcf.err
