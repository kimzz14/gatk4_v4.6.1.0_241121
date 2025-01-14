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

bwa mem \
    -t ${threadN} \
    -x pacbio \
    db/bwaDB/ref.fa \
    ${readDir}/${readID}.fastq.gz \
    2>  result/${readID}.bwa-memT101.bam.log \
    | samtools view -bS \
    -o  result/${readID}.bwa-memT101.bam

samtools flagstat \
        result/${readID}.bwa-memT101.bam \
    1>  result/${readID}.bwa-memT101.bam.flagstat \
    2>  result/${readID}.bwa-memT101.bam.flagstat.log