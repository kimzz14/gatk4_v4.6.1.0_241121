############################################################################################
readID=$1

############################################################################################

gatk --java-options "-Djava.io.tmpdir=./tmp" SplitNCigarReads \
--create-output-bam-index false \
--reference reference/ref.fa \
--input     result/${readID}.bam \
--output    result/${readID}.SplitN.bam \
1>          result/${readID}.SplitN.bam.log \
2>          result/${readID}.SplitN.bam.err

#rm         result/${readID}.bam
#add 2024.08.29 --create-output-bam-index false

samtools index \
            -c \
            result/${readID}.SplitN.bam \
1>          result/${readID}.SplitN.bam.bai.log \
2>          result/${readID}.SplitN.bam.bai.err