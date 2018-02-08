---
output: 
  html_document: 
    keep_md: yes
---



# hcop:  HGNC Comparison of Orthology Predictions (HCOP)

Human ortholog data from HGNC Comparison of Orthology Predictions (HCOP). The HGNC Comparison of Orthology Predictions (HCOP) integrates and displays the orthology assertions predicted for a specified human gene, or set of human genes, by eggNOG, Ensembl Compara, HGNC, HomoloGene, Inparanoid, NCBI Gene Orthology, OMA, OrthoDB, OrthoMCL, Panther, PhylomeDB, TreeFam and ZFIN. An indication of the reliability of a prediction is provided by the number of databases which concur. This package only contains ortholog data to _C. elegans_, chicken, fruitfly, mouse, rat, xenopus, and zebrafish. Others are available at <https://www.genenames.org/cgi-bin/hcop> via ftp at <ftp://ftp.ebi.ac.uk/pub/databases/genenames/hcop/>.

See [data-raw/hcop.R](data-raw/hcop.R) for how this data was generated.

## Installation


```r
# install.packages("devtools")
devtools::install_github("stephenturner/hcop")
```

## Usage

Get the mouse orthologs of your favorite genes


```r
library(hcop)
library(dplyr)

my_favorite_human_genes <- data_frame(human_symbol=c("TP53", "TNF", "EGFR", "VEGFA", "APOE", 
                                                     "IL6", "TGFB1", "MTHFR", "ESR1", "AKT1"))
my_favorite_human_genes
```

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
```

```r
# Join to mouse orthologs
my_favorite_human_genes %>% 
  inner_join(mouse, by="human_symbol")
```

```
## # A tibble: 17 x 9
##    human_symbol mouse_symbol human_ensembl   mouse_ensembl      human_entrez mouse_entrez human_name                           mouse_name                           support                                                                                      
##    <chr>        <chr>        <chr>           <chr>              <chr>        <chr>        <chr>                                <chr>                                <chr>                                                                                        
##  1 TP53         Trp53        ENSG00000141510 ENSMUSG00000059552 7157         22059        tumor protein p53                    transformation related protein 53    Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB
##  2 TP53         Trp63        ENSG00000141510 ENSMUSG00000022510 7157         22061        tumor protein p53                    transformation related protein 63    OrthoDB                                                                                      
##  3 TP53         Trp73        ENSG00000141510 ENSMUSG00000029026 7157         22062        tumor protein p53                    transformation related protein 73    OrthoDB                                                                                      
##  4 TNF          Tnf          ENSG00000232810 ENSMUSG00000024401 7124         21926        tumor necrosis factor                tumor necrosis factor                Inparanoid,HomoloGene,Ensembl,PhylomeDB,OrthoMCL,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB       
##  5 EGFR         Egfr         ENSG00000146648 ENSMUSG00000020122 1956         13649        epidermal growth factor receptor     epidermal growth factor receptor     Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,Treefam,HGNC,Panther,OrthoDB
##  6 EGFR         Erbb4        ENSG00000146648 ENSMUSG00000062209 1956         13869        epidermal growth factor receptor     erb-b2 receptor tyrosine kinase 4    OrthoMCL                                                                                     
##  7 EGFR         Erbb2        ENSG00000146648 ENSMUSG00000062312 1956         13866        epidermal growth factor receptor     erb-b2 receptor tyrosine kinase 2    OrthoMCL                                                                                     
##  8 EGFR         Erbb3        ENSG00000146648 ENSMUSG00000018166 1956         13867        epidermal growth factor receptor     erb-b2 receptor tyrosine kinase 3    OrthoMCL                                                                                     
##  9 VEGFA        Vegfa        ENSG00000112715 ENSMUSG00000023951 7422         22339        vascular endothelial growth factor A vascular endothelial growth factor A Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB
## 10 APOE         Apoe         ENSG00000130203 ENSMUSG00000002985 348          11816        apolipoprotein E                     apolipoprotein E                     Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,Treefam,HGNC,Panther,OrthoDB
## 11 IL6          Il6          ENSG00000136244 ENSMUSG00000025746 3569         16193        interleukin 6                        interleukin 6                        Inparanoid,HomoloGene,EggNOG,Ensembl,PhylomeDB,NCBI,OMA,Treefam,HGNC,Panther,OrthoDB         
## 12 TGFB1        Tgfb1        ENSG00000105329 ENSMUSG00000002603 7040         21803        transforming growth factor beta 1    transforming growth factor, beta 1   Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB
## 13 MTHFR        Mthfr        ENSG00000177000 ENSMUSG00000029009 4524         17769        methylenetetrahydrofolate reductase  methylenetetrahydrofolate reductase  Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,OMA,NCBI,Treefam,HGNC,Panther,OrthoDB          
## 14 ESR1         Esr1         ENSG00000091831 ENSMUSG00000019768 2099         13982        estrogen receptor 1                  estrogen receptor 1 (alpha)          Inparanoid,HomoloGene,EggNOG,Ensembl,PhylomeDB,OrthoMCL,NCBI,OMA,Treefam,HGNC,Panther,OrthoDB
## 15 AKT1         Akt1         ENSG00000142208 ENSMUSG00000001729 207          11651        AKT serine/threonine kinase 1        thymoma viral proto-oncogene 1       Inparanoid,HomoloGene,EggNOG,Ensembl,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB                   
## 16 AKT1         Akt2         ENSG00000142208 ENSMUSG00000004056 207          11652        AKT serine/threonine kinase 1        thymoma viral proto-oncogene 2       OrthoMCL,OrthoDB                                                                             
## 17 AKT1         Akt3         ENSG00000142208 ENSMUSG00000019699 207          23797        AKT serine/threonine kinase 1        thymoma viral proto-oncogene 3       OrthoMCL,OrthoDB
```

```r
# Continue the above, but collapse all other columns down to unique entries
my_favorite_human_genes %>% 
  inner_join(mouse, by="human_symbol") %>% 
  group_by(human_symbol) %>% 
  summarize_all(funs(. %>% unique %>% paste(collapse=";")))
