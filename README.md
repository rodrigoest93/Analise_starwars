---
title: "Análise Starwars"
author: "Rodrigo Almeida Figueira"
date: "4/9/2021"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
`%>%` <- magrittr::`%>%`
```

## Motivação
Exercício da aula 1 do curso de R para Ciência de Dados II, ministrado pela [Curso-R](https://curso-r.com/).

## Objetivo
Os dados originais, do SWAPI, a API [Star Wars](https://swapi.dev/) , foram revisados para **refletir pesquisas adicionais sobre as determinações de gênero e sexo dos personagens.**

## Base de dados Starwars

A base está contida no pacote `dplyr` e possui 87 linhas e 14 variáveis, mas já vamos carregála em formato RDS após alguns tratamentos feitos(retirada de missings das variáveis gênero e sexo). Com isso temos:
```{r, echo=TRUE, fig.align='center'}
# para acesso à base original `dplyr::starwars`

df <- rio::import("../data/starwars.rds")

skimr::skim(df) %>% knitr::kable()

```

## Análise

Para esta análise, vamos gerar gráficos que indiquem a quantidade de indivíduos por gênero e por sexo. Para isso, vamos carregar as funções que fizemos do `ggplot`.

```{r, echo=TRUE, fig.align='center'}
source("../R/ggplot_function_bar.R")

df %>%
  dplyr::count(sex) %>%
    dplyr::mutate(
      sex = forcats::fct_reorder(sex,n)
    ) %>%
      grafico_barras(x = sex, y = n)
  
```

Neste primeiro gráfico podemos perceber que o sexo masculino é predominante entre os personagens do elenco de Starwars, tendo mais de 70% de represetatividade. 

Vamos agora olhar o gênero destes personagens.
```{r, echo=TRUE, fig.align='center'}
df %>%
  dplyr::count(gender) %>%
    dplyr::mutate(
      sex = forcats::fct_reorder(gender,n)
    ) %>%
      grafico_barras(x = gender, y = n)
  
```

Agora nós podemos notar que a grande maioria dos personagens pertencem ao gênero masculino, quase 80%.

Vamos agora cruzar as espécies dos personagens com o gênero dos mesmos utilizando uma função feita no `ggplot` para representar esta situação:
```{r, echo=TRUE, fig.align='center'}
source("../R/grafico_bar_cores.R")
df %>%
  dplyr::count(gender, species) %>%
    dplyr::mutate(
      species = forcats::fct_reorder(species, n)
    ) %>%
      grafico_bar_cores(x = species, y = n, color = gender)
  
```

Neste gráfico, notamos que possúimos `r length(unique(df$species))` espécies, sendo que apenas 8 espécies (`r scales::percent(8/length(unique(df$species)), accuracy =.1)`) possuem representates do gênero feminino. O destaque fica para a espécie *Human* (Humana), que, além de ser a mais populosa, é onde o gênero feminino possui maior quantidade bruta de representantes. Já na espécie *Mirialan*, só existem personagens do gênero feminino, sendo a única espécie onde esta situação ocore. Para o gênero contrário (Masculino), isso ocorre 29 vezes (`r scales::percent(29/length(unique(df$species)), accuracy =.1)`).

Uma análise adicional é a de comparação do tamanho do personagem (contando altura e peso) em relação ao gênero dos mesmos. Podemos fazer isso também para o sexo, vendo como se comporta. Para isso, vamos carregar a função do `ggplot` que nos mostra um gráfico de dispersão por quebras selecionadas (neste caso o gênero e o sexo):

```{r, echo=TRUE, fig.align='center', warning=FALSE}
source("../R/ggplot_function_disp.R")
df %>%
  grafico_dispersao(x = height, y = mass, cores = gender)
  
```

Neste gráfico podemos perceber que o gênero masculino possui dimensões de altura e peso maiores que o gênero feminino. Vamos observar por sexo agora:

```{r, echo=TRUE, fig.align='center', warning=FALSE}
df %>%
  grafico_dispersao(x = height, y = mass, cores = sex)
  
```

Agora podemos notar que aquele que possui maior dimensões é um ser hermafrodita, mas ainda sim, o sexo masculino possui, em sua maioria, dimensões maiores que a dos outros sexos.

## Conclusão

No filme Starwars, nota-se que há uma grande representatividade masculina, tanto para gênero quanto para sexo. Além disso, a maioria das espécies dos personagens possuem papel masculino e dimensões de peso e altura maiores para este gênero também. Numa próxima edição, seria bom trabalhar a representattividade de gênero para que o filme, além de ser um clássico das telas, traga um conteúdo social junto a toda esta fama!



