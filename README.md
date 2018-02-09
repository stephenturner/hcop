
hcop: HGNC Comparison of Orthology Predictions
==============================================

Human ortholog data from HGNC Comparison of Orthology Predictions (HCOP). The HGNC Comparison of Orthology Predictions (HCOP) integrates and displays the orthology assertions predicted for a specified human gene, or set of human genes, by eggNOG, Ensembl Compara, HGNC, HomoloGene, Inparanoid, NCBI Gene Orthology, OMA, OrthoDB, OrthoMCL, Panther, PhylomeDB, TreeFam and ZFIN. An indication of the reliability of a prediction is provided by the number of databases which concur. Data collected from HCOP at <https://www.genenames.org/cgi-bin/hcop> via ftp at <ftp://ftp.ebi.ac.uk/pub/databases/genenames/hcop/>.

See [data-raw/hcop.R](data-raw/hcop.R) for how this data was generated.

Installation
------------

``` r
# install.packages("devtools")
devtools::install_github("stephenturner/hcop")
```

Usage
-----

Get the mouse orthologs of your favorite genes:

``` r
library(hcop)
library(dplyr)

my_favorite_human_genes <- data_frame(human_symbol=c("TP53", "TNF", "EGFR", "VEGFA", "APOE", 
                                                     "IL6", "TGFB1", "MTHFR", "ESR1", "AKT1"))
my_favorite_human_genes
```

    ## # A tibble: 10 x 1
    ##    human_symbol
    ##    <chr>       
    ##  1 TP53        
    ##  2 TNF         
    ##  3 EGFR        
    ##  4 VEGFA       
    ##  5 APOE        
    ##  6 IL6         
    ##  7 TGFB1       
    ##  8 MTHFR       
    ##  9 ESR1        
    ## 10 AKT1

``` r
# Join to mouse orthologs
my_favorite_human_genes %>% 
  inner_join(mouse, by="human_symbol")
```

    ## # A tibble: 17 x 9
    ##    human_symbol mouse_symbol human_ensembl   mouse_ensembl      human_entrez mouse_entrez human_name                           mouse_name                           support                                                                                      
    ##    <chr>        <chr>        <chr>           <chr>                     <int>        <int> <chr>                                <chr>                                <chr>                                                                                        
    ##  1 TP53         Trp53        ENSG00000141510 ENSMUSG00000059552         7157        22059 tumor protein p53                    transformation related protein 53    PhylomeDB,Inparanoid,HomoloGene,EggNOG,OrthoMCL,HGNC,NCBI,Ensembl,Treefam,OMA,Panther,OrthoDB
    ##  2 TP53         Trp63        ENSG00000141510 ENSMUSG00000022510         7157        22061 tumor protein p53                    transformation related protein 63    OrthoDB                                                                                      
    ##  3 TP53         Trp73        ENSG00000141510 ENSMUSG00000029026         7157        22062 tumor protein p53                    transformation related protein 73    OrthoDB                                                                                      
    ##  4 TNF          Tnf          ENSG00000232810 ENSMUSG00000024401         7124        21926 tumor necrosis factor                tumor necrosis factor                PhylomeDB,Inparanoid,HomoloGene,HGNC,OrthoMCL,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB       
    ##  5 EGFR         Egfr         ENSG00000146648 ENSMUSG00000020122         1956        13649 epidermal growth factor receptor     epidermal growth factor receptor     Inparanoid,HomoloGene,PhylomeDB,EggNOG,OrthoMCL,HGNC,NCBI,Ensembl,Treefam,OMA,Panther,OrthoDB
    ##  6 EGFR         Erbb4        ENSG00000146648 ENSMUSG00000062209         1956        13869 epidermal growth factor receptor     erb-b2 receptor tyrosine kinase 4    OrthoMCL                                                                                     
    ##  7 EGFR         Erbb2        ENSG00000146648 ENSMUSG00000062312         1956        13866 epidermal growth factor receptor     erb-b2 receptor tyrosine kinase 2    OrthoMCL                                                                                     
    ##  8 EGFR         Erbb3        ENSG00000146648 ENSMUSG00000018166         1956        13867 epidermal growth factor receptor     erb-b2 receptor tyrosine kinase 3    OrthoMCL                                                                                     
    ##  9 VEGFA        Vegfa        ENSG00000112715 ENSMUSG00000023951         7422        22339 vascular endothelial growth factor A vascular endothelial growth factor A HomoloGene,Inparanoid,PhylomeDB,EggNOG,HGNC,OrthoMCL,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB
    ## 10 APOE         Apoe         ENSG00000130203 ENSMUSG00000002985          348        11816 apolipoprotein E                     apolipoprotein E                     PhylomeDB,Inparanoid,HomoloGene,EggNOG,OrthoMCL,HGNC,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB
    ## 11 IL6          Il6          ENSG00000136244 ENSMUSG00000025746         3569        16193 interleukin 6                        interleukin 6                        HomoloGene,PhylomeDB,Inparanoid,EggNOG,HGNC,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB         
    ## 12 TGFB1        Tgfb1        ENSG00000105329 ENSMUSG00000002603         7040        21803 transforming growth factor beta 1    transforming growth factor, beta 1   Inparanoid,PhylomeDB,HomoloGene,EggNOG,OrthoMCL,HGNC,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB
    ## 13 MTHFR        Mthfr        ENSG00000177000 ENSMUSG00000029009         4524        17769 methylenetetrahydrofolate reductase  methylenetetrahydrofolate reductase  Inparanoid,HomoloGene,EggNOG,OrthoMCL,HGNC,NCBI,Treefam,OMA,Ensembl,Panther,OrthoDB          
    ## 14 ESR1         Esr1         ENSG00000091831 ENSMUSG00000019768         2099        13982 estrogen receptor 1                  estrogen receptor 1 (alpha)          Inparanoid,HomoloGene,PhylomeDB,EggNOG,HGNC,OrthoMCL,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB
    ## 15 AKT1         Akt1         ENSG00000142208 ENSMUSG00000001729          207        11651 AKT serine/threonine kinase 1        thymoma viral proto-oncogene 1       Inparanoid,HomoloGene,EggNOG,HGNC,NCBI,Ensembl,OMA,Treefam,Panther,OrthoDB                   
    ## 16 AKT1         Akt2         ENSG00000142208 ENSMUSG00000004056          207        11652 AKT serine/threonine kinase 1        thymoma viral proto-oncogene 2       OrthoMCL,OrthoDB                                                                             
    ## 17 AKT1         Akt3         ENSG00000142208 ENSMUSG00000019699          207        23797 AKT serine/threonine kinase 1        thymoma viral proto-oncogene 3       OrthoMCL,OrthoDB

