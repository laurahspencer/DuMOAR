# Generating a genome file to use

This is the file submitted to NCBI -

PGA\_assembly.fasta.filtered.renamed.fa

    head ../data/Mmag_assembly.fasta.filtered.renamed.fa

    ## >PGA_scaffold0__40_contigs__length_4818635
    ## AAAAGGTAGATGGAGAAGTAGGAGGAAGGATGTGGGTGGTGTCAGGTCCCTAGGGGACCT
    ## GAGAGGATTAACAGGGGTCTGCCCTCTCATCCCCCCAGCCCCCCTATGCTGATCACCAAC
    ## ATGAATCCAAACTAATGACGCTCCACCCATCATTTCAGCAGCCATTCTCAGGGTGAGGAG
    ## AGCAGGAAAGGCGGGGCATCGTCCGCCTTCGATTTTTTAATAGAGTTTAGTCACTGTAGG
    ## GAGGACGAAAGGGCTGCAGGACTACTATAAAACTTTCTTCCTTCCCTCCCTTTCTCCCTC
    ## CATTGCAGACCAAGTGGGACTTCACGCTCATGGGTGGCATGCTGTATGTTTTCCTCATCA
    ## TGCTCCTCTTTTTCGGCATCATGGCGGGCATTATGCAGAGTAATGTGCTCAACATACTCT
    ## ATGCTTGCCTGGGCGCGCTGCTGTTCTCCTTCTACATCGTATTCGACACGCAGCTCATGC
    ## TTGGAGGCAGCCACAAGCTGGCCATCTCGCCCGAGGAGTACATCTTTGCCGCGCTCAACC

    grep '>' ../data/Mmag_assembly.fasta.filtered.renamed.fa | head -40

    ## >PGA_scaffold0__40_contigs__length_4818635
    ## >PGA_scaffold1__111_contigs__length_23635802
    ## >PGA_scaffold2__216_contigs__length_42616187
    ## >PGA_scaffold3__77_contigs__length_22140449
    ## >PGA_scaffold4__118_contigs__length_24133938
    ## >PGA_scaffold5__54_contigs__length_17529967
    ## >PGA_scaffold6__2_contigs__length_4500
    ## >PGA_scaffold7__77_contigs__length_16129408
    ## >PGA_scaffold8__70_contigs__length_6254265
    ## >PGA_scaffold9__2_contigs__length_6774
    ## >PGA_scaffold10__58_contigs__length_8083807
    ## >PGA_scaffold11__78_contigs__length_11409253
    ## >PGA_scaffold12__214_contigs__length_38711105
    ## >PGA_scaffold13__56_contigs__length_10281103
    ## >PGA_scaffold14__49_contigs__length_6382615
    ## >PGA_scaffold15__74_contigs__length_14466968
    ## >PGA_scaffold16__99_contigs__length_13714835
    ## >PGA_scaffold17__171_contigs__length_27881435
    ## >PGA_scaffold18__98_contigs__length_15388888
    ## >PGA_scaffold19__65_contigs__length_13296201
    ## >PGA_scaffold20__42_contigs__length_7444180
    ## >PGA_scaffold21__67_contigs__length_16858916
    ## >PGA_scaffold22__59_contigs__length_10008237
    ## >PGA_scaffold23__65_contigs__length_9586800
    ## >PGA_scaffold24__25_contigs__length_9615596
    ## >PGA_scaffold25__121_contigs__length_9021638
    ## >PGA_scaffold26__34_contigs__length_3174094
    ## >PGA_scaffold27__24_contigs__length_4511419
    ## >PGA_scaffold28__73_contigs__length_10794191
    ## >PGA_scaffold29__63_contigs__length_7458616
    ## >PGA_scaffold30__53_contigs__length_3533588
    ## >PGA_scaffold31__35_contigs__length_1951197
    ## >PGA_scaffold32__48_contigs__length_8091588
    ## >PGA_scaffold33__68_contigs__length_5591008
    ## >PGA_scaffold34__18_contigs__length_2048619
    ## >PGA_scaffold35__36_contigs__length_7416912
    ## >PGA_scaffold36__50_contigs__length_8312113
    ## >PGA_scaffold37__114_contigs__length_22981779
    ## >PGA_scaffold38__30_contigs__length_10707134
    ## >PGA_scaffold39__82_contigs__length_19157343

    grep '>' ../data/Mmag_assembly.fasta.filtered.renamed.fa | wc -l

    ## 2752
