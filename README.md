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