``` r
# Continue the above, but collapse all other columns down to unique entries
my_favorite_human_genes %>% 
  inner_join(mouse, by="human_symbol") %>% 
  group_by(human_symbol) %>% 
  summarize_all(funs(. %>% unique %>% paste(collapse=";")))
```

    ## # A tibble: 10 x 9
    ##    human_symbol mouse_symbol           human_ensembl   mouse_ensembl                                                               human_entrez mouse_entrez            human_name                           mouse_name                                                                                                                             support                                                                                               
    ##    <chr>        <chr>                  <chr>           <chr>                                                                       <chr>        <chr>                   <chr>                                <chr>                                                                                                                                  <chr>                                                                                                 
    ##  1 AKT1         Akt1;Akt2;Akt3         ENSG00000142208 ENSMUSG00000001729;ENSMUSG00000004056;ENSMUSG00000019699                    207          11651;11652;23797       AKT serine/threonine kinase 1        thymoma viral proto-oncogene 1;thymoma viral proto-oncogene 2;thymoma viral proto-oncogene 3                                           Inparanoid,HomoloGene,EggNOG,HGNC,NCBI,Ensembl,OMA,Treefam,Panther,OrthoDB;OrthoMCL,OrthoDB           
    ##  2 APOE         Apoe                   ENSG00000130203 ENSMUSG00000002985                                                          348          11816                   apolipoprotein E                     apolipoprotein E                                                                                                                       PhylomeDB,Inparanoid,HomoloGene,EggNOG,OrthoMCL,HGNC,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB         
    ##  3 EGFR         Egfr;Erbb4;Erbb2;Erbb3 ENSG00000146648 ENSMUSG00000020122;ENSMUSG00000062209;ENSMUSG00000062312;ENSMUSG00000018166 1956         13649;13869;13866;13867 epidermal growth factor receptor     epidermal growth factor receptor;erb-b2 receptor tyrosine kinase 4;erb-b2 receptor tyrosine kinase 2;erb-b2 receptor tyrosine kinase 3 Inparanoid,HomoloGene,PhylomeDB,EggNOG,OrthoMCL,HGNC,NCBI,Ensembl,Treefam,OMA,Panther,OrthoDB;OrthoMCL
    ##  4 ESR1         Esr1                   ENSG00000091831 ENSMUSG00000019768                                                          2099         13982                   estrogen receptor 1                  estrogen receptor 1 (alpha)                                                                                                            Inparanoid,HomoloGene,PhylomeDB,EggNOG,HGNC,OrthoMCL,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB         
    ##  5 IL6          Il6                    ENSG00000136244 ENSMUSG00000025746                                                          3569         16193                   interleukin 6                        interleukin 6                                                                                                                          HomoloGene,PhylomeDB,Inparanoid,EggNOG,HGNC,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB                  
    ##  6 MTHFR        Mthfr                  ENSG00000177000 ENSMUSG00000029009                                                          4524         17769                   methylenetetrahydrofolate reductase  methylenetetrahydrofolate reductase                                                                                                    Inparanoid,HomoloGene,EggNOG,OrthoMCL,HGNC,NCBI,Treefam,OMA,Ensembl,Panther,OrthoDB                   
    ##  7 TGFB1        Tgfb1                  ENSG00000105329 ENSMUSG00000002603                                                          7040         21803                   transforming growth factor beta 1    transforming growth factor, beta 1                                                                                                     Inparanoid,PhylomeDB,HomoloGene,EggNOG,OrthoMCL,HGNC,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB         
    ##  8 TNF          Tnf                    ENSG00000232810 ENSMUSG00000024401                                                          7124         21926                   tumor necrosis factor                tumor necrosis factor                                                                                                                  PhylomeDB,Inparanoid,HomoloGene,HGNC,OrthoMCL,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB                
    ##  9 TP53         Trp53;Trp63;Trp73      ENSG00000141510 ENSMUSG00000059552;ENSMUSG00000022510;ENSMUSG00000029026                    7157         22059;22061;22062       tumor protein p53                    transformation related protein 53;transformation related protein 63;transformation related protein 73                                  PhylomeDB,Inparanoid,HomoloGene,EggNOG,OrthoMCL,HGNC,NCBI,Ensembl,Treefam,OMA,Panther,OrthoDB;OrthoDB 
    ## 10 VEGFA        Vegfa                  ENSG00000112715 ENSMUSG00000023951                                                          7422         22339                   vascular endothelial growth factor A vascular endothelial growth factor A                                                                                                   HomoloGene,Inparanoid,PhylomeDB,EggNOG,HGNC,OrthoMCL,NCBI,Treefam,Ensembl,OMA,Panther,OrthoDB

All the data
------------

Data from the following organisms are available:

-   `anole_lizard`
-   `c.elegans`
-   `chicken`
-   `chimpanzee`
-   `cow`
-   `dog`
-   `fruitfly`
-   `horse`
-   `macaque`
-   `mouse`
-   `opossum`
-   `pig`
-   `platypus`
-   `rat`
-   `s.cerevisiae`
-   `xenopus`
-   `zebrafish`

``` r
anole_lizard
```

    ## # A tibble: 88,020 x 9
    ##    human_symbol anole_lizard_symbol human_ensembl   anole_lizard_ensembl human_entrez anole_lizard_entrez human_name                        anole_lizard_name                   support                                                   
    ##    <chr>        <chr>               <chr>           <chr>                       <int>               <int> <chr>                             <chr>                               <chr>                                                     
    ##  1 7SK          7SK                 ENSG00000273591 ENSACAG00000021439             NA                  NA 7SK RNA [Source:RFAM;Acc:RF00100] 7SK RNA [Source:RFAM;Acc:RF00100]   Ensembl                                                   
    ##  2 7SK          7SK                 ENSG00000274303 ENSACAG00000021326             NA                  NA 7SK RNA [Source:RFAM;Acc:RF00100] 7SK RNA [Source:RFAM;Acc:RF00100]   Ensembl                                                   
    ##  3 7SK          7SK                 ENSG00000275933 ENSACAG00000021439             NA                  NA 7SK RNA [Source:RFAM;Acc:RF00100] 7SK RNA [Source:RFAM;Acc:RF00100]   Ensembl                                                   
    ##  4 7SK          7SK                 ENSG00000276626 ENSACAG00000021439             NA                  NA 7SK RNA [Source:RFAM;Acc:RF00100] 7SK RNA [Source:RFAM;Acc:RF00100]   Ensembl                                                   
    ##  5 7SK          7SK                 ENSG00000277313 ENSACAG00000021439             NA                  NA 7SK RNA [Source:RFAM;Acc:RF00100] 7SK RNA [Source:RFAM;Acc:RF00100]   Ensembl                                                   
    ##  6 7SK          7SK                 ENSG00000271394 ENSACAG00000021525             NA                  NA 7SK RNA [Source:RFAM;Acc:RF00100] 7SK RNA [Source:RFAM;Acc:RF00100]   Ensembl                                                   
    ##  7 A1BG         <NA>                ENSG00000121410 ENSACAG00000016968              1                  NA alpha-1-B glycoprotein            <NA>                                Treefam,Panther                                           
    ##  8 A1BG         LOC103280220        ENSG00000121410 ENSACAG00000022270              1           103280220 alpha-1-B glycoprotein            immunoglobulin superfamily member 1 Ensembl,Panther                                           
    ##  9 A1BG         <NA>                ENSG00000121410 ENSACAG00000027060              1                  NA alpha-1-B glycoprotein            <NA>                                Panther,OrthoDB                                           
    ## 10 A1CF         a1cf                ENSG00000148584 ENSACAG00000015269          29974           100553455 APOBEC1 complementation factor    APOBEC1 complementation factor      Inparanoid,EggNOG,NCBI,OMA,Treefam,Ensembl,Panther,OrthoDB
    ## # ... with 88,010 more rows

