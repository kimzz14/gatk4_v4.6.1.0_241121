############################################################################################
readID=$1
threadN=$2

readDir=/archive/kimzz14/SRA_RAW/NAAS/Triticum_aestivum/Keumkang/ONT/data
preset=map-ont #map-pb, map-ont
############################################################################################

if [ -z ${readID} ]; then
    echo "readID is empty."
    exit 1
fi

if [ -z ${threadN} ]; then
    echo "threadN is empty."
    exit 1
fi

#create head before
cat db/ref.fa.fai | awk 'BEGIN {FS="\t"; OFS="\t"} {print "@SQ\tSN:"$1"\tLN:"$2}' > result/${readID}.winnowmap-T01.sam

winnowmap -t ${threadN} -W db/winnowmapDB/repetitive_k15.txt -ax ${preset} db/ref.fa ${readDir}/${readID}.fastq.gz \
    2> result/${readID}.winnowmap-T01.sam.log \
    >> result/${readID}.winnowmap-T01.sam

samtools sort  -o result/${readID}.winnowmap-T01.sorted.bam result/${readID}.winnowmap-T01.sam
samtools index -c result/${readID}.winnowmap-T01.sorted.bam

############################################################################################
#Preset:
#    -x STR       preset (always applied before other options) []
#                 - map-ont (ont-to-ref, uses default param)
#                 - map-pb (hifi-to-ref, all defaults but does finer read fragmentation in SV-aware mapping)
#                 - map-pb-clr (clr-to-ref, sets --sv-off)
#                 - splice/splice:hq - long-read/Pacbio-CCS spliced alignment, sets --sv-off
#                 - asm5/asm10/asm20 - asm-to-ref mapping
# or mapping using minimap2
# minimap2 -ax map-hifi -t 5 asm.fa.gz hifi.fasta.gz|samtools sort -o hifi.map.sort.bam -