# grafico de dispersao

grafico_dispersao <- function(df, x, y, cores){
  ggplot2::ggplot(df,ggplot2::aes(x = {{x}}, y = {{y}}, color = {{cores}})) +
    ggplot2::geom_point() +
      ggplot2::theme_minimal()
}
