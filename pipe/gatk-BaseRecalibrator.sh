
gatk --java-options '-Djava.io.tmpdir=./tmp' BaseRecalibrator \
-nct $2 \
-knownSites reference/dbsnp.vcf \
-R reference/Gmax_275_v2.0.Mt.Pltd.fa \
-I result/$1.RGsorted.dedupped.bam \
-o result/$1.RGsorted.dedupped.recal.grp \
1> result/$1.RGsorted.dedupped.recal.grp.log \
2> result/$1.RGsorted.dedupped.recal.grp.err \
&& gatk --java-options '-Djava.io.tmpdir=./tmp' PrintReads \
-nct $2 \
-BQSR result/$1.RGsorted.dedupped.recal.grp \
-R reference/genome.fa \
-I result/$1.RGsorted.dedupped.bam \
-o result/$1.RGsorted.dedupped.recal.bam \
1> result/$1.RGsorted.dedupped.recal.bam.log \
2> result/$1.RGsorted.dedupped.recal.bam.err