``` r
c.elegans
```

    ## # A tibble: 65,161 x 9
    ##    human_symbol c.elegans_symbol human_ensembl   c.elegans_ensembl human_entrez c.elegans_entrez human_name                                      c.elegans_name                        support                                                             
    ##    <chr>        <chr>            <chr>           <chr>                    <int>            <int> <chr>                                           <chr>                                 <chr>                                                               
    ##  1 A1CF         hrp-2            ENSG00000148584 WBGene00002000           29974           173086 APOBEC1 complementation factor                  human HnRNP A1 homolog                Ensembl,OrthoDB                                                     
    ##  2 A2M          F13D2.1          ENSG00000175899 WBGene00008735               2           181305 alpha-2-macroglobulin                           hypothetical protein                  Panther                                                             
    ##  3 A2M          tep-1            ENSG00000175899 WBGene00013969               2           173367 alpha-2-macroglobulin                           TEP (ThiolEster containing Protein)   EggNOG                                                              
    ##  4 A2ML1        F13D2.1          ENSG00000166535 WBGene00008735          144568           181305 alpha-2-macroglobulin like 1                    hypothetical protein                  Panther                                                             
    ##  5 A4GALT       fbxb-7           ENSG00000128274 WBGene00012492           53947           189498 alpha 1,4-galactosyltransferase (P blood group) F-box B protein                       OrthoDB                                                             
    ##  6 A4GALT       Y20C6A.4         ENSG00000128274 WBGene00077495           53947          6418791 alpha 1,4-galactosyltransferase (P blood group) hypothetical protein                  OrthoDB                                                             
    ##  7 A4GNT        fbxb-7           ENSG00000118017 WBGene00012492           51146           189498 alpha-1,4-N-acetylglucosaminyltransferase       F-box B protein                       OrthoDB                                                             
    ##  8 A4GNT        Y20C6A.4         ENSG00000118017 WBGene00077495           51146          6418791 alpha-1,4-N-acetylglucosaminyltransferase       hypothetical protein                  OrthoDB                                                             
    ##  9 AACS         sur-5            ENSG00000081760 WBGene00006351           65985           180992 acetoacetyl-CoA synthetase                      Acetoacetyl-CoA synthetase            Inparanoid,HomoloGene,OMA,OrthoMCL,PhylomeDB,Ensembl,Panther,OrthoDB
    ## 10 AADAC        trcs-1           ENSG00000114771 WBGene00009186              13           177791 arylacetamide deacetylase                       TRansport of membrane to Cell Surface Ensembl,OMA,Panther,OrthoDB                                         
    ## # ... with 65,151 more rows

``` r
chicken
```

    ## # A tibble: 46,422 x 9
    ##    human_symbol chicken_symbol human_ensembl   chicken_ensembl    human_entrez chicken_entrez human_name                                 chicken_name                                                       support        
    ##    <chr>        <chr>          <chr>           <chr>                     <int>          <int> <chr>                                      <chr>                                                              <chr>          
    ##  1 5S_rRNA      5S_rRNA        ENSG00000277411 ENSGALG00000025601           NA             NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001] 5S ribosomal RNA [Source:RFAM;Acc:RF00001]                         Ensembl        
    ##  2 A1BG         IGSF1L3        ENSG00000121410 ENSGALG00000030005            1         419114 alpha-1-B glycoprotein                     immunoglobulin superfamily member 1-like 3                         Ensembl,Panther
    ##  3 A1BG         CHIR-B5        ENSG00000121410 ENSGALG00000029309            1         430678 alpha-1-B glycoprotein                     immunoglobulin-like receptor CHIR-B5                               Panther        
    ##  4 A1BG         IGSF1L9        ENSG00000121410 ENSGALG00000045406            1         431060 alpha-1-B glycoprotein                     immunoglobulin superfamily member 1-like 9                         Panther        
    ##  5 A1BG         PGP6L          ENSG00000121410 ENSGALG00000037972            1         431128 alpha-1-B glycoprotein                     platelet glycoprotein VI-like                                      Panther        
    ##  6 A1BG         CHIR-B4        ENSG00000121410 ENSGALG00000034411            1         768447 alpha-1-B glycoprotein                     immunoglobulin-like receptor CHIR-B4                               Panther        
    ##  7 A1BG         CHIR-A2        ENSG00000121410 ENSGALG00000031100            1         770673 alpha-1-B glycoprotein                     immunoglobulin-like receptor CHIR-A2                               Panther        
    ##  8 A1BG         LILRA6L1       ENSG00000121410 ENSGALG00000040094            1         776202 alpha-1-B glycoprotein                     leukocyte immunoglobulin-like receptor subfamily A member 6-like 1 Panther        
    ##  9 A1BG         CHIR-B2        ENSG00000121410 ENSGALG00000033483            1         776711 alpha-1-B glycoprotein                     immunoglobulin-like receptor CHIR-B2                               Panther        
    ## 10 A1BG         CHIR-AB-487    ENSG00000121410 ENSGALG00000038888            1      100313497 alpha-1-B glycoprotein                     immunoglobulin-like receptor CHIR-AB-487                           Panther        
    ## # ... with 46,412 more rows

