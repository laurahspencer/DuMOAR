# Using blast

Make blast index

    /home/shared/ncbi-blast-2.11.0+/bin/makeblastdb \
    -in ../data/PGA_assembly.fasta \
    -dbtype nucl \
    -out ../results/04-mito-hunt/PGA_assembly

Blasting Mitochondria feature fasta to genome

    /home/shared/ncbi-blast-2.11.0+/bin/blastn \
    -query ../data/Mmag-mito-features.fa \
    -db ../results/04-mito-hunt/PGA_assembly \
    -out ../results/04-mito-hunt/mit-genome_blastn_01.tab \
    -evalue 1E-20 \
    -num_threads 48 \
    -max_target_seqs 10 \
    -outfmt 6

    cat ../results/04-mito-hunt/mit-genome_blastn_01.tab

    ## lcl|NC_050675.1_gene_8   PGA_scaffold16__99_contigs__length_13714835 85.409  281 39  2   214 493 12231568    12231289    2.68e-76    291
    ## lcl|NC_050675.1_gene_14  contig_2968_pilon__unscaffolded 99.107  224 2   0   1   224 41  264 1.67e-110   403
    ## lcl|NC_050675.1_gene_28  contig_4859_pilon__unscaffolded 99.333  300 2   0   1   300 300 1   1.62e-152   544
    ## lcl|NC_050675.1_gene_29  contig_4859_pilon__unscaffolded 100.000 297 0   0   1   297 590 294 7.18e-155   549
    ## lcl|NC_050675.1_gene_30  contig_4859_pilon__unscaffolded 100.000 68  0   0   1   68  664 597 2.28e-28    126
    ## lcl|NC_050675.1_gene_32  contig_4859_pilon__unscaffolded 99.717  353 1   0   1   353 3109    3461    0.0 647
    ## lcl|NC_050675.1_gene_34  contig_4859_pilon__unscaffolded 98.485  66  1   0   1   66  3686    3751    1.31e-25    117
    ## lcl|NC_050675.1_gene_38  contig_185_pilon__unscaffolded  74.652  718 119 45  61  755 30054   29377   6.60e-67    259
    ## lcl|NC_050675.1_gene_38  contig_185_pilon__unscaffolded  74.652  718 119 45  61  755 100314  99637   6.60e-67    259
    ## lcl|NC_050675.1_gene_38  contig_4678_pilon__unscaffolded 73.561  556 89  40  227 755 22881   23405   6.89e-37    159
    ## lcl|NC_050675.1_gene_39  contig_5718_pilon__unscaffolded 89.442  663 41  15  137 788 1694    2338    0.0 809
    ## lcl|NC_050675.1_gene_39  contig_5718_pilon__unscaffolded 93.333  75  4   1   784 858 3712    3785    4.44e-22    110
    ## lcl|NC_050675.1_gene_39  contig_185_pilon__unscaffolded  80.894  738 96  27  136 858 30895   30188   1.33e-151   540
    ## lcl|NC_050675.1_gene_39  contig_185_pilon__unscaffolded  80.894  738 96  27  136 858 101155  100448  1.33e-151   540
    ## lcl|NC_050675.1_gene_39  contig_444_pilon___fragment_11__unscaffolded    79.383  713 102 29  137 829 55975   56662   1.06e-127   460
    ## lcl|NC_050675.1_gene_39  contig_91_pilon__unscaffolded   79.296  710 104 27  137 829 27935   27252   1.38e-126   457
    ## lcl|NC_050675.1_gene_39  contig_5765_pilon__unscaffolded 85.621  459 34  26  374 828 8339    8769    1.78e-125   453
    ## lcl|NC_050675.1_gene_39  contig_6518_pilon__unscaffolded 78.969  718 106 28  137 837 721 32  8.28e-124   448
    ## lcl|NC_050675.1_gene_39  PGA_scaffold22__59_contigs__length_10008237 78.711  667 87  30  137 788 9907893 9908519 1.09e-107   394
    ## lcl|NC_050675.1_gene_39  PGA_scaffold22__59_contigs__length_10008237 93.333  75  4   1   784 858 9909891 9909964 4.44e-22    110
    ## lcl|NC_050675.1_gene_39  contig_4401_pilon___fragment_5__unscaffolded    78.004  491 92  12  137 615 37291   36805   1.14e-77    294
    ## lcl|NC_050675.1_gene_39  contig_396_pilon__unscaffolded  78.481  395 65  12  160 539 79648   80037   1.51e-61    241
    ## lcl|NC_050675.1_gene_39  contig_4678_pilon__unscaffolded 94.845  97  5   0   762 858 21929   22025   7.27e-35    152
    ## lcl|NC_050675.1_gene_40  contig_4859_pilon__unscaffolded 100.000 71  0   0   1   71  6392    6322    5.25e-30    132
    ## lcl|NC_050675.1_cds_YP_009926422.1_3 PGA_scaffold16__99_contigs__length_13714835 85.409  281 39  2   214 493 12231568    12231289    2.68e-76    291
    ## lcl|NC_050675.1_cds_YP_009926426.1_7 contig_2968_pilon__unscaffolded 99.107  224 2   0   1   224 41  264 1.67e-110   403
    ## lcl|NC_050675.1_cds_YP_009926429.1_10    contig_4859_pilon__unscaffolded 99.333  300 2   0   1   300 300 1   1.62e-152   544
    ## lcl|NC_050675.1_cds_YP_009926430.1_11    contig_4859_pilon__unscaffolded 100.000 297 0   0   1   297 590 294 7.18e-155   549
    ## lcl|NC_050675.1_cds_YP_009926431.1_12    contig_4859_pilon__unscaffolded 99.717  353 1   0   1   353 3109    3461    0.0 647

    /home/shared/ncbi-blast-2.11.0+/bin/blastn \
    -query ../data/Mmag-mito-features.fa \
    -db ../results/04-mito-hunt/PGA_assembly \
    -out ../results/04-mito-hunt/mit-genome_blastn_02.tab \
    -evalue 1E-50 \
    -num_threads 48 \
    -max_target_seqs 10 \
    -outfmt 6

    cat ../results/04-mito-hunt/mit-genome_blastn_02.tab

    ## lcl|NC_050675.1_gene_8   PGA_scaffold16__99_contigs__length_13714835 85.409  281 39  2   214 493 12231568    12231289    2.68e-76    291
    ## lcl|NC_050675.1_gene_14  contig_2968_pilon__unscaffolded 99.107  224 2   0   1   224 41  264 1.67e-110   403
    ## lcl|NC_050675.1_gene_28  contig_4859_pilon__unscaffolded 99.333  300 2   0   1   300 300 1   1.62e-152   544
    ## lcl|NC_050675.1_gene_29  contig_4859_pilon__unscaffolded 100.000 297 0   0   1   297 590 294 7.18e-155   549
    ## lcl|NC_050675.1_gene_32  contig_4859_pilon__unscaffolded 99.717  353 1   0   1   353 3109    3461    0.0 647
    ## lcl|NC_050675.1_gene_39  contig_5718_pilon__unscaffolded 89.442  663 41  15  137 788 1694    2338    0.0 809
    ## lcl|NC_050675.1_gene_39  contig_185_pilon__unscaffolded  80.894  738 96  27  136 858 30895   30188   1.33e-151   540
    ## lcl|NC_050675.1_gene_39  contig_185_pilon__unscaffolded  80.894  738 96  27  136 858 101155  100448  1.33e-151   540
    ## lcl|NC_050675.1_gene_39  contig_444_pilon___fragment_11__unscaffolded    79.383  713 102 29  137 829 55975   56662   1.06e-127   460
    ## lcl|NC_050675.1_gene_39  contig_91_pilon__unscaffolded   79.296  710 104 27  137 829 27935   27252   1.38e-126   457
    ## lcl|NC_050675.1_gene_39  contig_5765_pilon__unscaffolded 85.621  459 34  26  374 828 8339    8769    1.78e-125   453
    ## lcl|NC_050675.1_gene_39  contig_6518_pilon__unscaffolded 78.969  718 106 28  137 837 721 32  8.28e-124   448
    ## lcl|NC_050675.1_gene_39  PGA_scaffold22__59_contigs__length_10008237 78.711  667 87  30  137 788 9907893 9908519 1.09e-107   394
    ## lcl|NC_050675.1_gene_39  contig_4401_pilon___fragment_5__unscaffolded    78.004  491 92  12  137 615 37291   36805   1.14e-77    294
    ## lcl|NC_050675.1_gene_39  contig_396_pilon__unscaffolded  78.481  395 65  12  160 539 79648   80037   1.51e-61    241
    ## lcl|NC_050675.1_cds_YP_009926422.1_3 PGA_scaffold16__99_contigs__length_13714835 85.409  281 39  2   214 493 12231568    12231289    2.68e-76    291
    ## lcl|NC_050675.1_cds_YP_009926426.1_7 contig_2968_pilon__unscaffolded 99.107  224 2   0   1   224 41  264 1.67e-110   403
    ## lcl|NC_050675.1_cds_YP_009926429.1_10    contig_4859_pilon__unscaffolded 99.333  300 2   0   1   300 300 1   1.62e-152   544
    ## lcl|NC_050675.1_cds_YP_009926430.1_11    contig_4859_pilon__unscaffolded 100.000 297 0   0   1   297 590 294 7.18e-155   549
    ## lcl|NC_050675.1_cds_YP_009926431.1_12    contig_4859_pilon__unscaffolded 99.717  353 1   0   1   353 3109    3461    0.0 647

    /home/shared/ncbi-blast-2.11.0+/bin/blastn \
    -task blastn \
    -query ../data/Mmag-mito-features.fa \
    -db ../results/04-mito-hunt/PGA_assembly \
    -out ../results/04-mito-hunt/mit-genome_blastn_03.tab \
    -evalue 1E-20 \
    -num_threads 48 \
    -max_target_seqs 1 \
    -outfmt 6

    ## Warning: [blastn] Examining 5 or more matches is recommended

    cat ../results/04-mito-hunt/mit-genome_blastn_03.tab

    ## lcl|NC_050675.1_gene_8   PGA_scaffold16__99_contigs__length_13714835 85.211  284 40  2   211 493 12231571    12231289    4.48e-84    316
    ## lcl|NC_050675.1_gene_14  contig_2968_pilon__unscaffolded 99.107  224 2   0   1   224 41  264 2.94e-108   396
    ## lcl|NC_050675.1_gene_28  contig_4859_pilon__unscaffolded 99.333  300 2   0   1   300 300 1   2.79e-149   533
    ## lcl|NC_050675.1_gene_29  contig_4859_pilon__unscaffolded 100.000 297 0   0   1   297 590 294 4.69e-151   536
    ## lcl|NC_050675.1_gene_30  contig_4859_pilon__unscaffolded 100.000 68  0   0   1   68  664 597 1.49e-27    123
    ## lcl|NC_050675.1_gene_32  contig_4859_pilon__unscaffolded 99.717  353 1   0   1   353 3109    3461    9.61e-180   633
    ## lcl|NC_050675.1_gene_33  contig_4859_pilon__unscaffolded 97.015  67  2   0   1   67  3619    3685    2.63e-24    113
    ## lcl|NC_050675.1_gene_34  contig_4859_pilon__unscaffolded 98.485  66  1   0   1   66  3686    3751    7.35e-25    115
    ## lcl|NC_050675.1_gene_38  contig_185_pilon__unscaffolded  72.840  729 139 21  46  755 30065   29377   1.12e-103   381
    ## lcl|NC_050675.1_gene_38  contig_185_pilon__unscaffolded  72.840  729 139 21  46  755 100325  99637   1.12e-103   381
    ## lcl|NC_050675.1_gene_39  contig_5718_pilon__unscaffolded 84.731  799 83  15  1   788 1568    2338    0.0 859
    ## lcl|NC_050675.1_gene_39  contig_5718_pilon__unscaffolded 93.333  75  4   1   784 858 3712    3785    6.63e-22    110
    ## lcl|NC_050675.1_gene_40  contig_4859_pilon__unscaffolded 100.000 71  0   0   1   71  6392    6322    3.77e-29    129
    ## lcl|NC_050675.1_cds_YP_009926422.1_3 PGA_scaffold16__99_contigs__length_13714835 85.211  284 40  2   211 493 12231571    12231289    4.48e-84    316
    ## lcl|NC_050675.1_cds_YP_009926426.1_7 contig_2968_pilon__unscaffolded 99.107  224 2   0   1   224 41  264 2.94e-108   396
    ## lcl|NC_050675.1_cds_YP_009926429.1_10    contig_4859_pilon__unscaffolded 99.333  300 2   0   1   300 300 1   2.79e-149   533
    ## lcl|NC_050675.1_cds_YP_009926430.1_11    contig_4859_pilon__unscaffolded 100.000 297 0   0   1   297 590 294 4.69e-151   536
    ## lcl|NC_050675.1_cds_YP_009926431.1_12    contig_4859_pilon__unscaffolded 99.717  353 1   0   1   353 3109    3461    9.61e-180   633

    /home/shared/ncbi-blast-2.11.0+/bin/blastn \
    -task blastn \
    -query ../data/Mmag-mito-features.fa \
    -db ../results/04-mito-hunt/PGA_assembly \
    -out ../results/04-mito-hunt/mit-genome_blastn_04.tab \
    -evalue 1E-50 \
    -num_threads 48 \
    -max_target_seqs 10 \
    -outfmt 6

    cat ../results/04-mito-hunt/mit-genome_blastn_04.tab

    ## lcl|NC_050675.1_gene_8   PGA_scaffold16__99_contigs__length_13714835 85.211  284 40  2   211 493 12231571    12231289    4.48e-84    316
    ## lcl|NC_050675.1_gene_14  contig_2968_pilon__unscaffolded 99.107  224 2   0   1   224 41  264 2.94e-108   396
    ## lcl|NC_050675.1_gene_28  contig_4859_pilon__unscaffolded 99.333  300 2   0   1   300 300 1   2.79e-149   533
    ## lcl|NC_050675.1_gene_29  contig_4859_pilon__unscaffolded 100.000 297 0   0   1   297 590 294 4.69e-151   536
    ## lcl|NC_050675.1_gene_32  contig_4859_pilon__unscaffolded 99.717  353 1   0   1   353 3109    3461    9.61e-180   633
    ## lcl|NC_050675.1_gene_38  contig_185_pilon__unscaffolded  72.840  729 139 21  46  755 30065   29377   1.12e-103   381
    ## lcl|NC_050675.1_gene_38  contig_185_pilon__unscaffolded  72.840  729 139 21  46  755 100325  99637   1.12e-103   381
    ## lcl|NC_050675.1_gene_38  contig_4678_pilon__unscaffolded 71.067  553 108 13  227 755 22881   23405   2.17e-68    265
    ## lcl|NC_050675.1_gene_38  contig_5718_pilon__unscaffolded 74.584  421 83  9   1   420 3857    4254    9.21e-67    259
    ## lcl|NC_050675.1_gene_38  PGA_scaffold22__59_contigs__length_10008237 74.584  421 83  9   1   420 9910036 9910433 9.21e-67    259
    ## lcl|NC_050675.1_gene_39  contig_5718_pilon__unscaffolded 84.731  799 83  15  1   788 1568    2338    0.0 859
    ## lcl|NC_050675.1_gene_39  contig_185_pilon__unscaffolded  77.829  875 138 22  1   858 31023   30188   0.0 655
    ## lcl|NC_050675.1_gene_39  contig_185_pilon__unscaffolded  77.829  875 138 22  1   858 101283  100448  0.0 655
    ## lcl|NC_050675.1_gene_39  contig_444_pilon___fragment_11__unscaffolded    76.596  846 152 24  1   829 55846   56662   8.57e-160   567
    ## lcl|NC_050675.1_gene_39  contig_6518_pilon__unscaffolded 76.023  855 149 23  1   837 848 32  2.99e-159   565
    ## lcl|NC_050675.1_gene_39  contig_91_pilon__unscaffolded   78.843  709 109 19  137 829 27935   27252   5.41e-156   554
    ## lcl|NC_050675.1_gene_39  PGA_scaffold22__59_contigs__length_10008237 75.467  803 132 24  1   788 9907767 9908519 5.78e-143   511
    ## lcl|NC_050675.1_gene_39  contig_5765_pilon__unscaffolded 78.510  698 89  32  145 828 8119    8769    1.55e-137   494
    ## lcl|NC_050675.1_gene_39  contig_4401_pilon___fragment_5__unscaffolded    73.267  707 111 20  137 829 37291   36649   2.16e-110   404
    ## lcl|NC_050675.1_gene_39  contig_396_pilon__unscaffolded  73.609  557 108 15  1   542 79508   80040   3.66e-82    310
    ## lcl|NC_050675.1_gene_39  contig_6427_pilon__unscaffolded 76.485  421 77  9   137 545 14880   14470   2.81e-77    293
    ## lcl|NC_050675.1_cds_YP_009926422.1_3 PGA_scaffold16__99_contigs__length_13714835 85.211  284 40  2   211 493 12231571    12231289    4.48e-84    316
    ## lcl|NC_050675.1_cds_YP_009926426.1_7 contig_2968_pilon__unscaffolded 99.107  224 2   0   1   224 41  264 2.94e-108   396
    ## lcl|NC_050675.1_cds_YP_009926429.1_10    contig_4859_pilon__unscaffolded 99.333  300 2   0   1   300 300 1   2.79e-149   533
    ## lcl|NC_050675.1_cds_YP_009926430.1_11    contig_4859_pilon__unscaffolded 100.000 297 0   0   1   297 590 294 4.69e-151   536
    ## lcl|NC_050675.1_cds_YP_009926431.1_12    contig_4859_pilon__unscaffolded 99.717  353 1   0   1   353 3109    3461    9.61e-180   633

