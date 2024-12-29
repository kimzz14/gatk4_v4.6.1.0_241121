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

#pair-end
bwa mem \
    -t ${threadN} \
    db/bwaDB/ref.fa \
    ${readDir}/${readID}-P_1.fastq.gz \
    ${readDir}/${readID}-P_2.fastq.gz \
    2>  result/${readID}.bwa-memT02-pe.bam.log \
    | samtools view -bS \
    -o  result/${readID}.bwa-memT02-pe.bam

samtools flagstat \
        result/${readID}.bwa-memT02-pe.bam \
    1>  result/${readID}.bwa-memT02-pe.bam.flagstat \
    2>  result/${readID}.bwa-memT02-pe.bam.flagstat.log

#single-end 1
bwa mem \
    -t ${threadN} \
    reference/ref.fa \
    ${readDir}/${readID}-U_1.fastq.gz \
    2>  result/${readID}.bwa-memT02-se.1.bam.log \
    | samtools view -bS \
    -o  result/${readID}.bwa-memT02-se.1.bam
    
    samtools flagstat \
        result/${readID}.bwa-memT02-se.1.bam \
    1>  result/${readID}.bwa-memT02-se.1.bam.flagstat \
    2>  result/${readID}.bwa-memT02-se.1.bam.flagstat.log

#single-end 2
bwa mem \
    -t ${threadN} \
    reference/ref.fa \
    ${readDir}/${readID}-U_2.fastq.gz \
    2>  result/${readID}.bwa-memT02-se.2.bam.log \
    | samtools view -bS \
    -o  result/${readID}.bwa-memT02-se.2.bam
    
    samtools flagstat \
        result/${readID}.bwa-memT02-se.2.bam \
    1>  result/${readID}.bwa-memT02-se.2.bam.flagstat \
    2>  result/${readID}.bwa-memT02-se.2.bam.flagstat.log

#merge
samtools merge \
    -o  result/${readID}.bwa-memT02.bam \
        result/${readID}.bwa-memT02-pe.bam \
        result/${readID}.bwa-memT02-se.1.bam \
        result/${readID}.bwa-memT02-se.2.bam \
    1>  result/${readID}.bwa-memT02.bam.log \
    2>  result/${readID}.bwa-memT02.bam.err

samtools flagstat \
        result/${readID}.bwa-memT02.bam \
    1>  result/${readID}.bwa-memT02.bam.flagstat \
    2>  result/${readID}.bwa-memT02.bam.flagstat.log