command  = ["gatk --java-options '-Djava.io.tmpdir=./tmp' CombineGVCFs"]
command += ['--reference ../reference/ref.fa']
command += ['--output result/pooled.HaplotypeCaller.g.vcf.gz']

fin = open('../gVCF_LIST')
for line in fin:
    gVCF = line.rstrip('\n')
    command += ['--variant ../result/' + gVCF]
fin.close()

command += ['1> result/pooled.HaplotypeCaller.g.vcf.gz.log']
command += ['2> result/pooled.HaplotypeCaller.g.vcf.gz.err']

fout = open('step01_GATK-CombineGVCFs.sh', 'w')
fout.write(' \\\n'.join(command) + '\n')
fout.close()