command  = ["gatk --java-options '-Djava.io.tmpdir=./tmp' CombineGVCFs"]
command += ['--reference ../reference/ref.fa']
command += ['--output result/pooled.HaplotypeCaller.g.vcf']

import glob
for fileName in glob.glob('gVCF/*vcf'):
    command += ['--variant' + ' ' + fileName]

command += ['1> result/pooled.HaplotypeCaller.g.vcf.log']
command += ['2> result/pooled.HaplotypeCaller.g.vcf.err']

fout = open('pipe/step01_GATK-CombineGVCFs.sh', 'w')
fout.write(' \\\n'.join(command) + '\n')
fout.close()