``` r
chimpanzee
```

    ## # A tibble: 42,990 x 9
    ##    human_symbol chimpanzee_symbol human_ensembl   chimpanzee_ensembl human_entrez chimpanzee_entrez human_name                                   chimpanzee_name                              support                                                                      
    ##    <chr>        <chr>             <chr>           <chr>                     <int>             <int> <chr>                                        <chr>                                        <chr>                                                                        
    ##  1 5S_rRNA      5S_rRNA           ENSG00000276861 ENSPTRG00000035592           NA                NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]   5S ribosomal RNA [Source:RFAM;Acc:RF00001]   Ensembl                                                                      
    ##  2 5_8S_rRNA    5_8S_rRNA         ENSG00000275877 ENSPTRG00000050369           NA                NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                      
    ##  3 7SK          7SK               ENSG00000274303 ENSPTRG00000050574           NA                NA 7SK RNA [Source:RFAM;Acc:RF00100]            7SK RNA [Source:RFAM;Acc:RF00100]            Ensembl                                                                      
    ##  4 A1BG         A1BG              ENSG00000121410 ENSPTRG00000011588            1            742390 alpha-1-B glycoprotein                       alpha-1-B glycoprotein                       HomoloGene,OMA,Treefam,Panther,EggNOG,OrthoDB,NCBI,Ensembl,OrthoMCL          
    ##  5 A1CF         A1CF              ENSG00000148584 ENSPTRG00000002508        29974            466076 APOBEC1 complementation factor               APOBEC1 complementation factor               PhylomeDB,OMA,HomoloGene,Treefam,Panther,EggNOG,OrthoDB,Ensembl,NCBI,OrthoMCL
    ##  6 A1CF         RBM47             ENSG00000148584 ENSPTRG00000016006        29974            461182 APOBEC1 complementation factor               RNA binding motif protein 47                 OrthoDB                                                                      
    ##  7 A1CF         RBM46             ENSG00000148584 ENSPTRG00000016538        29974            473494 APOBEC1 complementation factor               RNA binding motif protein 46                 OrthoDB                                                                      
    ##  8 A2M          A2M               ENSG00000175899 ENSPTRG00000004650            2            465372 alpha-2-macroglobulin                        alpha-2-macroglobulin                        OMA,HomoloGene,Panther,Treefam,OrthoDB,NCBI,Ensembl                          
    ##  9 A2M          PZP               ENSG00000175899 ENSPTRG00000004652            2            465371 alpha-2-macroglobulin                        PZP, alpha-2-macroglobulin like              OrthoDB,OrthoMCL                                                             
    ## 10 A2M          A2ML1             ENSG00000175899 ENSPTRG00000004645            2            465375 alpha-2-macroglobulin                        alpha-2-macroglobulin like 1                 OrthoMCL                                                                     
    ## # ... with 42,980 more rows

``` r
cow
```

    ## # A tibble: 40,817 x 9
    ##    human_symbol cow_symbol human_ensembl   cow_ensembl        human_entrez cow_entrez human_name                                   cow_name                                     support
    ##    <chr>        <chr>      <chr>           <chr>                     <int>      <int> <chr>                                        <chr>                                        <chr>  
    ##  1 5S_rRNA      5S_rRNA    ENSG00000277411 ENSBTAG00000029491           NA         NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]   5S ribosomal RNA [Source:RFAM;Acc:RF00001]   Ensembl
    ##  2 5S_rRNA      5S_rRNA    ENSG00000277488 ENSBTAG00000044984           NA         NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]   5S ribosomal RNA [Source:RFAM;Acc:RF00001]   Ensembl
    ##  3 5_8S_rRNA    5_8S_rRNA  ENSG00000276871 ENSBTAG00000037637           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  4 5_8S_rRNA    5_8S_rRNA  ENSG00000276871 ENSBTAG00000045481           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  5 5_8S_rRNA    5_8S_rRNA  ENSG00000276871 ENSBTAG00000046680           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  6 5_8S_rRNA    5_8S_rRNA  ENSG00000283274 ENSBTAG00000037637           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  7 5_8S_rRNA    5_8S_rRNA  ENSG00000283274 ENSBTAG00000045481           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  8 5_8S_rRNA    5_8S_rRNA  ENSG00000283274 ENSBTAG00000046680           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  9 5_8S_rRNA    5_8S_rRNA  ENSG00000283291 ENSBTAG00000037637           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ## 10 5_8S_rRNA    5_8S_rRNA  ENSG00000283291 ENSBTAG00000045481           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ## # ... with 40,807 more rows

``` r
dog
```

    ## # A tibble: 38,902 x 9
    ##    human_symbol dog_symbol human_ensembl   dog_ensembl        human_entrez dog_entrez human_name                                 dog_name                                   support                                                                       
    ##    <chr>        <chr>      <chr>           <chr>                     <int>      <int> <chr>                                      <chr>                                      <chr>                                                                         
    ##  1 5S_rRNA      5S_rRNA    ENSG00000277488 ENSCAFG00000027109           NA         NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001] 5S ribosomal RNA [Source:RFAM;Acc:RF00001] Ensembl                                                                       
    ##  2 A1BG         A1BG       ENSG00000121410 ENSCAFG00000002367            1     484230 alpha-1-B glycoprotein                     alpha-1-B glycoprotein                     Inparanoid,Ensembl,HomoloGene,Panther,OMA,Treefam,NCBI,EggNOG,OrthoMCL,OrthoDB
    ##  3 A1CF         A1CF       ENSG00000148584 ENSCAFG00000015581        29974     477581 APOBEC1 complementation factor             APOBEC1 complementation factor             Inparanoid,Ensembl,HomoloGene,OMA,Panther,Treefam,NCBI,EggNOG,OrthoMCL,OrthoDB
    ##  4 A2M          A2ML1      ENSG00000175899 ENSCAFG00000013853            2     486697 alpha-2-macroglobulin                      alpha-2-macroglobulin like 1               OrthoMCL                                                                      
    ##  5 A2M          LOC477699  ENSG00000175899 ENSCAFG00000025567            2     477699 alpha-2-macroglobulin                      alpha-2-macroglobulin                      Ensembl,HomoloGene,Panther,OMA,Treefam,OrthoMCL,OrthoDB                       
    ##  6 A2M          LOC611455  ENSG00000175899 ENSCAFG00000013748            2     611455 alpha-2-macroglobulin                      ovostatin homolog 2-like                   OrthoMCL                                                                      
    ##  7 A2M          LOC611458  ENSG00000175899 ENSCAFG00000024781            2     611458 alpha-2-macroglobulin                      pregnancy zone protein-like                OrthoMCL                                                                      
    ##  8 A2ML1        A2ML1      ENSG00000166535 ENSCAFG00000013853       144568     486697 alpha-2-macroglobulin like 1               alpha-2-macroglobulin like 1               Inparanoid,Ensembl,HomoloGene,Panther,OMA,Treefam,NCBI,EggNOG,OrthoMCL,OrthoDB
    ##  9 A2ML1        LOC611455  ENSG00000166535 ENSCAFG00000013748       144568     611455 alpha-2-macroglobulin like 1               ovostatin homolog 2-like                   OrthoMCL                                                                      
    ## 10 A2ML1        LOC611458  ENSG00000166535 ENSCAFG00000024781       144568     611458 alpha-2-macroglobulin like 1               pregnancy zone protein-like                OrthoMCL                                                                      
    ## # ... with 38,892 more rows