```

```
## # A tibble: 10 x 9
##    human_symbol mouse_symbol           human_ensembl   mouse_ensembl                                                               human_entrez mouse_entrez            human_name                           mouse_name                                                                                                                             support                                                                                               
##    <chr>        <chr>                  <chr>           <chr>                                                                       <chr>        <chr>                   <chr>                                <chr>                                                                                                                                  <chr>                                                                                                 
##  1 AKT1         Akt1;Akt2;Akt3         ENSG00000142208 ENSMUSG00000001729;ENSMUSG00000004056;ENSMUSG00000019699                    207          11651;11652;23797       AKT serine/threonine kinase 1        thymoma viral proto-oncogene 1;thymoma viral proto-oncogene 2;thymoma viral proto-oncogene 3                                           Inparanoid,HomoloGene,EggNOG,Ensembl,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB;OrthoMCL,OrthoDB           
##  2 APOE         Apoe                   ENSG00000130203 ENSMUSG00000002985                                                          348          11816                   apolipoprotein E                     apolipoprotein E                                                                                                                       Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,Treefam,HGNC,Panther,OrthoDB         
##  3 EGFR         Egfr;Erbb4;Erbb2;Erbb3 ENSG00000146648 ENSMUSG00000020122;ENSMUSG00000062209;ENSMUSG00000062312;ENSMUSG00000018166 1956         13649;13869;13866;13867 epidermal growth factor receptor     epidermal growth factor receptor;erb-b2 receptor tyrosine kinase 4;erb-b2 receptor tyrosine kinase 2;erb-b2 receptor tyrosine kinase 3 Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,Treefam,HGNC,Panther,OrthoDB;OrthoMCL
##  4 ESR1         Esr1                   ENSG00000091831 ENSMUSG00000019768                                                          2099         13982                   estrogen receptor 1                  estrogen receptor 1 (alpha)                                                                                                            Inparanoid,HomoloGene,EggNOG,Ensembl,PhylomeDB,OrthoMCL,NCBI,OMA,Treefam,HGNC,Panther,OrthoDB         
##  5 IL6          Il6                    ENSG00000136244 ENSMUSG00000025746                                                          3569         16193                   interleukin 6                        interleukin 6                                                                                                                          Inparanoid,HomoloGene,EggNOG,Ensembl,PhylomeDB,NCBI,OMA,Treefam,HGNC,Panther,OrthoDB                  
##  6 MTHFR        Mthfr                  ENSG00000177000 ENSMUSG00000029009                                                          4524         17769                   methylenetetrahydrofolate reductase  methylenetetrahydrofolate reductase                                                                                                    Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,OMA,NCBI,Treefam,HGNC,Panther,OrthoDB                   
##  7 TGFB1        Tgfb1                  ENSG00000105329 ENSMUSG00000002603                                                          7040         21803                   transforming growth factor beta 1    transforming growth factor, beta 1                                                                                                     Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB         
##  8 TNF          Tnf                    ENSG00000232810 ENSMUSG00000024401                                                          7124         21926                   tumor necrosis factor                tumor necrosis factor                                                                                                                  Inparanoid,HomoloGene,Ensembl,PhylomeDB,OrthoMCL,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB                
##  9 TP53         Trp53;Trp63;Trp73      ENSG00000141510 ENSMUSG00000059552;ENSMUSG00000022510;ENSMUSG00000029026                    7157         22059;22061;22062       tumor protein p53                    transformation related protein 53;transformation related protein 63;transformation related protein 73                                  Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB;OrthoDB 
## 10 VEGFA        Vegfa                  ENSG00000112715 ENSMUSG00000023951                                                          7422         22339                   vascular endothelial growth factor A vascular endothelial growth factor A                                                                                                   Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB
```


## All the data

This package only contains ortholog data to _C. elegans_, chicken, fruit fly, mouse, rat, _Xenopus_, and zebrafish. Others are available at <https://www.genenames.org/cgi-bin/hcop> via ftp at <ftp://ftp.ebi.ac.uk/pub/databases/genenames/hcop/>.


```r
c.elegans
```

```
## # A tibble: 65,161 x 9
##    human_symbol c.elegans_symbol human_ensembl   c.elegans_ensembl human_entrez c.elegans_entrez human_name                                      c.elegans_name                        support                                                             
##    <chr>        <chr>            <chr>           <chr>             <chr>        <chr>            <chr>                                           <chr>                                 <chr>                                                               
##  1 A1CF         hrp-2            ENSG00000148584 WBGene00002000    29974        173086           APOBEC1 complementation factor                  human HnRNP A1 homolog                Ensembl,OrthoDB                                                     
##  2 A2M          F13D2.1          ENSG00000175899 WBGene00008735    2            181305           alpha-2-macroglobulin                           hypothetical protein                  Panther                                                             
##  3 A2M          tep-1            ENSG00000175899 WBGene00013969    2            173367           alpha-2-macroglobulin                           TEP (ThiolEster containing Protein)   EggNOG                                                              
##  4 A2ML1        F13D2.1          ENSG00000166535 WBGene00008735    144568       181305           alpha-2-macroglobulin like 1                    hypothetical protein                  Panther                                                             
##  5 A4GALT       fbxb-7           ENSG00000128274 WBGene00012492    53947        189498           alpha 1,4-galactosyltransferase (P blood group) F-box B protein                       OrthoDB                                                             
##  6 A4GALT       Y20C6A.4         ENSG00000128274 WBGene00077495    53947        6418791          alpha 1,4-galactosyltransferase (P blood group) hypothetical protein                  OrthoDB                                                             
##  7 A4GNT        fbxb-7           ENSG00000118017 WBGene00012492    51146        189498           alpha-1,4-N-acetylglucosaminyltransferase       F-box B protein                       OrthoDB                                                             
##  8 A4GNT        Y20C6A.4         ENSG00000118017 WBGene00077495    51146        6418791          alpha-1,4-N-acetylglucosaminyltransferase       hypothetical protein                  OrthoDB                                                             
##  9 AACS         sur-5            ENSG00000081760 WBGene00006351    65985        180992           acetoacetyl-CoA synthetase                      Acetoacetyl-CoA synthetase            Inparanoid,HomoloGene,Ensembl,Panther,OrthoMCL,OMA,PhylomeDB,OrthoDB
## 10 AADAC        trcs-1           ENSG00000114771 WBGene00009186    13           177791           arylacetamide deacetylase                       TRansport of membrane to Cell Surface Ensembl,OMA,Panther,OrthoDB                                         
## # ... with 65,151 more rows
```

```r
chicken
```

```
## # A tibble: 46,418 x 9
##    human_symbol chicken_symbol human_ensembl   chicken_ensembl    human_entrez chicken_entrez human_name                                 chicken_name                                                              support        
##    <chr>        <chr>          <chr>           <chr>              <chr>        <chr>          <chr>                                      <chr>                                                                     <chr>          
##  1 5S_rRNA      5S_rRNA        ENSG00000277411 ENSGALG00000025601 <NA>         <NA>           5S ribosomal RNA [Source:RFAM;Acc:RF00001] 5S ribosomal RNA [Source:RFAM;Acc:RF00001]                                Ensembl        
##  2 A1BG         IGSF1L3        ENSG00000121410 ENSGALG00000030005 1            419114         alpha-1-B glycoprotein                     immunoglobulin superfamily member 1-like 3                                Ensembl,Panther
##  3 A1BG         TARM1L2        ENSG00000121410 ENSGALG00000045445 1            100859620      alpha-1-B glycoprotein                     T-cell-interacting, activating receptor on myeloid cells protein 1-like 2 Panther        
##  4 A1BG         IGSF1L7        ENSG00000121410 ENSGALG00000044267 1            100859075      alpha-1-B glycoprotein                     immunoglobulin superfamily member 1-like 7                                Panther        
##  5 A1BG         LILRB5L2       ENSG00000121410 ENSGALG00000031101 1            100858656      alpha-1-B glycoprotein                     leukocyte immunoglobulin-like receptor subfamily B member 5-like 2        Panther        
##  6 A1BG         LOC100858456   ENSG00000121410 ENSGALG00000034976 1            100858456      alpha-1-B glycoprotein                     osteoclast-associated immunoglobulin-like receptor-like                   Panther        
##  7 A1BG         LOC100858385   ENSG00000121410 ENSGALG00000033729 1            100858385      alpha-1-B glycoprotein                     platelet glycoprotein VI-like                                             Panther        
##  8 A1BG         CHIR-AB-852    ENSG00000121410 ENSGALG00000043432 1            100858369      alpha-1-B glycoprotein                     immunoglobulin-like receptor CHIR-AB-852                                  Panther        
##  9 A1BG         IGSF1L6        ENSG00000121410 ENSGALG00000045813 1            100858226      alpha-1-B glycoprotein                     immunoglobulin superfamily member 1-like 6                                Panther        
## 10 A1BG         PLTGP6L1       ENSG00000121410 ENSGALG00000046342 1            100857809      alpha-1-B glycoprotein                     platelet glycoprotein VI-like 1                                           Panther        
## # ... with 46,408 more rows
```

```r
fruitfly
```

```
## # A tibble: 58,130 x 9
##    human_symbol `fruit fly_symbol` human_ensembl   `fruit fly_ensembl` human_entrez `fruit fly_entrez` human_name                                      `fruit fly_name`                                support                                                   
##    <chr>        <chr>              <chr>           <chr>               <chr>        <chr>              <chr>                                           <chr>                                           <chr>                                                     
##  1 A1CF         Syp                ENSG00000148584 FBgn0038826         29974        42460              APOBEC1 complementation factor                  Syncrip                                         Ensembl,OrthoDB                                           
##  2 A2M          Tep3               ENSG00000175899 FBgn0041181         2            34045              alpha-2-macroglobulin                           Thioester-containing protein 3                  EggNOG                                                    
##  3 A2M          Mcr                ENSG00000175899 FBgn0267488         2            44071              alpha-2-macroglobulin                           Macroglobulin complement-related                Ensembl                                                   
##  4 A2ML1        Mcr                ENSG00000166535 FBgn0267488         144568       44071              alpha-2-macroglobulin like 1                    Macroglobulin complement-related                Ensembl                                                   
##  5 A4GALT       alpha4GT1          ENSG00000128274 FBgn0031491         53947        33512              alpha 1,4-galactosyltransferase (P blood group) CG17223 gene product from transcript CG17223-RA HomoloGene,Ensembl,Panther,OrthoMCL,Treefam,OrthoDB       
##  6 A4GALT       alpha4GT2          ENSG00000128274 FBgn0039378         53947        43124              alpha 1,4-galactosyltransferase (P blood group) CG5878 gene product from transcript CG5878-RB   HomoloGene,Ensembl,Panther,EggNOG,Treefam,OrthoDB         
##  7 A4GNT        alpha4GT2          ENSG00000118017 FBgn0039378         51146        43124              alpha-1,4-N-acetylglucosaminyltransferase       CG5878 gene product from transcript CG5878-RB   Inparanoid,Ensembl,Panther,Treefam,OrthoDB                
##  8 A4GNT        alpha4GT1          ENSG00000118017 FBgn0031491         51146        33512              alpha-1,4-N-acetylglucosaminyltransferase       CG17223 gene product from transcript CG17223-RA Ensembl,Panther,Treefam,OrthoDB                           
##  9 AAAS         CG16892            ENSG00000094914 FBgn0030122         8086         31881              aladin WD repeat nucleoporin                    CG16892 gene product from transcript CG16892-RB HomoloGene,Ensembl,OrthoMCL,Panther,EggNOG,Treefam,OrthoDB
## 10 AAAS         CG13137            ENSG00000094914 FBgn0032188         8086         34349              aladin WD repeat nucleoporin                    CG13137 gene product from transcript CG13137-RB Ensembl,Panther,Treefam,OrthoDB                           
## # ... with 58,120 more rows
```

```r
mouse
```

```
## # A tibble: 53,390 x 9
##    human_symbol mouse_symbol human_ensembl   mouse_ensembl      human_entrez mouse_entrez human_name                                 mouse_name                                                            support                                                                                      
##    <chr>        <chr>        <chr>           <chr>              <chr>        <chr>        <chr>                                      <chr>                                                                 <chr>                                                                                        
##  1 5S_rRNA      Gm26157      ENSG00000277411 ENSMUSG00000089599 <NA>         <NA>         5S ribosomal RNA [Source:RFAM;Acc:RF00001] predicted gene, 26157                                                 Ensembl                                                                                      
##  2 7SK          Gm26069      ENSG00000274303 ENSMUSG00000088122 <NA>         <NA>         7SK RNA [Source:RFAM;Acc:RF00100]          predicted gene, 26069                                                 Ensembl                                                                                      
##  3 A1BG         A1bg         ENSG00000121410 ENSMUSG00000022347 1            117586       alpha-1-B glycoprotein                     alpha-1-B glycoprotein                                                Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,PhylomeDB,NCBI,OMA,HGNC,Treefam,Panther,OrthoDB
##  4 A1CF         A1cf         ENSG00000148584 ENSMUSG00000052595 29974        69865        APOBEC1 complementation factor             APOBEC1 complementation factor                                        Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,OMA,NCBI,HGNC,Treefam,Panther,OrthoDB          
##  5 A2M          A2m          ENSG00000175899 ENSMUSG00000030111 2            232345       alpha-2-macroglobulin                      alpha-2-macroglobulin                                                 Inparanoid,HomoloGene,EggNOG,Ensembl,OrthoMCL,OMA,HGNC,Panther,Treefam,OrthoDB               
##  6 A2M          Mug2         ENSG00000175899 ENSMUSG00000030131 2            17837        alpha-2-macroglobulin                      murinoglobulin 2                                                      OrthoMCL,OrthoDB                                                                             
##  7 A2M          Mug1         ENSG00000175899 ENSMUSG00000059908 2            17836        alpha-2-macroglobulin                      murinoglobulin 1                                                      OrthoMCL,OrthoDB                                                                             
##  8 A2M          Slc16a6      ENSG00000175899 ENSMUSG00000041920 2            104681       alpha-2-macroglobulin                      solute carrier family 16 (monocarboxylic acid transporters), member 6 OrthoMCL                                                                                     
##  9 A2M          A2ml1        ENSG00000175899 ENSMUSG00000047228 2            232400       alpha-2-macroglobulin                      alpha-2-macroglobulin like 1                                          OrthoMCL                                                                                     
## 10 A2ML1        Slc16a6      ENSG00000166535 ENSMUSG00000041920 144568       104681       alpha-2-macroglobulin like 1               solute carrier family 16 (monocarboxylic acid transporters), member 6 OrthoMCL                                                                                     
## # ... with 53,380 more rows
```

```r
rat
```

```
## # A tibble: 48,095 x 9
##    human_symbol rat_symbol     human_ensembl   rat_ensembl        human_entrez rat_entrez human_name                                   rat_name                                     support                                                                            
##    <chr>        <chr>          <chr>           <chr>              <chr>        <chr>      <chr>                                        <chr>                                        <chr>                                                                              
##  1 5_8S_rRNA    5_8S_rRNA      ENSG00000276871 ENSRNOG00000053209 <NA>         <NA>       5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
##  2 5_8S_rRNA    5_8S_rRNA      ENSG00000283568 ENSRNOG00000053209 <NA>         <NA>       5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
##  3 5_8S_rRNA    5_8S_rRNA      ENSG00000283274 ENSRNOG00000053209 <NA>         <NA>       5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
##  4 5_8S_rRNA    5_8S_rRNA      ENSG00000283291 ENSRNOG00000053209 <NA>         <NA>       5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
##  5 5_8S_rRNA    5_8S_rRNA      ENSG00000275877 ENSRNOG00000053209 <NA>         <NA>       5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                            
##  6 7SK          7SK            ENSG00000271394 ENSRNOG00000060433 <NA>         <NA>       7SK RNA [Source:RFAM;Acc:RF00100]            7SK RNA [Source:RFAM;Acc:RF00100]            Ensembl                                                                            
##  7 A1BG         A1bg           ENSG00000121410 ENSRNOG00000004692 1            140656     alpha-1-B glycoprotein                       alpha-1-B glycoprotein                       Inparanoid,OrthoMCL,Treefam,PhylomeDB,EggNOG,HomoloGene,Ensembl,OMA,Panther,OrthoDB
##  8 A1BG         AABR07058124.2 ENSG00000121410 ENSRNOG00000037549 1            <NA>       alpha-1-B glycoprotein                       <NA>                                         Treefam,Ensembl,OMA,Panther,OrthoDB                                                
##  9 A1CF         A1cf           ENSG00000148584 ENSRNOG00000033195 29974        170912     APOBEC1 complementation factor               APOBEC1 complementation factor               Inparanoid,Treefam,EggNOG,HomoloGene,OMA,Ensembl,NCBI,Panther,OrthoDB              
## 10 A2M          A2m            ENSG00000175899 ENSRNOG00000028896 2            24153      alpha-2-macroglobulin                        alpha-2-macroglobulin                        OrthoMCL,Treefam,PhylomeDB,HomoloGene,Ensembl,Panther,OrthoDB                      
## # ... with 48,085 more rows
```

```r
xenopus
```

```
## # A tibble: 219,643 x 9
##    human_symbol xenopus_symbol human_ensembl   xenopus_ensembl    human_entrez xenopus_entrez human_name                                   xenopus_name                                 support                                                                
##    <chr>        <chr>          <chr>           <chr>              <chr>        <chr>          <chr>                                        <chr>                                        <chr>                                                                  
##  1 5_8S_rRNA    5_8S_rRNA      ENSG00000276871 ENSXETG00000029393 <NA>         <NA>           5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
##  2 5_8S_rRNA    5_8S_rRNA      ENSG00000283274 ENSXETG00000029393 <NA>         <NA>           5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
##  3 5_8S_rRNA    5_8S_rRNA      ENSG00000283291 ENSXETG00000029393 <NA>         <NA>           5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
##  4 5_8S_rRNA    5_8S_rRNA      ENSG00000283568 ENSXETG00000029393 <NA>         <NA>           5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
##  5 5_8S_rRNA    5_8S_rRNA      ENSG00000275877 ENSXETG00000029393 <NA>         <NA>           5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] 5.8S ribosomal RNA [Source:RFAM;Acc:RF00002] Ensembl                                                                
##  6 A1BG         vcam1          ENSG00000121410 ENSXETG00000013241 1            100488612      alpha-1-B glycoprotein                       vascular cell adhesion molecule 1            PhylomeDB                                                              
##  7 A1BG         xilr2          ENSG00000121410 ENSXETG00000032533 1            100496017      alpha-1-B glycoprotein                       Ig-like receptor 2                           Ensembl,Panther,OrthoDB                                                
##  8 A1BG         <NA>           ENSG00000121410 ENSXETG00000032068 1            <NA>           alpha-1-B glycoprotein                       <NA>                                         Panther                                                                
##  9 A1BG         <NA>           ENSG00000121410 ENSXETG00000032630 1            <NA>           alpha-1-B glycoprotein                       <NA>                                         Panther                                                                
## 10 A1CF         a1cf           ENSG00000148584 ENSXETG00000006611 29974        100493284      APOBEC1 complementation factor               APOBEC1 complementation factor               Inparanoid,HomoloGene,PhylomeDB,Ensembl,OMA,EggNOG,Treefam,NCBI,OrthoDB
## # ... with 219,633 more rows
```

```r
zebrafish
```

```
## # A tibble: 115,155 x 9
##    human_symbol zebrafish_symbol   human_ensembl   zebrafish_ensembl  human_entrez zebrafish_entrez human_name                     zebrafish_name                 support                                                    
##    <chr>        <chr>              <chr>           <chr>              <chr>        <chr>            <chr>                          <chr>                          <chr>                                                      
##  1 A1BG         si:ch211-165f21.7  ENSG00000121410 ENSDARG00000093987 1            100320788        alpha-1-B glycoprotein         si:ch211-165f21.7              OrthoDB                                                    
##  2 A1BG         si:ch73-368j24.17  ENSG00000121410 ENSDARG00000058564 1            <NA>             alpha-1-B glycoprotein         si:ch73-368j24.17              OrthoDB                                                    
##  3 A1CF         a1cf               ENSG00000148584 ENSDARG00000002968 29974        562916           APOBEC1 complementation factor apobec1 complementation factor Inparanoid,HomoloGene,Ensembl,NCBI,OMA,ZFIN,Panther,OrthoDB
##  4 A2M          sb:cb37            ENSG00000175899 ENSDARG00000041645 2            100006947        alpha-2-macroglobulin          sb:cb37                        HomoloGene,OrthoMCL,Treefam,OMA,Panther                    
##  5 A2M          a2ml               ENSG00000175899 ENSDARG00000056314 2            100006972        alpha-2-macroglobulin          alpha-2-macroglobulin-like     HomoloGene,OrthoMCL,Treefam,OMA,Panther                    
##  6 A2M          si:dkey-105h12.2   ENSG00000175899 ENSDARG00000041685 2            100006782        alpha-2-macroglobulin          si:dkey-105h12.2               HomoloGene,OrthoMCL,Treefam,OMA,Panther                    
##  7 A2M          zgc:165518         ENSG00000175899 ENSDARG00000075737 2            100101650        alpha-2-macroglobulin          zgc:165518                     HomoloGene,OrthoMCL,Treefam,Panther                        
##  8 A2M          si:ch211-212c13.10 ENSG00000175899 ENSDARG00000093199 2            100003785        alpha-2-macroglobulin          si:ch211-212c13.10             HomoloGene,Treefam,OMA,Panther                             
##  9 A2M          si:dkey-46g23.5    ENSG00000175899 ENSDARG00000008835 2            562067           alpha-2-macroglobulin          si:dkey-46g23.5                HomoloGene,Treefam,Panther                                 
## 10 A2M          zgc:165453         ENSG00000175899 ENSDARG00000078183 2            566238           alpha-2-macroglobulin          zgc:165453                     HomoloGene,Treefam,Panther                                 
## # ... with 115,145 more rows
```
