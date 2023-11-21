suppressPackageStartupMessages(library(tidyverse))
library(tidycensus)

census_api_key("da557ef1d7d0ede373f596a8aeabff2328a9a19", install = TRUE)

#see variable
v2020 <- load_variables(2020, "acs5", cache = TRUE)
View(v2020)
