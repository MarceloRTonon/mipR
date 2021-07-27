library(magrittr)

bin

cLogical <- c(TRUE, FALSE) %>%
  rep( 1000) %>%
  matrix(ncol=10)

cDouble <- rep(c(1,0), 1000) %>%
  matrix(ncol =10)

cInteger <- rep(c(1L, 0L, 1000))
