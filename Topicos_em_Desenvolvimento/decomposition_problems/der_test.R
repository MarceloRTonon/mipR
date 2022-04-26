der_test <- function(a,b){
  x <- a*b
  dx <- x[2]-x[1]
  da <- a[2]-a[1]
  db <- b[2]-b[1]
  return(list("origin" = list("a" = a,
                       "b" = b,
                       "x" = x),
       "dx" = list("dx" = dx,
                   "dxda" = da*b[1],
                   "dxdb" = db*a[1],
                   "ddxdadb" = db*da,
                   "check" = dx==(da*b[1]+db*a[1]+(db*da))),
       "isTimeReversal" = (da*b[1]/da*b[2]),
       "checkReversal" = -dx==(-da*b[2]-db*a[2]+(db*da))
       ))
}

