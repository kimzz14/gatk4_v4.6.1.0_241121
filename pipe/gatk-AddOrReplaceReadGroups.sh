############################################################################################
threadN=$1
readID=$2
fileExt=$3
############################################################################################

if [ -z ${threadN} ]; then
    echo "threadN is empty."
    exit 1
fi

if [ -z ${readID} ]; then
    echo "readID is empty."
    exit 1
fi

if [ -z ${fileExt} ]; then
    echo "fileExt is empty."
    exit 1
fi

gatk --java-options "-Djava.io.tmpdir=./tmp" AddOrReplaceReadGroups \
--INPUT                 result/${readID}.${fileExt} \
--OUTPUT                result/${readID}.RGsorted.bam \
--SORT_ORDER            coordinate \
--MAX_RECORDS_IN_RAM    1280000 \
--VALIDATION_STRINGENCY LENIENT \
--RGID                  ${readID} \
--RGLB                  ${readID}_LIB \
--RGPL                  ILLUMINA \
--RGPU                  NONE \
--RGSM                  ${readID} \
1>                      result/${readID}.RGsorted.bam.log \
2>                      result/${readID}.RGsorted.bam.err

bash pipe/samtools-index.sh    ${threadN} ${readID}.RGsorted
bash pipe/samtools-flagstat.sh ${threadN} ${readID}.RGsorted bam
