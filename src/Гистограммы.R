

library(ggplot2)
library(dplyr)

###

#NAME <- 'DeepZ'
NAME <- 'H3K9me3_A549_ENCFF444EWQ.hg19'
#NAME <- 'H3K9me3_A549_ENCFF444EWQ.h38'
#NAME <- 'H3K9me3_A549_ENCFF811QUJ.hg19'
#NAME <- 'H3K9me3_A549_ENCFF811QUJ.h38'

OUT_DIR <- 'D:/ДЗ/3 курс/Майнор/Проект/Results/'

###

bed_df <- read.delim(paste0('D:/ДЗ/3 курс/Майнор/Проект/', NAME, '.bed'), as.is = TRUE, header = FALSE)

colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
#colnames(bed_df) <- c('chrom', 'start', 'end')
head (bed_df)
bed_df$len <- bed_df$end - bed_df$start
head (bed_df)

ggplot(bed_df) +
    aes(x = len) +
    geom_histogram() +
    ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
    theme_bw()
ggsave(paste0('len_hist.', NAME, '.pdf'), path = OUT_DIR)
