
library(ggplot2)
library(dplyr)
library(tidyr)   # replace_na
library(tibble)

###

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.13")

if (!requireNamespace("BiocManager", quietly = TRUE))
   install.packages("BiocManager")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
# BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")

BiocManager::install("clusterProfiler")

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)

###

NAME <- 'G4'
#NAME <- 'H3K9me3_A549_ENCFF444EWQ.hg19.filtered'
#NAME <- 'H3K9me3_A549_ENCFF811QUJ.hg19.filtered'
BED_FN <- paste0('D:/ДЗ/3 курс/Майнор/Проект/', NAME, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

png(paste0('D:/ДЗ/3 курс/Майнор/Проект/', 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

