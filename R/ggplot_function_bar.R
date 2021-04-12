# funcao ggplot geom_col
grafico_barras <- function(df, x, y){
  ggplot2::ggplot(df,ggplot2::aes(x = {{x}}, y = {{y}})) +
    ggplot2::geom_col(fill = "white", color = "dark blue", size = 1) +
      ggplot2::geom_label(ggplot2::aes(x = {{x}}, y = {{y}}/2, label = scales::percent({{y}}/sum({{y}}), accuracy = .1)),
               color = "white", fill = "dark blue") +
        ggplot2::labs(y = "Frequência") +
          ggplot2::theme_minimal()
}
