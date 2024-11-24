############################################################################################
readID=$1

############################################################################################
sh pipe/gatk-AddOrReplaceReadGroups.sh ${readID} bam
sh pipe/gatk-MarkDuplicates.sh         ${readID}.RGsorted
sh pipe/gatk-SplitNCigarReads.sh       ${readID}.RGsorted.dedupped
sh pipe/gatk-HaplotypeCaller.sh        ${readID}.RGsorted.dedupped.SplitN

echo ${readID} done!