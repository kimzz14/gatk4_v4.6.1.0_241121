############################################################################################
threadN=$1
readID=$2

readDir=/archive/kimzz14/SRA_RAW/NAAS/Triticum_aestivum/Keumkang/ONT/data
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
    -x ont2d \
    db/bwaDB/ref.fa \
    ${readDir}/${readID}.fastq.gz \
    2>  result/${readID}.bwa-memT111.bam.log \
    | samtools view -bS \
    -o  result/${readID}.bwa-memT111.bam

samtools flagstat \
        result/${readID}.bwa-memT111.bam \
    1>  result/${readID}.bwa-memT111.bam.flagstat \
    2>  result/${readID}.bwa-memT111.bam.flagstat.log
