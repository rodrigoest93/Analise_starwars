# funcao ggplot geom_col com quebras de cores
grafico_bar_cores <- function(df, x, y, color){
  ggplot2::ggplot(df,ggplot2::aes(x = {{x}}, y = {{y}}, fill = {{color}})) +
    ggplot2::geom_col() +
    ggplot2::labs(y = "Frequência") +
    ggplot2::theme_minimal() +
    ggplot2::coord_flip()
}
