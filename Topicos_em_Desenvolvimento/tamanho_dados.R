library(purrr)

checkSizeDifference <- function(nsize, benchmark = "lgl"){
  asTypes <- list("lgl" = "as.logical",
                  "int" = "as.integer",
                  "dbl" = "as.double")

  nsample <- sample(c(T,F), nsize^2, replace=T)
  
 TypeSizes <-  asTypes %>%
    map(function(x) call(x, nsample)) %>%
    map(eval) %>%
    map(matrix, nrow =nsize, ncol =nsize) %>%
    map(object.size)
 
 map(TypeSizes,
     function(x) list("abs" = format(x, units="auto"),
                       "relative" = as.double(x)/as.double(TypeSizes[[1]]))
 )
}

checkSizeDifference(nsize = 1000)  
