############################################################################################
threadN=$1
readID=$2
############################################################################################

if [ -z ${threadN} ]; then
    echo "threadN is empty."
    exit 1
fi

if [ -z ${readID} ]; then
    echo "readID is empty."
    exit 1
fi

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

bash pipe/samtools-index.sh    ${threadN} ${readID}.dedupped
bash pipe/samtools-flagstat.sh ${threadN} ${readID}.dedupped bam
