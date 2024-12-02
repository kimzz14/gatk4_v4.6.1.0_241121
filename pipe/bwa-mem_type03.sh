############################################################################################
readID=$1
threadN=$2

readDir=/test
############################################################################################

bwa mem \
    -t ${threadN} \
    -x pacbio \
       reference/ref.fa \
       ${readDir}/${readID}.fastq.gz \
    1> result/${readID}.bwa-memT03.sam \
    2> result/${readID}.bwa-memT03.log 

samtools flagstat \
       result/${readID}.bwa-memT03.sam \
    1> result/${readID}.bwa-memT03.flagstat \
    2> result/${readID}.bwa-memT03.flagstat.log