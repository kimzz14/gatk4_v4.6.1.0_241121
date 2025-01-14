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

bash pipe/gatk-AddOrReplaceReadGroups.sh ${threadN} ${readID} bam
bash pipe/gatk-MarkDuplicates.sh         ${threadN} ${readID}.RGsorted
bash pipe/gatk-SplitNCigarReads.sh       ${threadN} ${readID}.RGsorted.dedupped
bash pipe/gatk-HaplotypeCaller.sh        ${threadN} ${readID}.RGsorted.dedupped.SplitN

echo ${readID} done!