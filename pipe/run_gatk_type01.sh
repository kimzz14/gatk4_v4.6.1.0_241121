############################################################################################
readID=$1
threadN=$2
############################################################################################
sh pipe/bwa-mem_type01.sh              ${readID} ${threadN}
sh pipe/gatk-AddOrReplaceReadGroups.sh ${readID}.bwa-memT01 sam
sh pipe/gatk-MarkDuplicates.sh         ${readID}.bwa-memT01.RGsorted
sh pipe/gatk-HaplotypeCaller.sh        ${readID}.bwa-memT01.RGsorted
sh pipe/gatk-HaplotypeCaller.sh        ${readID}.bwa-memT01.RGsorted.dedupped

echo ${readID} done!

#sh pipe/bwa-mem_type02.sh              ${readID} ${threadN}
#sh pipe/gatk-AddOrReplaceReadGroups.sh ${readID}.bwa-memT02 bam