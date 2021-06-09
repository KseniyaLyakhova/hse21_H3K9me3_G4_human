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
![len_hist_ENCFF444EWQ_hg38](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/len_hist.H3K9me3_A549_ENCFF444EWQ.h38-1.png)
![len_hist_ENCFF444EWQ_hg19](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/len_hist.H3K9me3_A549_ENCFF444EWQ.hg19-1.png)

Можно заметить, что пр конвертации LiftOver не соврешил ошибок, аналогично и у второго эксперимента: 

![len_hist_ENCFF811QUJ_hg38](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/len_hist.H3K9me3_A549_ENCFF811QUJ.h38-1.png)
![len_hist_ENCFF811QUJ_hg19](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/len_hist.H3K9me3_A549_ENCFF811QUJ.hg19-1.png)

#### Фильтрация пиков
С помощью [скрипта](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/src/%D0%A4%D0%B8%D0%BB%D1%8C%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F.R) были отфильтрованы пики длиной более 5000. Были получены следующие результаты:
![filter_peaks_ENCFF444EWQ_hg19_filtered_hist](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/filter_peaks.H3K9me3_A549_ENCFF444EWQ.hg19.filtered.hist-1.png)
![filter_peaks_ENCFF811QUJ_hg19_filtered_hist](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/filter_peaks.H3K9me3_A549_ENCFF811QUJ.hg19.filtered.hist-1.png)

#### Расположение пиков
С помощью [скрипта](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/src/%D0%9F%D0%B0%D0%B9%20%D1%87%D0%B0%D1%80%D1%82.R) были построены графики расположения пиков гистоновых меток относительно аннотированных генов. Были получены следующие результаты:
ENCFF444EWQ:
![chip_seeker.ENCFF444EWQ.hg19.filtered.plotAnnoPie](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/chip_seeker.H3K9me3_A549_ENCFF444EWQ.hg19.filtered.plotAnnoPie.png)
ENCFF811QUJ:
![chip_seeker.ENCFF811QUJ.hg19.filtered.plotAnnoPie](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/chip_seeker.H3K9me3_A549_ENCFF811QUJ.hg19.filtered.plotAnnoPie.png)

#### Объединение файлов
Отсортированные файлы были загружены на кластер в личную директорию kalyakhova/githun/hse21_H3K9me3_G4_human/data, отсортированы и объединены с помощью bedtools:
```bash
cat  *.filtered.bed  |   sort -k1,1 -k2,2n   |   bedtools merge   >  H3K9me3_A549.merge.hg19.bed
```
После этого полученный файл H3K9me3_A549.merge.hg19.bed был перенесен на Пк с помощью программы WinSCP.

#### Визуализация
С помощью [Genome Browser](http://genome.ucsc.edu/s/kalyakhova/merges) были визуализированы полученные исходные наборы ChIP-seq пиков и их объединение
![Merged](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/%D1%81%D0%BA%D1%80%D0%B8%D0%BD%20%D0%B8%D0%B7%20%D0%B1%D1%80%D0%B0%D1%83%D0%B7%D0%B5%D1%80%D0%B0.jpg)
Можно заметить, что объединения прошло успешно.

### Анализ участков вторичной структуры ДНК
На кластер в личную директорию kalyakhova/githun/hse21_H3K9me3_G4_human/data были сохранены архивы с .bed-файлами с данными вторичной структуры ДНК:
```bash
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM3003nnn/GSM3003539/suppl/GSM3003539_Homo_all_w15_th-1_minus.hits.max.K.w50.25.bed.gz
wget https://ftp.ncbi.nlm.nih.gov/geo/samples/GSM3003nnn/GSM3003539/suppl/GSM3003539_Homo_all_w15_th-1_plus.hits.max.K.w50.25.bed.gz
```
Для последующей работы они были распакованы (с удалением не нужных для работы столбцов) и объединены в один файл с помощью bedtools:
```bash
gunzip GSM3003539_Homo_all_w15_th-1_plus.hits.max.K.w50.25.bed.gz
gunzip GSM3003539_Homo_all_w15_th-1_minus.hits.max.K.w50.25.bed.gz    
cat  *25.bed  |   sort -k1,1 -k2,2n   |   bedtools merge   >  G4.merge.bed 
```
Затем с помощью программы WinSCP полученный файл был загружен на ПК для дальнейшей работы.

Далее с помощью [скрипта](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/src/%D0%93%D0%B8%D1%81%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D1%8B.R) была получена гистограмма длин участков. Были получены следующие результаты:
![len_hist.G4.merged](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/len_hist.G4.merge-1.png)

Также с помощью [скрипта](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/src/%D0%9F%D0%B0%D0%B9%20%D1%87%D0%B0%D1%80%D1%82.R) был построен график расположения пиков относительно аннотированных генов. Были получены следующие результаты:

![chip_seeker.G4.merged.plotAnnoPie](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/chip_seeker.G4.merge.plotAnnoPie.png)

### Анализ пересечений гистоновой метки и структуры ДНК
С помощью bedtools были найдены пересечения гистоновой метки со структурами ДНК:
```bash
bedtools intersect  -a G4.merged.bed   -b  H3K9me3_A549.merge.hg19.bed  >  H3K9me3_A549.intersect_with_G4.bed
```
Затем с помощью прошораммы WinSCP полученный файл был загружен на ПК для дальнейшей работы.
И был построен график распределения длин пересечений:
![len_hist.H3K9me3_A549.intersect_with_G4](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/len_hist.H3K9me3_A549.intersect_with_G4-1.png)
А также привожу график расположения пиков относительно аннотированных генов:
![chip_seeker.H3K9me3_A549.intersect_with_G4](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/chip_seeker.H3K9me3_A549.intersect_with_G4.plotAnnoPie.png)
#### Визуализация
С помощью [Genome Browser](http://genome.ucsc.edu/s/kalyakhova/hse21_H3K9me3_G4_human) были визуализированы полученные участки.
На скриншоте отображены пересечения между гистоновой меткой и структурой ДНК:
![genome_G4](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/%D1%81%D0%BA%D1%80%D0%B8%D0%BD%D1%88%D0%BE%D1%82.jpg)
Координаты: chr1:227,908,668-227,912,173
#### Ассоция полученных пересечений с ближайшими генами
Далее с помощью [скрипта](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/src/%D0%90%D0%BD%D0%BD%D0%BE%D1%82%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B3%D0%B5%D0%BD%D0%BE%D0%B2.R) полученные пересечения были ассоциированы с ближайшими генами. Было проассоциировано 6783 пика, 251 уникальных гена.
#### GO-анализ для полученных уникальных генов
С помощью [Panther](http://pantherdb.org/) был проведён GO-анализ для полученных уникальных генов. В [файле](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/data/pantherdn_GO_analysis.txt) представлен результат анализа. Далее приведены несколько самых значимых категорий:
![Panther_gens](https://github.com/KseniyaLyakhova/hse21_H3K9me3_G4_human/blob/main/images/PNG%20files/%D1%81%D0%BA%D1%80%D0%B8%D0%BD%20%D1%81%20pantherdb.jpg)
