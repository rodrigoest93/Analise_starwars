#pacotes
library(tidyverse)

# base de dados
df <- rio::import("data/starwars.rds")

# análise do sexo do elenco
df %>%
  count(sex) %>%
    mutate(
      sex = forcats::fct_reorder(sex,n)
    ) %>%
    ggplot(aes(x = sex, y = n)) +
      geom_col(fill = "white", color = "dark blue", size = 1) +
        geom_label(aes(x = sex, y = n/2, label = scales::percent(n/sum(n), accuracy = .1)),
                   color = "white", fill = "dark blue") +
          labs(x = "Sexo do elenco", y = "Frequência") +
            theme_minimal()

# análise do genero (papel executado) do elenco
df %>%
  count(gender) %>%
    mutate(
      sex = forcats::fct_reorder(gender,n)
    ) %>%
      ggplot(aes(x = gender, y = n)) +
        geom_col(fill = "white", color = "dark blue", size = 1) +
          geom_label(aes(x = sex, y = n/2, label = scales::percent(n/sum(n), accuracy = .1)),
                     color = "white", fill = "dark blue") +
            labs(x = "Gênero do elenco", y = "Frequência") +
              theme_minimal()


# análise de altura x massa x genero
df %>%
  ggplot(aes(x = height, y = mass, color = gender)) +
    geom_point() +
        theme_minimal()

# análise de altura x massa x sex
df %>%
  ggplot(aes(x = height, y = mass, color = sex)) +
    geom_point() +
      theme_minimal()
library(dplyr)
# especies x sex
df %>%
#  filter(gender == "feminine") %>%
  count(gender, species) %>%
    mutate(
      species = forcats::fct_reorder(species, n)
    ) %>%
    ggplot(aes(x = species, y = n, fill = gender)) +
      geom_col() +
        theme_minimal() +
          coord_flip()


df %>%
  count(gender, species) %>%
    grafico_bar_cores(x = species, y = n, color = gender)


