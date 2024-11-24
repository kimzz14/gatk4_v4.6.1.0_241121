############################################################################################
readID=$1
threadN=$2
############################################################################################

gatk --java-options "-Djava.io.tmpdir=./tmp" MarkDuplicates \
--INPUT                 result/${readID}.bam \
--OUTPUT                result/${readID}.dedupped.bam \
--METRICS_FILE          result/${readID}.dedupped.metrics \
--REMOVE_DUPLICATES     true \
--ASSUME_SORTED         true \
--MAX_RECORDS_IN_RAM    1280000 \
--VALIDATION_STRINGENCY LENIENT \
--MAX_FILE_HANDLES      1024 \
1>                      result/${readID}.dedupped.bam.log \
2>                      result/${readID}.dedupped.bam.err

samtools index \
                        -c \
                        result/${readID}.dedupped.bam \
1>                      result/${readID}.dedupped.bam.csi.log \
2>                      result/${readID}.dedupped.bam.csi.err

samtools flagstat \
                        result/${readID}.dedupped.bam \
1>                      result/${readID}.dedupped.bam.flagstat \
2>                      result/${readID}.dedupped.bam.flagstat.log 

#rm                      result/${readID}.bam
