# Topico 1 - Vetores e Opera??es b?sicas ####

# Autores: Marcelo Tonon e Felipe Cornelio
# Disciplina: T?picos especiais em t?cnicas insumo-produto
# Profs: Esther Dweck e Kaio Vital.

# Conceitos de Valor, Vari?vel e Fun??o

2 # Valor ? uma informa??o que pode ser associada ? alguma vari?vel ou fun??o
a <- 2 # "a" ? uma vari?vel que recebe o valor "2
b <- c(a,4) # "b" ? uma vari?vel que recebe o resultado da fun??o "c()" aplicada ? vari?vel "a" e o valor "4"
b

c <- sum(b) # "sum()" ? uma fun??o que retorna a soma de todos elementos do conjunto de dados.
?sum

# Opera??es b?sicas

a+c 
a-c
a/c
a*c
a^c

# Pergunta: O que aconteceria se fizessemos as opera??es com "b" e n?o com "c"?

# Formas de se aplicar uma fun??o ####

# "nested" ou "Pipe"
library(purrr)

# Podemos reescrever o valor de "c" nas duas formas:

c_1 <- sum(c(a,4))
c_2 <- c(a,4) %>% sum()

# Como saber se os valores s?o iguais?
teste_1 <- c == c_1
teste_2 <- c == c_2

# Da mesma forma, podemos tamb?m perguntar se os valores s?o diferentes:

teste_3 <- c > c_1 # Maior (ou menor "<")
teste_4 <- c >= c_1 # Maior ou igual (ou menor ou igual "<=")
teste_5 <- c != c_1 # Testa se os valores s?o diferentes


# Criando uma fun??o no R ####

# H? tamb?m a possibilidade de se criar uma fun??o para realizar alguma tarefa:

soma <- function(x,y) {
  z <- x + y
  return(z)
}

soma(a,c)
soma(a,c) == sum(a,c)

# Nesse caso vc pode tomar a liberdade de criar alguma fun??o da forma que precisar

# Tipos de Objetos no R ####

# Texto
MIP <- c("Leontief", "Matriz")
typeof(MIP)

# N?meros Reais (Double)
r <- c(1, 2, 3)
typeof(r)

# Exemplo
typeof(a)
typeof(b)


# N?meros inteiros s?o expressos com L no final
e <- c(-1L, 1L, 2L, 3L)
typeof(e)

# resultados l?gicos indicando se dois valores s?o iguais
l <- c(TRUE, FALSE, T, F) # TRUE e FALSE podem ser escritos somente por T ou F
typeof(l)

Exemplo
typeof(teste_1)
typeof(teste_2)

# Estrutura b?sica dos dados ####

# Existem duas principais formas de se estruturar os dados: vetores at?micos e listas:

# Vetores

vetor_exemplo <- c(5, 3 , 1:5, 3, 4:6)
View(vetor_exemplo)

# se eu quiser saber quantos elementos existem no meu vetor:
length(vetor_exemplo)

# Agora, eu desejo saber qual ? o segundo valor do meu vetor:
vetor_exemplo[2] 
# No caso o [] ? usado para indicar a posi??o dentro do vetor (ou matriz, como veremos mais a frente):

# outras opera??es
vetor_exemplo[5:8] # retorna um intervalo (cont?nuo) dentro do vetor
vetor_exemplo[c(1,9)] # retorna o valor nas posi??es espec?ficas (o primeiro e o nono, no caso)
vetor_exemplo[-c(5,7:10)] # retorna todos os valores exceto os especificados

# Para saber a "estrutura" dos dados, ou seja suas infos b?sicas:
str(vetor_exemplo)

# Podemos tamb?m associar "nomes" aos valores do vetor:
names(vetor_exemplo) <- letters[1:11]
View(vetor_exemplo)

# Ap?s inserir esse dado, vamos ver novamente a estrutura:
str(vetor_exemplo)

# Apresentar? os metadados, aqui representado pelos "nomes"
attributes(vetor_exemplo)

# Avaliando qual o tipo do vetor:

is.character(vetor_exemplo)
is.character(MIP)

is.double(vetor_exemplo)
is.double(MIP)

# ou podemos tranformar um vetor em outro tipo:

vetor_exemplo <- as.character(vetor_exemplo)
typeof(vetor_exemplo)
vetor_exemplo <- as.double(vetor_exemplo)
typeof(vetor_exemplo)


# Listas

# ? uma forma muito ?til de se lidar com os dados, pois ? poss?vel unir dados de diferentes tipos em um ?nico objeto:

lista_1 <- list("MIP", 2020, "UFRJ", TRUE)
lista_1[2]
str(lista_1)

vetor_1 <- c("MIP", 2020, "UFRJ", TRUE)
str(vetor_1)

# fun??o unlist() traformar? sua lista em um vetor at?mico

# Uma lista tamb?m pode ser formada recursivamente por elementos que s?o listas:
lista_2 <- list(list(list(list(list()))),list())
str(lista_2)

# Dataframes e matrizes ####

# Assim como os vetores podemos criar uma matriz no R. Nesse caso, usa-se a fun??o matrix()
?matrix

matriz_a <- matrix(data = c(1:24), nrow = 8, ncol = 3)
# ou da mesma forma:
matriz_a <- matrix( c(1:24), 8, 3)

# Se, por exemplo, quisermos adicionar uma coluna de "character", podemos usar um data.frame:

df_a <- data.frame(letters[1:8], c(1:8), c(9:16), c(17:24))
# ou de forma equivalente:
df_b <- data.frame(letters[1:8], matriz_a)

# Tamb?m ? poss?vel transformar uma matriz em data.frame (e vice-versa) usando as.matrix e as.data.frame:

df_a_matriz <- as.matrix(df_a)
str(df_a_matriz)
typeof(df_a_matriz)


# Visualizando informa??es de matrizes

head(df_a) # mostra as primeiras linhas de uma tabela
colnames(df_a)
colnames(matriz_a)
row.names(df_a)
row.names(matriz_a)

# podemos inserir nomes

row.names(matriz_a) <- letters[1:8]
row.names(matriz_a)
# o mesmo para as colunas

# Extraindo informa??es da matriz ou data.frame:

df_a[1,]
df_a[,1]
df_a[,-1]
df_a[,1:3]
df_a[c(1,3,5),]
df_a[2,4]