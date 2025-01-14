############################################################################################
readID=$1
############################################################################################

gatk --java-options '-Djava.io.tmpdir=./tmp' VariantsToTable \
    --reference ../db/ref.fa \
    --error-if-missing-data false \
    -F CHROM \
    -F POS \
    -F ID \
    -F REF \
    -F ALT \
    -F QUAL \
    -F FILTER \
    -F AC \
    -F AF \
    -F AN \
    -F DP \
    -GF GT \
    -GF AD \
    -GF DP \
    --variant result/${readID}.vcf \
    --output  result/${readID}.tab \
    1>        result/${readID}.tab.log \
    2>        result/${readID}.tab.err
