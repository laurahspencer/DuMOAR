### MBD-BS-Seq data

The raw data used in the MBD-BS-Seq analysis is located on Sedna here: /share/nwfsc/knichols/Dungeness/MBDseq_UOdata. Within that directory, there are two subdirectories, 4416/ and 4416/. They each contain 42 data files of the same name - paired-end data for 20 samples, and reads from undetermined samples in the remaining 2 files. Presumably, the two subdirectories contain data from two separate runs using the same samples. 

These sample names match the samples selected for MBDBS-Seq, as per the [electronic data sheet](https://docs.google.com/spreadsheets/d/1ym0XnYVts98tIUCn0kIaU6VuvqxzV7LoSx9RHwLdiIs/edit?pli=1#gid=1430155532)

```
(base) [lspencer@sedna MBDseq_UOdata]$ ls 4416/
CH01_06_S1_L001_R1_001.fastq.gz   CH05_24_S11_L001_R2_001.fastq.gz
CH01_06_S1_L001_R2_001.fastq.gz   CH07_06_S12_L001_R1_001.fastq.gz
CH01_14_S2_L001_R1_001.fastq.gz   CH07_06_S12_L001_R2_001.fastq.gz
CH01_14_S2_L001_R2_001.fastq.gz   CH07_11_S13_L001_R1_001.fastq.gz
CH01_22_S3_L001_R1_001.fastq.gz   CH07_11_S13_L001_R2_001.fastq.gz
CH01_22_S3_L001_R2_001.fastq.gz   CH07_24_S14_L001_R1_001.fastq.gz
CH01_38_S4_L001_R1_001.fastq.gz   CH07_24_S14_L001_R2_001.fastq.gz
CH01_38_S4_L001_R2_001.fastq.gz   CH09_02_S15_L001_R1_001.fastq.gz
CH03_04_S5_L001_R1_001.fastq.gz   CH09_02_S15_L001_R2_001.fastq.gz
CH03_04_S5_L001_R2_001.fastq.gz   CH09_13_S16_L001_R1_001.fastq.gz
CH03_15_S6_L001_R1_001.fastq.gz   CH09_13_S16_L001_R2_001.fastq.gz
CH03_15_S6_L001_R2_001.fastq.gz   CH09_28_S17_L001_R1_001.fastq.gz
CH03_33_S7_L001_R1_001.fastq.gz   CH09_28_S17_L001_R2_001.fastq.gz
CH03_33_S7_L001_R2_001.fastq.gz   CH10_01_S18_L001_R1_001.fastq.gz
CH05_01_S8_L001_R1_001.fastq.gz   CH10_01_S18_L001_R2_001.fastq.gz
CH05_01_S8_L001_R2_001.fastq.gz   CH10_08_S19_L001_R1_001.fastq.gz
CH05_06_S9_L001_R1_001.fastq.gz   CH10_08_S19_L001_R2_001.fastq.gz
CH05_06_S9_L001_R2_001.fastq.gz   CH10_11_S20_L001_R1_001.fastq.gz
CH05_21_S10_L001_R1_001.fastq.gz  CH10_11_S20_L001_R2_001.fastq.gz
CH05_21_S10_L001_R2_001.fastq.gz  Undetermined_S0_L001_R1_001.fastq.gz
CH05_24_S11_L001_R1_001.fastq.gz  Undetermined_S0_L001_R2_001.fastq.gz

(base) [lspencer@sedna MBDseq_UOdata]$ ls 4417/
CH01_06_S1_L001_R1_001.fastq.gz   CH05_24_S11_L001_R2_001.fastq.gz
CH01_06_S1_L001_R2_001.fastq.gz   CH07_06_S12_L001_R1_001.fastq.gz
CH01_14_S2_L001_R1_001.fastq.gz   CH07_06_S12_L001_R2_001.fastq.gz
CH01_14_S2_L001_R2_001.fastq.gz   CH07_11_S13_L001_R1_001.fastq.gz
CH01_22_S3_L001_R1_001.fastq.gz   CH07_11_S13_L001_R2_001.fastq.gz
CH01_22_S3_L001_R2_001.fastq.gz   CH07_24_S14_L001_R1_001.fastq.gz
CH01_38_S4_L001_R1_001.fastq.gz   CH07_24_S14_L001_R2_001.fastq.gz
CH01_38_S4_L001_R2_001.fastq.gz   CH09_02_S15_L001_R1_001.fastq.gz
CH03_04_S5_L001_R1_001.fastq.gz   CH09_02_S15_L001_R2_001.fastq.gz
CH03_04_S5_L001_R2_001.fastq.gz   CH09_13_S16_L001_R1_001.fastq.gz
CH03_15_S6_L001_R1_001.fastq.gz   CH09_13_S16_L001_R2_001.fastq.gz
CH03_15_S6_L001_R2_001.fastq.gz   CH09_28_S17_L001_R1_001.fastq.gz
CH03_33_S7_L001_R1_001.fastq.gz   CH09_28_S17_L001_R2_001.fastq.gz
CH03_33_S7_L001_R2_001.fastq.gz   CH10_01_S18_L001_R1_001.fastq.gz
CH05_01_S8_L001_R1_001.fastq.gz   CH10_01_S18_L001_R2_001.fastq.gz
CH05_01_S8_L001_R2_001.fastq.gz   CH10_08_S19_L001_R1_001.fastq.gz
CH05_06_S9_L001_R1_001.fastq.gz   CH10_08_S19_L001_R2_001.fastq.gz
CH05_06_S9_L001_R2_001.fastq.gz   CH10_11_S20_L001_R1_001.fastq.gz
CH05_21_S10_L001_R1_001.fastq.gz  CH10_11_S20_L001_R2_001.fastq.gz
CH05_21_S10_L001_R2_001.fastq.gz  Undetermined_S0_L001_R1_001.fastq.gz
CH05_24_S11_L001_R1_001.fastq.gz  Undetermined_S0_L001_R2_001.fastq.gz
```

It is clear that they aren't just duplicated files, since they are different sizes. For example, see the file sizes for sample "CH01_06_S1": 
```
(base) [lspencer@sedna MBDseq_UOdata]$ du -sh 4416/CH01_06_S1* 4417/CH01_06_S1*
617M    4416/CH01_06_S1_L001_R1_001.fastq.gz
551M    4416/CH01_06_S1_L001_R2_001.fastq.gz
721M    4417/CH01_06_S1_L001_R1_001.fastq.gz
704M    4417/CH01_06_S1_L001_R2_001.fastq.gz
```
