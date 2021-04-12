library(tidyverse)

df <- starwars


skimr::skim(df) %>% View()

df %>%
  count(sex)

df %>%
  count(gender)

df <- df %>%
  filter(!is.na(sex) & !is.na(gender))

saveRDS(df, "data/starwars.rds")
