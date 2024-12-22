############################################################################################
readID=$1

############################################################################################

if [ -z ${readID} ]; then
    echo "readID is empty."
    exit 1
fi

if [ -z ${threadN} ]; then
    echo "threadN is empty."
    exit 1
fi

sh pipe/gatk-AddOrReplaceReadGroups.sh ${readID} bam
sh pipe/gatk-MarkDuplicates.sh         ${readID}.RGsorted
sh pipe/gatk-SplitNCigarReads.sh       ${readID}.RGsorted.dedupped
sh pipe/gatk-HaplotypeCaller.sh        ${readID}.RGsorted.dedupped.SplitN

echo ${readID} done!