## Using Complete Mito genome

    /home/shared/ncbi-blast-2.11.0+/bin/blastn \
    -task blastn \
    -query ../data/Mmag_mito.fa \
    -db ../results/04-mito-hunt/PGA_assembly \
    -out ../results/04-mito-hunt/mit-genome_blastn_05.tab \
    -evalue 1E-20 \
    -num_threads 48 \
    -max_target_seqs 10 \
    -outfmt 6

    cat ../results/04-mito-hunt/mit-genome_blastn_05.tab

    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.161  3511    384 79  35709   39160   264 3696    0.0 3751
    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.706  3267    356 74  35016   38235   495 3697    0.0 3553
    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.284  3085    316 68  36630   39658   259 3261    0.0 3335
    ## NC_050675.1  contig_2968_pilon__unscaffolded 84.932  2336    259 57  35016   37313   1414    3694    0.0 2453
    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.367  2139    218 43  37559   39658   265 2347    0.0 2339
    ## NC_050675.1  contig_2968_pilon__unscaffolded 84.632  1386    168 35  35016   36383   2336    3694    0.0 1423
    ## NC_050675.1  contig_2968_pilon__unscaffolded 84.647  1205    120 29  38475   39658   265 1425    0.0 1268
    ## NC_050675.1  contig_2968_pilon__unscaffolded 90.409  782 56  11  1   770 1239    2013    0.0 1040
    ## NC_050675.1  contig_2968_pilon__unscaffolded 88.761  783 68  12  1   770 319 1094    0.0 980
    ## NC_050675.1  contig_2968_pilon__unscaffolded 88.348  781 70  9   1   770 2159    2929    0.0 977
    ## NC_050675.1  contig_2968_pilon__unscaffolded 90.096  626 52  7   1   623 3075    3693    0.0 828
    ## NC_050675.1  contig_2968_pilon__unscaffolded 87.832  452 47  8   35016   35462   3250    3698    1.99e-149   539
    ## NC_050675.1  contig_2968_pilon__unscaffolded 99.242  264 2   0   8152    8415    1   264 2.96e-128   468
    ## NC_050675.1  contig_2968_pilon__unscaffolded 86.939  245 27  4   39417   39658   264 506 6.98e-73    285
    ## NC_050675.1  contig_2968_pilon__unscaffolded 77.129  411 68  14  34625   35020   956 1355    2.97e-71    279
    ## NC_050675.1  contig_2968_pilon__unscaffolded 76.773  409 70  12  34627   35020   1877    2275    2.97e-71    279
    ## NC_050675.1  contig_2968_pilon__unscaffolded 76.773  409 70  12  34627   35020   2793    3191    2.97e-71    279
    ## NC_050675.1  contig_2968_pilon__unscaffolded 84.699  183 23  4   34840   35020   256 435 1.18e-44    191
    ## NC_050675.1  contig_2932_pilon__unscaffolded 84.969  1284    144 25  36771   38038   1257    7   0.0 1378
    ## NC_050675.1  contig_2932_pilon__unscaffolded 83.551  1301    150 30  37692   38972   1257    1   0.0 1305
    ## NC_050675.1  contig_2932_pilon__unscaffolded 83.180  1302    162 35  35840   37124   1262    1   0.0 1255
    ## NC_050675.1  contig_2932_pilon__unscaffolded 83.923  1188    152 30  35016   36188   1164    1   0.0 1182
    ## NC_050675.1  contig_2932_pilon__unscaffolded 84.615  1053    118 16  38616   39658   1260    242 0.0 1137
    ## NC_050675.1  contig_2932_pilon__unscaffolded 87.931  696 60  14  80  765 1261    580 0.0 836
    ## NC_050675.1  contig_2932_pilon__unscaffolded 89.815  432 40  3   1   431 429 1   3.37e-159   572
    ## NC_050675.1  contig_2932_pilon__unscaffolded 77.506  409 65  13  34627   35020   709 313 1.64e-74    289
    ## NC_050675.1  contig_2932_pilon__unscaffolded 82.812  256 39  5   35016   35269   253 1   1.75e-61    246
    ## NC_050675.1  contig_2932_pilon__unscaffolded 91.071  112 9   1   39547   39658   1263    1153    8.52e-34    154
    ## NC_050675.1  contig_4859_pilon__unscaffolded 99.125  686 3   1   20794   21479   1   683 0.0 1209
    ## NC_050675.1  contig_4859_pilon__unscaffolded 87.040  733 53  15  23567   24279   3048    3758    0.0 865
    ## NC_050675.1  contig_4859_pilon__unscaffolded 74.661  442 63  15  33080   33476   6321    6758    1.54e-68    269
    ## NC_050675.1  contig_4859_pilon__unscaffolded 100.000 144 0   0   31006   31149   4874    5017    7.96e-66    260
    ## NC_050675.1  contig_4859_pilon__unscaffolded 70.029  684 173 20  37341   38008   15219   15886   5.03e-62    249
    ## NC_050675.1  contig_4859_pilon__unscaffolded 73.759  423 82  14  23022   23428   2398    2807    1.64e-55    226
    ## NC_050675.1  contig_4859_pilon__unscaffolded 83.871  217 22  6   22160   22373   1003    1209    2.44e-53    219
    ## NC_050675.1  contig_4859_pilon__unscaffolded 68.640  625 168 20  36475   37088   15279   15886   2.14e-41    179
    ## NC_050675.1  contig_4859_pilon__unscaffolded 68.132  637 159 25  38316   38937   15279   15886   5.74e-36    161
    ## NC_050675.1  contig_4859_pilon__unscaffolded 69.149  470 118 14  8   464 15506   15961   2.44e-34    156
    ## NC_050675.1  contig_4859_pilon__unscaffolded 74.694  245 51  9   34716   34955   15312   15550   2.78e-27    132
    ## NC_050675.1  contig_4859_pilon__unscaffolded 72.481  258 59  8   36489   36743   9285    9533    1.76e-23    121
    ## NC_050675.1  contig_4859_pilon__unscaffolded 71.942  278 53  13  37396   37663   9271    9533    7.47e-22    114
    ## NC_050675.1  contig_185_pilon__unscaffolded  74.076  1813    331 53  29386   31147   29377   31101   0.0 1038
    ## NC_050675.1  contig_185_pilon__unscaffolded  74.076  1813    331 53  29386   31147   99637   101361  0.0 1038
    ## NC_050675.1  contig_5718_pilon__unscaffolded 83.829  841 93  17  30279   31107   2338    1529    0.0 866
    ## NC_050675.1  contig_5718_pilon__unscaffolded 74.956  571 107 15  29721   30283   4254    3712    5.72e-93    351
    ## NC_050675.1  contig_2928_pilon__unscaffolded 87.524  521 57  7   37003   37518   4   521 6.09e-175   623
    ## NC_050675.1  contig_2928_pilon__unscaffolded 85.822  529 59  11  35147   35671   5   521 1.86e-162   581
    ## NC_050675.1  contig_2928_pilon__unscaffolded 84.990  513 62  10  38846   39348   1   508 3.85e-152   547
    ## NC_050675.1  contig_2928_pilon__unscaffolded 84.130  523 73  8   37919   38435   1   519 1.64e-150   543
    ## NC_050675.1  contig_2928_pilon__unscaffolded 83.673  539 65  13  36063   36596   1   521 1.99e-149   538
    ## NC_050675.1  contig_2928_pilon__unscaffolded 86.017  472 49  7   309 770 4   468 1.99e-149   538
    ## NC_050675.1  contig_444_pilon___fragment_11__unscaffolded    75.647  928 175 27  30238   31147   56662   55768   6.51e-162   580
    ## NC_050675.1  contig_6518_pilon__unscaffolded 75.244  921 167 26  30230   31131   32  910 3.37e-159   572
    ## NC_050675.1  contig_91_pilon__unscaffolded   75.328  916 163 28  30238   31131   27252   28126   5.00e-157   564
    ## NC_050675.1  PGA_scaffold22__59_contigs__length_10008237 75.030  845 142 26  30279   31107   9908519 9907728 1.87e-143   518
    ## NC_050675.1  PGA_scaffold22__59_contigs__length_10008237 74.956  571 107 15  29721   30283   9910433 9909891 5.72e-93    351

    /home/shared/ncbi-blast-2.11.0+/bin/blastn \
    -query ../data/Mmag_mito.fa \
    -db ../results/04-mito-hunt/PGA_assembly \
    -out ../results/04-mito-hunt/mit-genome_blastn_06.tab \
    -evalue 1E-20 \
    -num_threads 48 \
    -max_target_seqs 10 \
    -outfmt 6

    cat ../results/04-mito-hunt/mit-genome_blastn_06.tab

    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.434  3515    367 103 35709   39160   264 3696    0.0 3520
    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.885  3273    339 90  35016   38235   495 3697    0.0 3371
    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.636  3084    307 97  36630   39658   259 3261    0.0 3116
    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.171  2340    253 74  35016   37316   1414    3698    0.0 2313
    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.701  2140    209 66  37559   39658   265 2347    0.0 2167
    ## NC_050675.1  contig_2968_pilon__unscaffolded 84.748  1390    159 42  35016   36383   2336    3694    0.0 1343
    ## NC_050675.1  contig_2968_pilon__unscaffolded 85.145  1205    114 43  38475   39658   265 1425    0.0 1173
    ## NC_050675.1  contig_2968_pilon__unscaffolded 90.537  782 55  12  1   770 1239    2013    0.0 1016
    ## NC_050675.1  contig_2968_pilon__unscaffolded 88.903  784 65  15  1   770 319 1094    0.0 946
    ## NC_050675.1  contig_2968_pilon__unscaffolded 88.875  782 64  17  1   770 2159    2929    0.0 941
    ## NC_050675.1  contig_2968_pilon__unscaffolded 90.256  626 51  9   1   623 3075    3693    0.0 809
    ## NC_050675.1  contig_2968_pilon__unscaffolded 87.832  452 47  8   35016   35462   3250    3698    6.39e-145   523
    ## NC_050675.1  contig_2968_pilon__unscaffolded 99.242  264 2   0   8152    8415    1   264 5.04e-131   477
    ## NC_050675.1  contig_2932_pilon__unscaffolded 85.404  1288    134 35  36770   38038   1259    7   0.0 1288
    ## NC_050675.1  contig_2932_pilon__unscaffolded 84.402  1263    134 47  37727   38972   1217    1   0.0 1182
    ## NC_050675.1  contig_2932_pilon__unscaffolded 83.879  1284    146 48  35860   37124   1242    1   0.0 1168
    ## NC_050675.1  contig_2932_pilon__unscaffolded 84.131  1191    144 37  35016   36188   1164    1   0.0 1110
    ## NC_050675.1  contig_2932_pilon__unscaffolded 85.133  1056    107 34  38616   39658   1260    242 0.0 1035
    ## NC_050675.1  contig_2932_pilon__unscaffolded 88.379  697 55  20  80  765 1261    580 0.0 815
    ## NC_050675.1  contig_2932_pilon__unscaffolded 90.069  433 37  6   1   431 429 1   6.30e-155   556
    ## NC_050675.1  contig_2932_pilon__unscaffolded 91.743  109 8   1   39550   39658   1260    1153    1.25e-32    150
    ## NC_050675.1  contig_4859_pilon__unscaffolded 99.125  686 3   2   20794   21479   1   683 0.0 1230
    ## NC_050675.1  contig_4859_pilon__unscaffolded 89.174  702 34  28  23600   24279   3077    3758    0.0 837
    ## NC_050675.1  contig_4859_pilon__unscaffolded 100.000 144 0   0   31006   31149   4874    5017    1.19e-67    267
    ## NC_050675.1  contig_4859_pilon__unscaffolded 85.321  218 17  12  22160   22373   1003    1209    5.65e-51    211
    ## NC_050675.1  contig_4859_pilon__unscaffolded 83.590  195 24  7   33242   33431   6522    6713    2.06e-40    176
    ## NC_050675.1  contig_4859_pilon__unscaffolded 81.166  223 28  10  23022   23241   2398    2609    1.24e-37    167
    ## NC_050675.1  contig_4859_pilon__unscaffolded 100.000 73  0   0   33080   33152   6321    6393    3.50e-28    135
    ## NC_050675.1  contig_5718_pilon__unscaffolded 89.442  663 41  15  30279   30930   2338    1694    0.0 809
    ## NC_050675.1  contig_5718_pilon__unscaffolded 76.348  575 92  30  29721   30283   4254    3712    3.30e-68    268
    ## NC_050675.1  contig_185_pilon__unscaffolded  76.489  1595    250 84  29386   30931   29377   30895   0.0 752
    ## NC_050675.1  contig_185_pilon__unscaffolded  76.489  1595    250 84  29386   30931   99637   101155  0.0 752
    ## NC_050675.1  contig_2928_pilon__unscaffolded 87.739  522 54  10  37003   37518   4   521 2.87e-168   601
    ## NC_050675.1  contig_2928_pilon__unscaffolded 86.226  530 55  16  35147   35671   5   521 1.75e-155   558
    ## NC_050675.1  contig_2928_pilon__unscaffolded 86.681  473 44  13  309 770 4   468 6.43e-140   507
    ## NC_050675.1  contig_2928_pilon__unscaffolded 84.411  526 69  11  37919   38436   1   521 2.31e-139   505
    ## NC_050675.1  contig_2928_pilon__unscaffolded 84.259  540 60  19  36063   36596   1   521 8.32e-139   503
    ## NC_050675.1  contig_3489_pilon__unscaffolded 86.621  441 42  16  37083   37514   433 1   2.35e-129   472
    ## NC_050675.1  contig_3489_pilon__unscaffolded 84.564  447 46  18  35227   35665   434 3   2.40e-114   422
    ## NC_050675.1  contig_3489_pilon__unscaffolded 86.154  390 29  17  390 765 433 55  4.04e-107   398
    ## NC_050675.1  contig_3489_pilon__unscaffolded 83.447  441 53  16  38003   38432   433 2   1.88e-105   392
    ## NC_050675.1  contig_3489_pilon__unscaffolded 81.718  454 56  16  36146   36592   434 1   8.87e-94    353
    ## NC_050675.1  contig_444_pilon___fragment_11__unscaffolded    79.383  713 102 29  30238   30930   56662   55975   5.08e-126   460
    ## NC_050675.1  contig_91_pilon__unscaffolded   79.296  710 104 27  30238   30930   27252   27935   6.57e-125   457
    ## NC_050675.1  contig_5765_pilon__unscaffolded 85.621  459 34  26  30239   30693   8769    8339    8.50e-124   453