``` r
fruitfly
```

    ## # A tibble: 58,130 x 9
    ##    human_symbol fruit_fly_symbol human_ensembl   fruit_fly_ensembl human_entrez fruit_fly_entrez human_name                                      fruit_fly_name                                  support                                                   
    ##    <chr>        <chr>            <chr>           <chr>                    <int>            <int> <chr>                                           <chr>                                           <chr>                                                     
    ##  1 A1CF         Syp              ENSG00000148584 FBgn0038826              29974            42460 APOBEC1 complementation factor                  Syncrip                                         Ensembl,OrthoDB                                           
    ##  2 A2M          Tep3             ENSG00000175899 FBgn0041181                  2            34045 alpha-2-macroglobulin                           Thioester-containing protein 3                  EggNOG                                                    
    ##  3 A2M          Mcr              ENSG00000175899 FBgn0267488                  2            44071 alpha-2-macroglobulin                           Macroglobulin complement-related                Ensembl                                                   
    ##  4 A2ML1        Mcr              ENSG00000166535 FBgn0267488             144568            44071 alpha-2-macroglobulin like 1                    Macroglobulin complement-related                Ensembl                                                   
    ##  5 A4GALT       alpha4GT1        ENSG00000128274 FBgn0031491              53947            33512 alpha 1,4-galactosyltransferase (P blood group) CG17223 gene product from transcript CG17223-RA HomoloGene,Ensembl,Panther,Treefam,OrthoMCL,OrthoDB       
    ##  6 A4GALT       alpha4GT2        ENSG00000128274 FBgn0039378              53947            43124 alpha 1,4-galactosyltransferase (P blood group) CG5878 gene product from transcript CG5878-RB   HomoloGene,Ensembl,Panther,Treefam,EggNOG,OrthoDB         
    ##  7 A4GNT        alpha4GT2        ENSG00000118017 FBgn0039378              51146            43124 alpha-1,4-N-acetylglucosaminyltransferase       CG5878 gene product from transcript CG5878-RB   Inparanoid,Ensembl,Panther,Treefam,OrthoDB                
    ##  8 A4GNT        alpha4GT1        ENSG00000118017 FBgn0031491              51146            33512 alpha-1,4-N-acetylglucosaminyltransferase       CG17223 gene product from transcript CG17223-RA Ensembl,Panther,Treefam,OrthoDB                           
    ##  9 AAAS         CG16892          ENSG00000094914 FBgn0030122               8086            31881 aladin WD repeat nucleoporin                    CG16892 gene product from transcript CG16892-RB HomoloGene,Ensembl,Panther,Treefam,OrthoMCL,EggNOG,OrthoDB
    ## 10 AAAS         CG13137          ENSG00000094914 FBgn0032188               8086            34349 aladin WD repeat nucleoporin                    CG13137 gene product from transcript CG13137-RB Ensembl,Panther,Treefam,OrthoDB                           
    ## # ... with 58,120 more rows

``` r
horse
```

    ## # A tibble: 39,398 x 9
    ##    human_symbol horse_symbol human_ensembl   horse_ensembl      human_entrez horse_entrez human_name                                   horse_name                                             support                           
    ##    <chr>        <chr>        <chr>           <chr>                     <int>        <int> <chr>                                        <chr>                                                  <chr>                             
    ##  1 5S_rRNA      5S_rRNA      ENSG00000277488 ENSECAG00000025715           NA           NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]   5S ribosomal RNA [Source:RFAM;Acc:RF00001]             Ensembl                           
    ##  2 5_8S_rRNA    5_8S_rRNA    ENSG00000275877 ENSECAG00000025308           NA           NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002]           Ensembl                           
    ##  3 5_8S_rRNA    5_8S_rRNA    ENSG00000276871 ENSECAG00000025308           NA           NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002]           Ensembl                           
    ##  4 5_8S_rRNA    5_8S_rRNA    ENSG00000283274 ENSECAG00000025308           NA           NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002]           Ensembl                           
    ##  5 5_8S_rRNA    5_8S_rRNA    ENSG00000283291 ENSECAG00000025308           NA           NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002]           Ensembl                           
    ##  6 5_8S_rRNA    5_8S_rRNA    ENSG00000283568 ENSECAG00000025308           NA           NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002]           Ensembl                           
    ##  7 7SK          7SK          ENSG00000276626 ENSECAG00000027049           NA           NA 7SK RNA [Source:RFAM;Acc:RF00100]            7SK RNA [Source:RFAM;Acc:RF00100]                      Ensembl                           
    ##  8 7SK          7SK          ENSG00000271394 ENSECAG00000027013           NA           NA 7SK RNA [Source:RFAM;Acc:RF00100]            7SK RNA [Source:RFAM;Acc:RF00100]                      Ensembl                           
    ##  9 A1BG         A1BG         ENSG00000121410 ENSECAG00000015604            1           NA alpha-1-B glycoprotein                       alpha-1-B glycoprotein [Source:HGNC Symbol;Acc:HGNC:5] EggNOG,Ensembl,Treefam,OMA,OrthoDB
    ## 10 A1BG         A1BG         ENSG00000121410 <NA>                          1    100064369 alpha-1-B glycoprotein                       alpha-1-B glycoprotein                                 NCBI                              
    ## # ... with 39,388 more rows

``` r
macaque
```

    ## # A tibble: 37,694 x 9
    ##    human_symbol macaque_symbol human_ensembl   macaque_ensembl    human_entrez macaque_entrez human_name                                 macaque_name                                           support                                              
    ##    <chr>        <chr>          <chr>           <chr>                     <int>          <int> <chr>                                      <chr>                                                  <chr>                                                
    ##  1 5S_rRNA      5S_rRNA        ENSG00000277488 ENSMMUG00000025771           NA             NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001] 5S ribosomal RNA [Source:RFAM;Acc:RF00001]             Ensembl                                              
    ##  2 5S_rRNA      5S_rRNA        ENSG00000276861 ENSMMUG00000036246           NA             NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001] 5S ribosomal RNA [Source:RFAM;Acc:RF00001]             Ensembl                                              
    ##  3 7SK          7SK            ENSG00000274303 ENSMMUG00000037016           NA             NA 7SK RNA [Source:RFAM;Acc:RF00100]          7SK RNA [Source:RFAM;Acc:RF00100]                      Ensembl                                              
    ##  4 7SK          7SK            ENSG00000277313 ENSMMUG00000035917           NA             NA 7SK RNA [Source:RFAM;Acc:RF00100]          7SK RNA [Source:RFAM;Acc:RF00100]                      Ensembl                                              
    ##  5 7SK          7SK            ENSG00000275933 ENSMMUG00000035917           NA             NA 7SK RNA [Source:RFAM;Acc:RF00100]          7SK RNA [Source:RFAM;Acc:RF00100]                      Ensembl                                              
    ##  6 7SK          7SK            ENSG00000271394 ENSMMUG00000034723           NA             NA 7SK RNA [Source:RFAM;Acc:RF00100]          7SK RNA [Source:RFAM;Acc:RF00100]                      Ensembl                                              
    ##  7 7SK          7SK            ENSG00000276626 ENSMMUG00000045061           NA             NA 7SK RNA [Source:RFAM;Acc:RF00100]          7SK RNA [Source:RFAM;Acc:RF00100]                      Ensembl                                              
    ##  8 7SK          7SK            ENSG00000273591 ENSMMUG00000035917           NA             NA 7SK RNA [Source:RFAM;Acc:RF00100]          7SK RNA [Source:RFAM;Acc:RF00100]                      Ensembl                                              
    ##  9 A1BG         A1BG           ENSG00000121410 ENSMMUG00000012459            1             NA alpha-1-B glycoprotein                     alpha-1-B glycoprotein [Source:HGNC Symbol;Acc:HGNC:5] Inparanoid,Treefam,EggNOG,OMA,Ensembl,OrthoDB,Panther
    ## 10 A1BG         A1BG           ENSG00000121410 <NA>                          1         712737 alpha-1-B glycoprotein                     alpha-1-B glycoprotein                                 HomoloGene,NCBI                                      
    ## # ... with 37,684 more rows

