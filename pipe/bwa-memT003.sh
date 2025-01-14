############################################################################################
threadN=$1
readID=$2
tLen=$3 #mean, std, max, min #445,97,800,100
readDir=/archive/kimzz14/SRA_RAW/NAAS/Triticum_aestivum/Keumkang/NGS/01.fastqSampler/result
############################################################################################

if [ -z ${readID} ]; then
    echo "readID is empty."
    exit 1
fi

if [ -z ${threadN} ]; then
    echo "threadN is empty."
    exit 1
fi

if [ -z ${tLen} ]; then
    echo "tLen is empty."
    exit 1
fi

bwa mem \
    -t ${threadN} \
    -I ${tLen} \
    db/bwaDB/ref.fa \
    ${readDir}/${readID}_1.fastq.gz \
    ${readDir}/${readID}_2.fastq.gz \
    2>  result/${readID}.bwa-memT003.bam.log \
    | samtools view -bS \
    -o  result/${readID}.bwa-memT003.bam

