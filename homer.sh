motif在生物学和生物信息学中是指DNA、RNA或蛋白质序列中具有特定功能和结构的短序列模式。
motif通常是转录因子或其他调控蛋白识别并结合的特定序列区域，具有以下几个关键特征和功能：
1. 短序列模式：基序通常是5到20个碱基对（bp）长的短序列，具有特定的核苷酸排列。
2. 功能性：基序具有特定的生物学功能，常见的是作为转录因子的结合位点，从而调控基因表达。
3. 保守性：基序在进化过程中常常是保守的，因为它们执行关键的调控功能。

# https://www.cnblogs.com/shuaihe/p/16188626.html
# https://mp.weixin.qq.com/s/Y618hVeyY2Rpl4SFIjUv5w

conda activate homer

/home/wangyf/miniconda3/envs/homer/share/homer/

perl /data01/wangyf/software/homer/configureHomer.pl -h 

# 查找
perl /data01/wangyf/software/homer/configureHomer.pl -list
# 安装
perl /data01/wangyf/software/homer/configureHomer.pl -install zebrafish-p

# 加载自己的基因组
loadGenome.pl -gtf /data01/wangyf/project2/CyprinusCarpio/15.pop/7.annovar/new/genome/genome.gtf \
              -name commoncarp \
              -fasta /data01/wangyf/project2/CyprinusCarpio/15.pop/7.annovar/new/genome/genome.fa \
              -org null
# 注释peak：peak所处区域，附近基因是什么
annotatePeaks.pl 300bp.bed commoncarp -CpG > annotated_peaks.txt

# 运行homer
findMotifsGenome.pl 300bp.bed commoncarp out
# -size 200是常用设置，指的是每个峰的中心点前后各 100 bp，总共 200 bp 的区域将被考虑进行分析。如果要用peak的实际大小进行分析的话使用-size given
# 会出来两个结果。homerResults.html【是新motif发现的结果】和knownResults.html【展示的是已知motif的发现结果】可以下载在浏览器中打开。

# 在整个基因组中找到与.motif匹配的所有位置
scanMotifGenomeWide.pl out/homerMotifs.all.motifs commoncarp -bed > out/homerMotifs.all.motifs.bed