``` r
mouse
```

    ## # A tibble: 53,386 x 9
    ##    human_symbol mouse_symbol human_ensembl   mouse_ensembl      human_entrez mouse_entrez human_name                                 mouse_name                                                            support                                                                                      
    ##    <chr>        <chr>        <chr>           <chr>                     <int>        <int> <chr>                                      <chr>                                                                 <chr>                                                                                        
    ##  1 5S_rRNA      Gm26157      ENSG00000277411 ENSMUSG00000089599           NA           NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001] predicted gene, 26157                                                 Ensembl                                                                                      
    ##  2 7SK          Gm26069      ENSG00000274303 ENSMUSG00000088122           NA           NA 7SK RNA [Source:RFAM;Acc:RF00100]          predicted gene, 26069                                                 Ensembl                                                                                      
    ##  3 A1BG         A1bg         ENSG00000121410 ENSMUSG00000022347            1       117586 alpha-1-B glycoprotein                     alpha-1-B glycoprotein                                                HomoloGene,PhylomeDB,Inparanoid,EggNOG,OrthoMCL,HGNC,NCBI,Ensembl,Treefam,OMA,Panther,OrthoDB
    ##  4 A1CF         A1cf         ENSG00000148584 ENSMUSG00000052595        29974        69865 APOBEC1 complementation factor             APOBEC1 complementation factor                                        Inparanoid,HomoloGene,EggNOG,HGNC,OrthoMCL,NCBI,OMA,Treefam,Ensembl,Panther,OrthoDB          
    ##  5 A2M          A2m          ENSG00000175899 ENSMUSG00000030111            2       232345 alpha-2-macroglobulin                      alpha-2-macroglobulin                                                 Inparanoid,HomoloGene,EggNOG,OrthoMCL,HGNC,Ensembl,OMA,Treefam,Panther,OrthoDB               
    ##  6 A2M          Mug2         ENSG00000175899 ENSMUSG00000030131            2        17837 alpha-2-macroglobulin                      murinoglobulin 2                                                      OrthoMCL,OrthoDB                                                                             
    ##  7 A2M          Mug1         ENSG00000175899 ENSMUSG00000059908            2        17836 alpha-2-macroglobulin                      murinoglobulin 1                                                      OrthoMCL,OrthoDB                                                                             
    ##  8 A2M          Slc16a6      ENSG00000175899 ENSMUSG00000041920            2       104681 alpha-2-macroglobulin                      solute carrier family 16 (monocarboxylic acid transporters), member 6 OrthoMCL                                                                                     
    ##  9 A2M          A2ml1        ENSG00000175899 ENSMUSG00000047228            2       232400 alpha-2-macroglobulin                      alpha-2-macroglobulin like 1                                          OrthoMCL                                                                                     
    ## 10 A2ML1        Slc16a6      ENSG00000166535 ENSMUSG00000041920       144568       104681 alpha-2-macroglobulin like 1               solute carrier family 16 (monocarboxylic acid transporters), member 6 OrthoMCL                                                                                     
    ## # ... with 53,376 more rows

``` r
opossum
```

    ## # A tibble: 55,902 x 9
    ##    human_symbol opossum_symbol human_ensembl   opossum_ensembl    human_entrez opossum_entrez human_name                                   opossum_name                                 support
    ##    <chr>        <chr>          <chr>           <chr>                     <int>          <int> <chr>                                        <chr>                                        <chr>  
    ##  1 5S_rRNA      5S_rRNA        ENSG00000277411 ENSMODG00000021809           NA             NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]   5S ribosomal RNA [Source:RFAM;Acc:RF00001]   Ensembl
    ##  2 5S_rRNA      5S_rRNA        ENSG00000277411 ENSMODG00000026541           NA             NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]   5S ribosomal RNA [Source:RFAM;Acc:RF00001]   Ensembl
    ##  3 5S_rRNA      5S_rRNA        ENSG00000277411 ENSMODG00000026855           NA             NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]   5S ribosomal RNA [Source:RFAM;Acc:RF00001]   Ensembl
    ##  4 5_8S_rRNA    5_8S_rRNA      ENSG00000275877 ENSMODG00000027248           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  5 5_8S_rRNA    5_8S_rRNA      ENSG00000283274 ENSMODG00000027248           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  6 5_8S_rRNA    5_8S_rRNA      ENSG00000283291 ENSMODG00000027248           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  7 5_8S_rRNA    5_8S_rRNA      ENSG00000276871 ENSMODG00000027248           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  8 5_8S_rRNA    5_8S_rRNA      ENSG00000283568 ENSMODG00000027248           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  9 7SK          7SK            ENSG00000271394 ENSMODG00000026997           NA             NA 7SK RNA [Source:RFAM;Acc:RF00100]            7SK RNA [Source:RFAM;Acc:RF00100]            Ensembl
    ## 10 A1BG         <NA>           ENSG00000121410 ENSMODG00000028671            1             NA alpha-1-B glycoprotein                       <NA>                                         Panther
    ## # ... with 55,892 more rows

