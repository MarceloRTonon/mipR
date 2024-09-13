library(tidyverse)
library(scales)
library(rlang)
library(viridis)
numVar <- 5

weight_polarsDec <-function(numVar=5){
  k_polarA <- 0:(numVar-1)
  k_polarB <- rev(k_polarA)
  siegel_formula <- function(N, k){ factorial(N-1-k)*factorial(k)/factorial(N)}
  siegel_formula(numVar, k_polarA)+siegel_formula(numVar, k_polarB)
  
}


amostraVars <- 2:13
amostraPesos <- amostraVars |> as.list() |> purrr::map(weight_polarsDec)


indicesNormalizados <- amostraVars |> purrr::map(~ (1:.x)-(.x/2)) |> map(scales::rescale, to = c(-1,1))


amostraDF <- map2(amostraPesos,
                  indicesNormalizados,
                  ~ tibble(dist_centro=.y, ProporcaoTotal = .x)) |>
  map2_dfr(as.list(amostraVars), ~ mutate(.x, NumFact = paste0(.y, " Factors"))) 
           


amostraDF |> ggplot(aes(x = dist_centro, y = ProporcaoTotal, group= NumFact, color = NumFact)) +
  geom_line()



                    