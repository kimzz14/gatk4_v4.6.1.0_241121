############################################################################################
readID=$1
threadN=$2
############################################################################################

if [ -z ${readID} ]; then
    echo "readID is empty."
    exit 1
fi

if [ -z ${threadN} ]; then
    echo "threadN is empty."
    exit 1
fi

#sh pipe/bwa-memT001.sh                  ${threadN} ${readID} 
sh pipe/gatk-AddOrReplaceReadGroups.sh ${readID} bam
sh pipe/gatk-MarkDuplicates.sh         ${readID}.RGsorted
sh pipe/gatk-HaplotypeCaller.sh        ${readID}.RGsorted
sh pipe/gatk-HaplotypeCaller.sh        ${readID}.RGsorted.dedupped

echo ${readID} done!

#sh pipe/bwa-mem_type02.sh              ${readID} ${threadN}
#sh pipe/gatk-AddOrReplaceReadGroups.sh ${readID}.bwa-memT02 bam