``` r
pig
```

    ## # A tibble: 40,737 x 9
    ##    human_symbol pig_symbol human_ensembl   pig_ensembl        human_entrez pig_entrez human_name                                      pig_name                                        support                                                   
    ##    <chr>        <chr>      <chr>           <chr>                     <int>      <int> <chr>                                           <chr>                                           <chr>                                                     
    ##  1 5S_rRNA      5S_rRNA    ENSG00000277411 ENSSSCG00000018314           NA         NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]      5S ribosomal RNA [Source:RFAM;Acc:RF00001]      Ensembl                                                   
    ##  2 5S_rRNA      5S_rRNA    ENSG00000277488 ENSSSCG00000028125           NA         NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]      5S ribosomal RNA [Source:RFAM;Acc:RF00001]      Ensembl                                                   
    ##  3 5S_rRNA      5S_rRNA    ENSG00000276861 ENSSSCG00000018766           NA         NA 5S ribosomal RNA [Source:RFAM;Acc:RF00001]      5S ribosomal RNA [Source:RFAM;Acc:RF00001]      Ensembl                                                   
    ##  4 7SK          7SK        ENSG00000271394 ENSSSCG00000023458           NA         NA 7SK RNA [Source:RFAM;Acc:RF00100]               7SK RNA [Source:RFAM;Acc:RF00100]               Ensembl                                                   
    ##  5 A1BG         A1BG       ENSG00000121410 ENSSSCG00000004001            1  100516980 alpha-1-B glycoprotein                          alpha-1-B glycoprotein                          OMA,Treefam,EggNOG,OrthoDB,Ensembl,NCBI,Panther           
    ##  6 A1CF         A1CF       ENSG00000148584 ENSSSCG00000010431        29974  100155074 APOBEC1 complementation factor                  APOBEC1 complementation factor                  Inparanoid,OMA,Treefam,EggNOG,OrthoDB,Ensembl,NCBI,Panther
    ##  7 A2M          A2M        ENSG00000175899 ENSSSCG00000000660            2     403166 alpha-2-macroglobulin                           alpha-2-macroglobulin                           Inparanoid,OMA,Treefam,OrthoDB,Ensembl,Panther            
    ##  8 A2ML1        A2ML1      ENSG00000166535 ENSSSCG00000000664       144568  100152492 alpha-2-macroglobulin like 1                    alpha-2-macroglobulin like 1                    OMA,EggNOG,Treefam,OrthoDB,Ensembl,Panther,NCBI           
    ##  9 A3GALT2      A3GALT2    ENSG00000184389 ENSSSCG00000032224       127550  100739829 alpha 1,3-galactosyltransferase 2               alpha 1,3-galactosyltransferase 2               Ensembl,NCBI                                              
    ## 10 A4GALT       A4GALT     ENSG00000128274 ENSSSCG00000026962        53947  100524987 alpha 1,4-galactosyltransferase (P blood group) alpha 1,4-galactosyltransferase (P blood group) OMA,Treefam,EggNOG,OrthoDB,Ensembl,Panther,NCBI           
    ## # ... with 40,727 more rows

``` r
platypus
```

    ## # A tibble: 47,922 x 9
    ##    human_symbol platypus_symbol human_ensembl   platypus_ensembl   human_entrez platypus_entrez human_name                                   platypus_name                                support
    ##    <chr>        <chr>           <chr>           <chr>                     <int>           <int> <chr>                                        <chr>                                        <chr>  
    ##  1 5_8S_rRNA    5_8S_rRNA       ENSG00000275877 ENSOANG00000016277           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  2 5_8S_rRNA    5_8S_rRNA       ENSG00000275877 ENSOANG00000017683           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  3 5_8S_rRNA    5_8S_rRNA       ENSG00000275877 ENSOANG00000017716           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  4 5_8S_rRNA    5_8S_rRNA       ENSG00000275877 ENSOANG00000018364           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  5 5_8S_rRNA    5_8S_rRNA       ENSG00000275877 ENSOANG00000019149           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  6 5_8S_rRNA    5_8S_rRNA       ENSG00000283274 ENSOANG00000016277           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  7 5_8S_rRNA    5_8S_rRNA       ENSG00000283274 ENSOANG00000017683           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  8 5_8S_rRNA    5_8S_rRNA       ENSG00000283274 ENSOANG00000017716           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ##  9 5_8S_rRNA    5_8S_rRNA       ENSG00000283274 ENSOANG00000018364           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ## 10 5_8S_rRNA    5_8S_rRNA       ENSG00000283274 ENSOANG00000019149           NA              NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl
    ## # ... with 47,912 more rows

``` r
rat
```

    ## # A tibble: 48,085 x 9
    ##    human_symbol rat_symbol     human_ensembl   rat_ensembl        human_entrez rat_entrez human_name                                   rat_name                                     support                                                                            
    ##    <chr>        <chr>          <chr>           <chr>                     <int>      <int> <chr>                                        <chr>                                        <chr>                                                                              
    ##  1 5_8S_rRNA    5_8S_rRNA      ENSG00000275877 ENSRNOG00000053209           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
    ##  2 5_8S_rRNA    5_8S_rRNA      ENSG00000276871 ENSRNOG00000053209           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
    ##  3 5_8S_rRNA    5_8S_rRNA      ENSG00000283274 ENSRNOG00000053209           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
    ##  4 5_8S_rRNA    5_8S_rRNA      ENSG00000283291 ENSRNOG00000053209           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
    ##  5 5_8S_rRNA    5_8S_rRNA      ENSG00000283568 ENSRNOG00000053209           NA         NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
    ##  6 7SK          7SK            ENSG00000271394 ENSRNOG00000060433           NA         NA 7SK RNA [Source:RFAM;Acc:RF00100]            7SK RNA [Source:RFAM;Acc:RF00100]            Ensembl                                                                            
    ##  7 A1BG         A1bg           ENSG00000121410 ENSRNOG00000004692            1     140656 alpha-1-B glycoprotein                       alpha-1-B glycoprotein                       PhylomeDB,Inparanoid,Treefam,EggNOG,OrthoMCL,HomoloGene,OMA,Ensembl,Panther,OrthoDB
    ##  8 A1BG         AABR07058124.2 ENSG00000121410 ENSRNOG00000037549            1         NA alpha-1-B glycoprotein                       <NA>                                         Treefam,OMA,Ensembl,Panther,OrthoDB                                                
    ##  9 A1CF         A1cf           ENSG00000148584 ENSRNOG00000033195        29974     170912 APOBEC1 complementation factor               APOBEC1 complementation factor               Inparanoid,Treefam,EggNOG,HomoloGene,NCBI,OMA,Ensembl,Panther,OrthoDB              
    ## 10 A2M          A2m            ENSG00000175899 ENSRNOG00000028896            2      24153 alpha-2-macroglobulin                        alpha-2-macroglobulin                        PhylomeDB,Treefam,OrthoMCL,HomoloGene,Ensembl,Panther,OrthoDB                      
    ## # ... with 48,075 more rows

