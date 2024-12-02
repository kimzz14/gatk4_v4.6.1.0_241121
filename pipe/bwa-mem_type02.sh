############################################################################################
readID=$1
threadN=$2

readDir=/test
############################################################################################

bwa mem \
    -t          ${threadN} \
                reference/ref.fa \
                ${readDir}/${readID}-P_1.fastq.gz \
                 ${readDir}/${readID}-P_2.fastq.gz \
    1>           result/${readID}.bwa-memT02-pe.sam \
    2>           result/${readID}.bwa-memT02-pe.sam.log 

samtools flagstat \
                 result/${readID}.bwa-memT02-pe.sam \
    1>           result/${readID}.bwa-memT02-pe.sam.flagstat \
    2>           result/${readID}.bwa-memT02-pe.sam.flagstat.log

bwa mem \
    -t           ${threadN} \
                 reference/ref.fa \
                 ${readDir}/${readID}-U_1.fastq.gz \
    1>           result/${readID}.bwa-memT02-se.1.sam \
    2>           result/${readID}.bwa-memT02-se.1.sam.log 
    
    samtools flagstat \
                 result/${readID}.bwa-memT02-se.1.sam \
    1>           result/${readID}.bwa-memT02-se.1.sam.flagstat \
    2>           result/${readID}.bwa-memT02-se.1.sam.flagstat.log

bwa mem \
    -t           ${threadN} \
                 reference/ref.fa \
                 ${readDir}/${readID}-U_2.fastq.gz \
    1>           result/${readID}.bwa-memT02-se.2.sam \
    2>           result/${readID}.bwa-memT02-se.2.sam.log 
    
    samtools flagstat \
                 result/${readID}.bwa-memT02-se.2.sam \
    1>           result/${readID}.bwa-memT02-se.2.sam.flagstat \
    2>           result/${readID}.bwa-memT02-se.2.sam.flagstat.log

gatk --java-options "-Djava.io.tmpdir=./tmp" MergeSamFiles \
    --INPUT      result/${readID}.bwa-memT02-pe.sam \
    --INPUT      result/${readID}.bwa-memT02-se.1.sam \
    --INPUT      result/${readID}.bwa-memT02-se.2.sam \
    --SORT_ORDER coordinate \
    --OUTPUT     result/${readID}.bwa-memT02.bam \
    1>           result/${readID}.bwa-memT02.bam.log \
    2>           result/${readID}.bwa-memT02.bam.err

samtools flagstat \
                 result/${readID}.bwa-memT02.bam \
    1>           result/${readID}.bwa-memT02.bam.flagstat \
    2>           result/${readID}.bwa-memT02.bam.flagstat.log