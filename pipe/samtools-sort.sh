############################################################################################
readID=$1
############################################################################################

if [ -z ${readID} ]; then
    echo "readID is empty."
    exit 1
fi

samtools sort -o  result/${readID}.sorted.bam ${readID}.bam
samtools index -c result/${readID}.sorted.bam