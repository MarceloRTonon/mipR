library(magrittr)
library(purrr)
a <- 1:10

sum(a)

map2(matrix1, matrix2, `%*%`)
map2(matrix1, matrix2, function(x,y) `%*%`(x,y))

sum(solve(matrix1 %*% matrix2))

matrix1 %*% solve(matrix2)


`%*%`(matrix1, matrix2 %>% solve)



(matrix1 %*% matrix2) %>% solve %>% sum

a <- 2

som_ex <- function(x) {
  a <-3
  sum(x)*2*a
  }

sum(1:3)*2*a

sum(a)*2*3
som_ex(a)

map2(matrix1, matrix2, 
     function(x,y) {
       `%*%`(x,y) %>%
         solve %>%
         sum}
     )

map2(matrix1, matrix2, function(x,y) `%*%`(x,y))

map2(matrix1, matrix2, %*%)
map2(matrix1, matrix2, function(x,y) %*%(x,y))


a %>% f1

`%>%`(a, f1)

"%>2%" <- function(x, .f(...)) .f(x, ...)

a %>2% sum
a %>% sum


a %>%
  map(`*`, 1:4)

`*` %>% typeof

`*` %>%
  map(a,  1:4)

map(.x= `*`, .f = a, 1:4)

`*` %>%
map(.x =a,  1:4)

`[` %>% typeof

a[-c(1:3)]


`[`(a, -c(1:3))

a %>% `[`(-c(1:3))


b <- matrix(1:4, nrow=2)
b[,2]

a %>% `*`(2) %>% `[`(2)

a %>%
  `*`(2) %>%
  .[2]

a %>%
  .*2)


a %>%
  `*`(.,2)

a %>% `*`(2) %>% function(x) x[2]



map(x, ~ .x)
map(x, function(x) x)

map2(matrix1, matrix2, %*%)
map2(matrix1, matrix2, function(x,y) %*%(x,y))


#infix function %*%
matrix1[[1]] %*% matrix2[[1]]

#prefix mode
`%*%`(matrix1[[1]], matrix2[[1]])




a %>%
  sum()

sum(
  a
)


# Resumo:

#Pipes servem para você ler da esquerda para direita ao inves  de dentro para fora.

# Entenda tudo que não é vetor como uma função

# O pipe não funciona no modo infix para funcões builtin

## Para usar aplicar funções builtin com pipe, você precisa usar o modo prefix `.f`

# O pipe usa o "." (ponto final) como sinalizador do que vem a esquerda dele
##  a %>% f1(., ...) é a mesma coisa que  a %>% function(x) f1(x, ...)
# O "." pode ser usado junto com funções do tipo special:
## a %>% .[2]
# Você também pode usar o . para indicar que o "a" é um argumento especifico dentro da função
## a %>% f1(arg1 = 1, arg2 =  2, arg3 = 3, arg20 = .)

# O pipe precisa de um valor "bem definido" para atuar consistentemente. Ou seja...
## matrix1 * matrix2 %>% solve %>% sum ## vai atuar sobre matrix2 e não sobre o produto dos dois
## (matrix1 * matrix2) %>% solve %>% sum ## vai atuar sobre o produto dos dois

# O pipe precisa atuar sobre um environment bem definido. Ou seja, não use num argumento de uma função sem um environment
## Existem duas 