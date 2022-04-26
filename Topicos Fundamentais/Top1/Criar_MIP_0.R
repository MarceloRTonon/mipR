Criar_MIP_0 <- function(setores, seed = 1){
  require(magrittr)
  
  set.seed(seed)
  
  # Criando as três básicas
  f_d <- runif(setores, min = 1, max =10) %>%
    matrix(nrow = setores, ncol =1)
  
  U_d <- runif(setores^2, min=1, max =10) %>%
    matrix(nrow=setores, ncol = setores)
  
  x <- rowSums(U_d) + f_d
  
  # Criando A_d
  
  A_d <- U_d%*%diag(1/c(x))
  # Porque eu usei c(x) ali em cima? Faça o exercicio 7 do top 1 para entender!
  
  # Vamos fazer um teste para ver se A_d gera U_d
  testeA_d <- all.equal(A_d %*% diag(c(x)), U_d)
  if(!isTRUE(testeA_d)) stop("A_d não está gerando U_d quando multiplicada por diag(c(x))!")
  # Se o teste não der verdadeiro a função parará e retornará um erro!
  
  # Precisamos testar se [I-A_d] é não singular. Como fazemos?
  
  Leon_Inv <- solve(diag(setores)-A_d)
  
  listaMIP <- list(f_d = f_d,
                   U_d = U_d,
                   x = x,
                   Leon_Inv = Leon_Inv,
                   A_d = A_d)
  
  return(listaMIP)
}
