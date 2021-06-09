# Проект по майнору "Биоинформатика" 2021
### Репозиторий: hse21_H3K9me3_G4_human
#### Выполнила Ляхова Ксения, группа 3
Были выбранны следующие стркутуры
| Организм | Структура ДНК | Гистоновая метка | Тип клеток | Метка 1 | Метка 2 |
| -------- | ------------- | ---------------- | ---------- | ------- | ------- |
| Human (hg19) | G4_seq_Li_K | H3Kme3 | A549 | [ENCFF444EWQ](https://www.encodeproject.org/files/ENCFF444EWQ/) | [ENCFF811QUJ](https://www.encodeproject.org/files/ENCFF432EMI/) |

### Анализ пиков гистоновой метки
####  Подготовка файлов
Были сохранены данные экспериментов в личную папку на сервере:
```bash
wget wget https://www.encodeproject.org/files/ENCFF444EWQ/@@download/ENCFF444EWQ.bed.gz
wget https://www.encodeproject.org/files/ENCFF811QUJ/@@download/ENCFF811QUJ.bed.gz
zcat ENCFF444EWQ.bed.gz | cut -f1-5 > H3K9me3_A549_ENCFF444EWQ.h38.bed
zcat ENCFF811QUJ.bed.gz | cut -f1-5 > H3K9me3_A549_ENCFF811QUJ.h38.bed
```
Далее я привела к 19 версии генома с помощью LiftOver:
```bash
wget https://hgdownload.cse.ucsc.edu/goldenpath/hg38/liftOver/hg38ToHg19.over.chain.gz
liftOver   H3K9me3_A549_ENCFF811QUJ.h38.bed   hg38ToHg19.over.chain.gz   H3K9me3_A549_ENCFF811QUJ.hg19.bed   H3K9me3_A549_ENCFF811QUJ.unmapped.bed
liftOver   H3K9me3_A549_ENCFF444EWQ.h38.bed   hg38ToHg19.over.chain.gz   H3K9me3_A549_ENCFF444EWQ.hg19.bed   H3K9me3_A549_ENCFF444EWQ.unmapped.bed
```
После этого все полученные файлы были перенесены на ПК с помощью программы WinSCP
#### Построение гистрограмм
С помощью [скрипта](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/src/%D0%93%D0%B8%D1%81%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B.R) были полученны гистограммы длин участков до и после конвертации к нужной версии генома.
Были полученны следущие результаты:
![len_hist_ENCFF444EWQ_hg38](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/len_hist.H3K9me3_A549_ENCFF444EWQ.h38.pdf)
