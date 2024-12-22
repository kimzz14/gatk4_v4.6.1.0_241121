############################################################################################
readID=$1
fileExt=$2

############################################################################################

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

samtools index \
                        -c \
                        result/${readID}.RGsorted.bam \
1>                      result/${readID}.RGsorted.bam.csi.log \
2>                      result/${readID}.RGsorted.bam.csi.err

samtools flagstat \
                        result/${readID}.RGsorted.bam \
1>                      result/${readID}.RGsorted.bam.flagstat \
2>                      result/${readID}.RGsorted.bam.flagstat.log 

#rm                      result/${readID}.${fileExt}