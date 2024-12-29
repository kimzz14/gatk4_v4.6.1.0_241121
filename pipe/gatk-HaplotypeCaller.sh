############################################################################################
readID=$1

############################################################################################

if [ -z ${readID} ]; then
    echo "readID is empty."
    exit 1
fi

gatk --java-options "-Djava.io.tmpdir=./tmp" HaplotypeCaller \
-ERC        GVCF \
--reference db/ref.fa \
--input     result/${readID}.bam \
--output    result/${readID}.HaplotypeCaller.g.vcf \
1>          result/${readID}.HaplotypeCaller.g.vcf.log \
2>          result/${readID}.HaplotypeCaller.g.vcf.err

#--create-output-variant-index false \
