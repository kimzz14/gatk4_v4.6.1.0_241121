############################################################################################
readID=$1
threadN=$2

readDir=/test
############################################################################################

bwa mem \
            -t ${threadN} \
             reference/ref.fa \
             ${readDir}/${readID}_1.fastq.gz \
             ${readDir}/${readID}_2.fastq.gz \
1>           result/${readID}.bwa-memT01.sam \
2>           result/${readID}.bwa-memT01.log 

samtools flagstat \
result/${readID}.bwa-memT01.sam \
1>           result/${readID}.bwa-memT01.flagstat \
2>           result/${readID}.bwa-memT01.flagstat.log