###Initialization

library(DESeq2)
library(dplyr)

###Prepare expression data (countData of DEseq2)

expr_dat=read.table("result.txt")
expr_dat=expr_dat[,c(1,7:14)]
expr_dat=expr_dat[-1,]
temp_rows=expr_dat[,1]

expr_dat=expr_dat[,-1]
expr_dat=(sapply(expr_dat,as.integer))
colnames(expr_dat)=c("ERR2198545","ERR2198546", "ERR2198547","ERR2198548","ERR2198593","ERR2198594","ERR2198595","ERR2198596")
rownames(expr_dat)=temp_rows
head(expr_dat)

###Prepare colData of DEseq2

col_dat = data.frame(c(rep("non_optimized",4),rep("optimized",4)))
rownames(col_dat)=c("ERR2198545","ERR2198546", "ERR2198547","ERR2198548","ERR2198593","ERR2198594","ERR2198595","ERR2198596")
colnames(col_dat)="condition"
col_dat$condition=as.factor(col_dat$condition)
head(col_dat)

###Run DEseq2

DE_obj=DESeqDataSetFromMatrix(countData = expr_dat,colData = col_dat,~condition)
de_res=DESeq(DE_obj)
de_res
res=results(de_res)

###Output the results

write.csv(res,"DEG_results.csv")

#plotMA(de_res)

gene_sets=res %>% 
  as.data.frame %>% 
  select(log2FoldChange,padj) %>%
  filter(padj<0.05) %>% 
  arrange(padj)

write.csv(gene_sets,"DEG_Significant.csv")
