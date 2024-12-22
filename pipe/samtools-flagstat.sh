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


samtools flagstat \
    -@ ${threadN} \
       result/${readID}.sam \
    1> result/${readID}.flagstat \
    2> result/${readID}.flagstat.log