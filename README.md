# Rodriguez2017_RNA_Seq_Analysis_Replication
 In this repository, I try to replicate the results of [Rodriguez2017](https://www.sciencedirect.com/science/article/pii/S1096717617303828) entitled *Comparison of the metabolic response to over-production of p-coumaric acid in two yeast strains* in a smaller scale.
 In their original study, 64 fastq files [existed.](https://www.ncbi.nlm.nih.gov/sra/ERX2254174[accn]) Because of my hardware limitations, I decided to use a fraction of their data. I implemented a pipeline that differed from theirs to a great extent. I used SRA toolkit -> FastQC -> Trimmomatic -> HISAT2 -> featureCounts -> DEseq2 route.  
The subset data was a collection of 8 fastq files four of which corresponded to *CEN.PK - St4288* strain which were *optimised for p-coumaric acid production*. (Four samples of replicate #1 were selected.)
The other four fastq files were from *CEN.PK - St4408* strain which were *not optimised for p-coumaric acid production.* (Four samples of replicate #1 were selected.)
The scripts ran completely fine, however, the list of differentially expressed genes (DEGs) resulted from my scripts differed to some extents from their results. I assume the differences stem from the fact that I only used a fraction of their sequence data.

-------------------------------------------------------------

The results of *script.sh* and *Analysis.R* is provided in the Expected_Results folder
