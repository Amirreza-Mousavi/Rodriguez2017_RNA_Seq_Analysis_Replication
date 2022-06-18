cd ~/Desktop/NGS/

./sratoolkit.3.0.0-ubuntu64/bin/fastq-dump --split-3 -v -v ERR2198545 ERR2198546 ERR2198547 ERR2198548 ERR2198593 ERR2198594 ERR2198595 ERR2198596

mv ERR*.fastq ./New_Rodriguez_RNA_Seq/

cd New_Rodriguez_RNA_Seq/

fastqc ERR*.fastq

cd ~/Desktop/NGS

for i in {545..548}; do java -jar ~/Desktop/NGS/Trimmomatic-0.39/trimmomatic-0.39.jar PE New_Rodriguez_RNA_Seq/ERR2198${i}_1.fastq New_Rodriguez_RNA_Seq/ERR2198${i}_2.fastq New_Rodriguez_RNA_Seq/ERR2198${i}_lane1_forward_paired.fq.gz New_Rodriguez_RNA_Seq/ERR2198${i}_lane1_forward_unpaired.fq.gz New_Rodriguez_RNA_Seq/ERR2198${i}_lane1_reverse_paired.fq.gz New_Rodriguez_RNA_Seq/ERR2198${i}_lane1_reverse_unpaired.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36; done

for i in {593..596}; do java -jar ~/Desktop/NGS/Trimmomatic-0.39/trimmomatic-0.39.jar PE New_Rodriguez_RNA_Seq/ERR2198${i}_1.fastq New_Rodriguez_RNA_Seq/ERR2198${i}_2.fastq New_Rodriguez_RNA_Seq/ERR2198${i}_lane1_forward_paired.fq.gz New_Rodriguez_RNA_Seq/ERR2198${i}_lane1_forward_unpaired.fq.gz New_Rodriguez_RNA_Seq/ERR2198${i}_lane1_reverse_paired.fq.gz New_Rodriguez_RNA_Seq/ERR2198${i}_lane1_reverse_unpaired.fq.gz ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36; done

mkdir ./New_Rodriguez_RNA_Seq/Trimmed_data

mv ./New_Rodriguez_RNA_Seq/ERR*forward_paired.fq.gz ./New_Rodriguez_RNA_Seq/Trimmed_data/

mv ./New_Rodriguez_RNA_Seq/ERR*reverse_paired.fq.gz ./New_Rodriguez_RNA_Seq/Trimmed_data/

for i in {545..548}; do hisat2 -x ./HISAT2_Data/S_cerevisiae_genome/r64/genome -1 ./New_Rodriguez_RNA_Seq/Trimmed_data/ERR2198${i}_lane1_forward_paired.fq.gz -2 ./New_Rodriguez_RNA_Seq/Trimmed_data/ERR2198${i}_lane1_reverse_paired.fq.gz -S ERR2198${i}.sam; done

for i in {593..596}; do hisat2 -x ./HISAT2_Data/S_cerevisiae_genome/r64/genome -1 ./New_Rodriguez_RNA_Seq/Trimmed_data/ERR2198${i}_lane1_forward_paired.fq.gz -2 ./New_Rodriguez_RNA_Seq/Trimmed_data/ERR2198${i}_lane1_reverse_paired.fq.gz -S ERR2198${i}.sam; done

mkdir ./New_Rodriguez_RNA_Seq/Aligned_Files

mv ERR*.sam ./New_Rodriguez_RNA_Seq/Aligned_Files/

cd ./New_Rodriguez_RNA_Seq

###Saccharomyces_cerevisiae.R64-1-1.106.gtf.gz already existed in New_Rodriguez_RNA_Seq folder


gunzip Saccharomyces_cerevisiae.R64-1-1.106.gtf.gz 

featureCounts -a Saccharomyces_cerevisiae.R64-1-1.106.gtf -o result.txt ./Aligned_Files/ERR*.sam







