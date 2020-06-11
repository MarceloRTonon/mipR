# Aula 1 - Vetores e Operações básicas ####

# Autores: Marcelo Tonon e Felipe Cornelio
# Disciplina: Tópicos especiais em técnicas insumo-produto
# Profs: Esther Dweck e Kaio Vital.

# Conceitos de Valor, Variável e Função

2 # Valor é uma informação que pode ser associada à alguma variável ou função
a <- 2 # "a" é uma variável que recebe o valor "2
b <- c(a,4) # "b" é uma variável que recebe o resultado da função "c()" aplicada à variável "a" e o valor "4"
b

c <- sum(b) # "sum()" é uma função que retorna a soma de todos elementos do conjunto de dados.
?sum

# Operações básicas

a+c 
a-c
a/c
a*c
a^c

# Pergunta: O que aconteceria se fizessemos as operações com "b" e não com "c"?

# Formas de se aplicar uma função ####

# "nested" ou "Pipe"
library(purrr)

# Podemos reescrever o valor de "c" nas duas formas:

c_1 <- sum(c(a,4))
c_2 <- c(a,4) %>% sum()

# Como saber se os valores são iguais?
teste_1 <- c == c_1
teste_2 <- c == c_2

# Da mesma forma, podemos também perguntar se os valores são diferentes:

teste_3 <- c > c_1 # Maior (ou menor "<")
teste_4 <- c >= c_1 # Maior ou igual (ou menor ou igual "<=")
teste_5 <- c != c_1 # Testa se os valores são diferentes


# Criando uma função no R ####

# Há também a possibilidade de se criar uma função para realizar alguma tarefa:

soma <- function(x,y) {
  z <- x + y
  return(z)
}

soma(a,c)
soma(a,c) == sum(a,c)

# Nesse caso vc pode tomar a liberdade de criar alguma função da forma que precisar

# Tipos de Objetos no R ####

# Texto
MIP <- c("Leontief", "Matriz")
typeof(MIP)

# Números Reais (Double)
r <- c(1, 2, 3)
typeof(r)

# Exemplo
typeof(a)
typeof(b)


# Números inteiros são expressos com L no final
e <- c(-1L, 1L, 2L, 3L)
typeof(e)

# resultados lógicos indicando se dois valores são iguais
l <- c(TRUE, FALSE, T, F) # TRUE e FALSE podem ser escritos somente por T ou F
typeof(l)

Exemplo
typeof(teste_1)
typeof(teste_2)

# Estrutura básica dos dados ####

# Existem duas principais formas de se estruturar os dados: vetores atômicos e listas:

# Vetores

vetor_exemplo <- c(5, 3 , 1:5, 3, 4:6)
View(vetor_exemplo)

# se eu quiser saber quantos elementos existem no meu vetor:
length(vetor_exemplo)

# Agora, eu desejo saber qual é o segundo valor do meu vetor:
vetor_exemplo[2] 
# No caso o [] é usado para indicar a posição dentro do vetor (ou matriz, como veremos mais a frente):

# outras operações
vetor_exemplo[5:8] # retorna um intervalo (contínuo) dentro do vetor
vetor_exemplo[c(1,9)] # retorna o valor nas posições específicas (o primeiro e o nono, no caso)
vetor_exemplo[-c(5,7:10)] # retorna todos os valores exceto os especificados

# Para saber a "estrutura" dos dados, ou seja suas infos básicas:
str(vetor_exemplo)

# Podemos também associar "nomes" aos valores do vetor:
names(vetor_exemplo) <- letters[1:11]
View(vetor_exemplo)

# Após inserir esse dado, vamos ver novamente a estrutura:
str(vetor_exemplo)

# Apresentará os metadados, aqui representado pelos "nomes"
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

# É uma forma muito útil de se lidar com os dados, pois é possível unir dados de diferentes tipos em um único objeto:

lista_1 <- list("MIP", 2020, "UFRJ", TRUE)
lista_1[2]
str(lista_1)

vetor_1 <- c("MIP", 2020, "UFRJ", TRUE)
str(vetor_1)

# função unlist() traformará sua lista em um vetor atômico

# Uma lista também pode ser formada recursivamente por elementos que são listas:
lista_2 <- list(list(list(list(list()))),list())
str(lista_2)

# Dataframes e matrizes ####

# Assim como os vetores podemos criar uma matriz no R. Nesse caso, usa-se a função matrix()
?matrix

matriz_a <- matrix(data = c(1:24), nrow = 8, ncol = 3)
# ou da mesma forma:
matriz_a <- matrix( c(1:24), 8, 3)

# Se, por exemplo, quisermos adicionar uma coluna de "character", podemos usar um data.frame:

df_a <- data.frame(letters[1:8], c(1:8), c(9:16), c(17:24))
# ou de forma equivalente:
df_b <- data.frame(letters[1:8], matriz_a)

# Também é possível transformar uma matriz em data.frame (e vice-versa) usando as.matrix e as.data.frame:

df_a_matriz <- as.matrix(df_a)
str(df_a_matriz)
typeof(df_a_matriz)


# Visualizando informações de matrizes

head(df_a) # mostra as primeiras linhas de uma tabela
colnames(df_a)
colnames(matriz_a)
row.names(df_a)
row.names(matriz_a)

# podemos inserir nomes

row.names(matriz_a) <- letters[1:8]
row.names(matriz_a)
# o mesmo para as colunas

# Extraindo informações da matriz ou data.frame:

df_a[1,]
df_a[,1]
df_a[,-1]
df_a[,1:3]
df_a[c(1,3,5),]
df_a[2,4]