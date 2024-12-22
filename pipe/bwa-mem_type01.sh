############################################################################################
readID=$1
threadN=$2

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

bwa mem \
    -t ${threadN} \
    reference/ref.fa \
    ${readDir}/${readID}_1.fastq.gz \
    ${readDir}/${readID}_2.fastq.gz \
    2>  result/${readID}.bwa-memT01.bam.log \
    | samtools view -bS \
    -o  result/${readID}.bwa-memT01.bam

samtools flagstat \
        result/${readID}.bwa-memT01.bam \
    1>  result/${readID}.bwa-memT01.bam.flagstat \
    2>  result/${readID}.bwa-memT01.bam.flagstat.log