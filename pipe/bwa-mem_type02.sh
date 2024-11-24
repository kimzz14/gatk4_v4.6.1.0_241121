############################################################################################
readID=$1
threadN=$2

readDir=/test
############################################################################################

bwa mem \
            -t ${threadN} \
             reference/ref.fa \
             ${readDir}/${readID}-P_1.fastq.gz \
             ${readDir}/${readID}-P_2.fastq.gz \
1>           result/${readID}.bwa-memT02-pe.sam \
2>           result/${readID}.bwa-memT02-pe.sam.log 

samtools flagstat \
result/${readID}.bwa-memT02-pe.sam \
1>           result/${readID}.bwa-memT02-pe.sam.flagstat \
2>           result/${readID}.bwa-memT02-pe.sam.flagstat.log

for i in 1 2
do
    bwa mem \
             -t ${threadN} \
             reference/ref.fa \
             ${readDir}/${readID}-U_${i}.fastq.gz \
    1>       result/${readID}.bwa-memT02-se.${i}.sam \
    2>       result/${readID}.bwa-memT02-se.${i}.sam.log 
    
    samtools flagstat \
             result/${readID}.bwa-memT02-se.${i}.sam \
    1>       result/${readID}.bwa-memT02-se.${i}.sam.flagstat \
    2>       result/${readID}.bwa-memT02-se.${i}.sam.flagstat.log

done

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