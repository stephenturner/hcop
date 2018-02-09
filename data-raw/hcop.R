library(tidyverse)

# Function to construct the URL
make_url <- function(species) {
  paste0("ftp://ftp.ebi.ac.uk/pub/databases/genenames/hcop/",
         "human_",
         species,
         "_hcop_fifteen_column.txt.gz")
}
# test
# make_url("mouse")

# Read the data, select columns you care about, rename the columns
create_ortholog_tibble <- function(organism) {
  message(paste0("Working on ", organism, "..."))
  organism %>%
    make_url() %>%
    read_tsv(col_types = cols(), na="-") %>%
    select(ends_with("_symbol"), ends_with("ensembl_gene"), ends_with("entrez_gene") , ends_with("name"), support) %>%
    set_names(names(.) %>% gsub("_gene$", "", .) %>% gsub(" ", "_", .))
}
# test
# create_ortholog_tibble("anole_lizard")

# Which organisms do you want to use?
critters <- c("anole_lizard", "c.elegans", "chicken", "chimpanzee", "cow",
              "dog", "fruitfly", "horse", "macaque", "mouse", "opossum",
              "pig", "platypus", "rat", "s.cerevisiae", "xenopus", "zebrafish")

# Make a tibble for each, and set the names of the list to the names of the organisms above
hcop <- map(critters, create_ortholog_tibble) %>% set_names(critters)

# Expose the objects in the list to the global environment
attach(hcop)

# Use this to get the vector on the clipboard so you can paste it below in the devtools::use_data() section.
# paste(critters, collapse=", ") %>% clipr::write_clip()

# Save data in the package, and remove the original list objects
devtools::use_data(anole_lizard, c.elegans, chicken, chimpanzee, cow, dog, fruitfly, horse, macaque, mouse, opossum, pig, platypus, rat, s.cerevisiae, xenopus, zebrafish,
                   overwrite = TRUE, compress = "xz")

# Import the data as tibbles instead of regular data frames.
devtools::use_package("tibble")
