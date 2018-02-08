library(tidyverse)

make_url <- function(species) {
  paste0("ftp://ftp.ebi.ac.uk/pub/databases/genenames/hcop/",
         "human_",
         species,
         "_hcop_fifteen_column.txt.gz")
}
# make_url("mouse")

create_ortholog_tibble <- function(organism) {
  message(paste0("Working on ", organism, "..."))
  organism %>%
    make_url() %>%
    read_tsv(col_types = cols()) %>%
    select(ends_with("_symbol"), ends_with("ensembl_gene"), ends_with("entrez_gene") , ends_with("name"), support) %>%
    mutate_all(~na_if(., "-")) %>%
    set_names(~gsub("_gene$", "", .))
}
create_ortholog_tibble("mouse")

critters <- c("chicken", "fruitfly", "mouse", "rat", "xenopus", "zebrafish")

hcop <- map(critters, create_ortholog_tibble) %>% set_names(critters)

attach(hcop)
# paste(critters, collapse=", ")

# Save data in the package, and remove the original list objects
devtools::use_data(chicken, fruitfly, mouse, rat, xenopus, zebrafish, overwrite=TRUE, compress='xz')
devtools::use_package("tibble")
