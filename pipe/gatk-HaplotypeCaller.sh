############################################################################################
threadN=$1
readID=$2
############################################################################################

if [ -z ${threadN} ]; then
    echo "threadN is empty."
    exit 1
fi

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

tabix \
    --csi \
    --threads ${threadN} \
                result/${readID}.HaplotypeCaller.g.vcf \
    1>          result/${readID}.HaplotypeCaller.g.vcf.csi.log \
    2>          result/${readID}.HaplotypeCaller.g.vcf.csi.err
