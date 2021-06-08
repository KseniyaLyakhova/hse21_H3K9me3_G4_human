source('lib.R')
library(ggplot2)
library(dplyr)

###

#NAME <- 'H3K9me3_A549_ENCFF444EWQ.hg19'
NAME <- 'H3K9me3_A549_ENCFF811QUJ.hg19'

###

bed_df <- read.delim(paste0('D:/ДЗ/3 курс/Майнор/Проект/', NAME, '.bed'), as.is = TRUE, header = FALSE)
colnames(bed_df) <- c('chrom', 'start', 'end', 'name', 'score')
bed_df$len <- bed_df$end - bed_df$start
head(bed_df)

ggplot(bed_df) +
    aes(x = len) +
    geom_histogram() +
    ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
    theme_bw()
ggsave(paste0('filter_peaks.', NAME, '.init.hist.pdf'), path = OUT_DIR)

# Remove long peaks
bed_df <- bed_df %>%
    arrange(-len) %>%
    filter(len < 5000)

ggplot(bed_df) +
    aes(x = len) +
    geom_histogram() +
    ggtitle(NAME, subtitle = sprintf('Number of peaks = %s', nrow(bed_df))) +
    theme_bw()
ggsave(paste0('filter_peaks.', NAME, '.filtered.hist.pdf'), path = OUT_DIR)

bed_df %>%
    select(-len) %>%
    write.table(file=paste0('D:/ДЗ/3 курс/Майнор/Проект/', NAME ,'.filtered.bed'),
                col.names = FALSE, row.names = FALSE, sep = '\t', quote = FALSE)
