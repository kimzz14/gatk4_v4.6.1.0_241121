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

gatk --java-options "-Djava.io.tmpdir=./tmp" SplitNCigarReads \
--create-output-bam-index false \
--reference db/ref.fa \
--input     result/${readID}.bam \
--output    result/${readID}.SplitN.bam \
1>          result/${readID}.SplitN.bam.log \
2>          result/${readID}.SplitN.bam.err

#rm         result/${readID}.bam
#add 2024.08.29 --create-output-bam-index false

bash pipe/samtools-index.sh    ${threadN} ${readID}.SplitN
bash pipe/samtools-flagstat.sh ${threadN} ${readID}.SplitN bam