``` r
s.cerevisiae
```

    ## # A tibble: 10,844 x 9
    ##    human_symbol s.cerevisiae_symbol human_ensembl   s.cerevisiae_ensembl human_entrez s.cerevisiae_entrez human_name                              s.cerevisiae_name                                                                        support                              
    ##    <chr>        <chr>               <chr>           <chr>                       <int>               <int> <chr>                                   <chr>                                                                                    <chr>                                
    ##  1 AADAT        ARO8                ENSG00000109576 YGL202W                     51166              852672 aminoadipate aminotransferase           bifunctional 2-aminoadipate transaminase/aromatic-amino-acid:2-oxoglutarate transaminase Panther,Ensembl,EggNOG,OMA,Inparanoid
    ##  2 AADAT        ARO9                ENSG00000109576 YHR137W                     51166              856539 aminoadipate aminotransferase           aromatic-amino-acid:2-oxoglutarate transaminase                                          Ensembl,OMA,Panther                  
    ##  3 AAK1         AKL1                ENSG00000115977 YBR059C                     22848              852351 AP2 associated kinase 1                 serine/threonine protein kinase AKL1                                                     Panther,EggNOG,Ensembl               
    ##  4 AAK1         PRK1                ENSG00000115977 YIL095W                     22848              854713 AP2 associated kinase 1                 serine/threonine protein kinase PRK1                                                     Ensembl,Panther                      
    ##  5 AAK1         ARK1                ENSG00000115977 YNL020C                     22848              855711 AP2 associated kinase 1                 serine/threonine protein kinase ARK1                                                     Panther,Ensembl                      
    ##  6 AAK1         KIN2                ENSG00000115977 YLR096W                     22848              850785 AP2 associated kinase 1                 serine/threonine protein kinase KIN2                                                     OMA                                  
    ##  7 AAMP         SQT1                ENSG00000127837 YIR012W                        14              854829 angio associated migratory cell protein Sqt1p                                                                                    PhylomeDB,Ensembl,EggNOG,Panther     
    ##  8 AAMP         MDV1                ENSG00000127837 YJL112W                        14              853332 angio associated migratory cell protein Mdv1p                                                                                    Panther                              
    ##  9 AANAT        PAA1                ENSG00000129673 YDR071C                        15              851643 aralkylamine N-acetyltransferase        polyamine acetyltransferase                                                              Inparanoid,Panther                   
    ## 10 AAR2         AAR2                ENSG00000131043 YBL074C                     25980              852205 AAR2 splicing factor homolog            U5 snRNP complex subunit AAR2                                                            Inparanoid,Panther,OrthoMCL,PhylomeDB
    ## # ... with 10,834 more rows

``` r
xenopus
```

    ## # A tibble: 219,764 x 9
    ##    human_symbol xenopus_symbol human_ensembl   xenopus_ensembl    human_entrez xenopus_entrez human_name                                   xenopus_name                                 support                                                                
    ##    <chr>        <chr>          <chr>           <chr>                     <int>          <int> <chr>                                        <chr>                                        <chr>                                                                  
    ##  1 5_8S_rRNA    5_8S_rRNA      ENSG00000283274 ENSXETG00000029393           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
    ##  2 5_8S_rRNA    5_8S_rRNA      ENSG00000283291 ENSXETG00000029393           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
    ##  3 5_8S_rRNA    5_8S_rRNA      ENSG00000283568 ENSXETG00000029393           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
    ##  4 5_8S_rRNA    5_8S_rRNA      ENSG00000275877 ENSXETG00000029393           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
    ##  5 5_8S_rRNA    5_8S_rRNA      ENSG00000276871 ENSXETG00000029393           NA             NA 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
    ##  6 A1BG         vcam1          ENSG00000121410 ENSXETG00000013241            1      100488612 alpha-1-B glycoprotein                       vascular cell adhesion molecule 1            PhylomeDB                                                              
    ##  7 A1BG         xilr2          ENSG00000121410 ENSXETG00000032533            1      100496017 alpha-1-B glycoprotein                       Ig-like receptor 2                           Ensembl,Panther,OrthoDB                                                
    ##  8 A1BG         <NA>           ENSG00000121410 ENSXETG00000032068            1             NA alpha-1-B glycoprotein                       <NA>                                         Panther                                                                
    ##  9 A1BG         <NA>           ENSG00000121410 ENSXETG00000032630            1             NA alpha-1-B glycoprotein                       <NA>                                         Panther                                                                
    ## 10 A1CF         a1cf           ENSG00000148584 ENSXETG00000006611        29974      100493284 APOBEC1 complementation factor               APOBEC1 complementation factor               Inparanoid,HomoloGene,PhylomeDB,Ensembl,OMA,EggNOG,Treefam,NCBI,OrthoDB
    ## # ... with 219,754 more rows

``` r
zebrafish
```

    ## # A tibble: 115,166 x 9
    ##    human_symbol zebrafish_symbol   human_ensembl   zebrafish_ensembl  human_entrez zebrafish_entrez human_name                     zebrafish_name                 support                                                    
    ##    <chr>        <chr>              <chr>           <chr>                     <int>            <int> <chr>                          <chr>                          <chr>                                                      
    ##  1 A1BG         si:ch211-165f21.7  ENSG00000121410 ENSDARG00000093987            1        100320788 alpha-1-B glycoprotein         si:ch211-165f21.7              OrthoDB                                                    
    ##  2 A1BG         si:ch73-368j24.17  ENSG00000121410 ENSDARG00000058564            1               NA alpha-1-B glycoprotein         si:ch73-368j24.17              OrthoDB                                                    
    ##  3 A1CF         a1cf               ENSG00000148584 ENSDARG00000002968        29974           562916 APOBEC1 complementation factor apobec1 complementation factor Inparanoid,HomoloGene,Ensembl,OMA,NCBI,ZFIN,Panther,OrthoDB
    ##  4 A2M          sb:cb37            ENSG00000175899 ENSDARG00000041645            2        100006947 alpha-2-macroglobulin          sb:cb37                        HomoloGene,Treefam,OrthoMCL,OMA,Panther                    
    ##  5 A2M          a2ml               ENSG00000175899 ENSDARG00000056314            2        100006972 alpha-2-macroglobulin          alpha-2-macroglobulin-like     HomoloGene,Treefam,OrthoMCL,OMA,Panther                    
    ##  6 A2M          si:dkey-105h12.2   ENSG00000175899 ENSDARG00000041685            2        100006782 alpha-2-macroglobulin          si:dkey-105h12.2               HomoloGene,Treefam,OrthoMCL,OMA,Panther                    
    ##  7 A2M          zgc:165518         ENSG00000175899 ENSDARG00000075737            2        100101650 alpha-2-macroglobulin          zgc:165518                     HomoloGene,Treefam,OrthoMCL,Panther                        
    ##  8 A2M          si:ch211-212c13.10 ENSG00000175899 ENSDARG00000093199            2        100003785 alpha-2-macroglobulin          si:ch211-212c13.10             HomoloGene,Treefam,OMA,Panther                             
    ##  9 A2M          si:dkey-46g23.5    ENSG00000175899 ENSDARG00000008835            2           562067 alpha-2-macroglobulin          si:dkey-46g23.5                HomoloGene,Treefam,Panther                                 
    ## 10 A2M          zgc:165453         ENSG00000175899 ENSDARG00000078183            2           566238 alpha-2-macroglobulin          zgc:165453                     HomoloGene,Treefam,Panther                                 
    ## # ... with 115,156 more rows
