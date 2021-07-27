frib_fun <- function(x){
  frib <- c(1,1)
  for(i in 3:x){
    frib[i] <- frib[i-1]+frib[i-2]    
  }
 frib[x]
}

recurse_fibonacci <- function(n) {
  if(n <= 1) {
    return(n)
  } else {
    return(recurse_fibonacci(n-1) + recurse_fibonacci(n-2))
  }
}

redu_fib <- function(n) reduce(rep(0, n-2),
                function(x,y)  c(x, x[length(x) - 1] + x[length(x)]),
                .init = c(1, 1))[n]

tic()
recurse_fibonacci(20)
toc()

tic()
frib_fun(20)
toc()

tic()
redu_fib(20)
toc()