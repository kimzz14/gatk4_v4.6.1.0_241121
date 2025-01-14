############################################################################################
threadN=$1
readID=$2
readDir=/test
############################################################################################

if [ -z ${readID} ]; then
    echo "readID is empty."
    exit 1
fi

if [ -z ${threadN} ]; then
    echo "threadN is empty."
    exit 1
fi

bwa \
    mem \
    -5SP \
    -T0 \
    -t ${threadN} \
    bwaDB/ref.fa \
    ${readDir}/${readID}_1.fastq.gz \
    ${readDir}/${readID}_2.fastq.gz \
    2>  result/${readID}.bwa-memT002.log \
    | samtools view -bS \
    -o  result/${readID}.bwa-memT002.bam

#T0xx = Short-read
#T002 = 
#T1xx = Long-read