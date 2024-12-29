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

sh pipe/bwa-mem_type01.sh              ${readID} ${threadN}
sh pipe/gatk-AddOrReplaceReadGroups.sh ${readID}.bwa-memT01 sam
sh pipe/gatk-MarkDuplicates.sh         ${readID}.bwa-memT01.RGsorted
sh pipe/gatk-HaplotypeCaller.sh        ${readID}.bwa-memT01.RGsorted.dedupped

echo ${readID} done!

#sh pipe/bwa-mem_type02.sh              ${readID} ${threadN}
#sh pipe/gatk-AddOrReplaceReadGroups.sh ${readID}.bwa-memT02 bam