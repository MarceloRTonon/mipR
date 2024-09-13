# Topico 1 - Vetores e Operacoes basicas ####

# Autores: Marcelo Tonon e Felipe Cornelio
# Disciplina: Topicos especiais em tecnicas insumo-produto
# Profs: Esther Dweck e Kaio Vital.

# Conceitos de Valor, Variavel e Funcao.

2 # Valor e uma informacao que pode ser associada a alguma variavel ou funcao
a <- 2 # "a" e uma variavel que recebe o valor "2"
b <- c(a,4) # "b" e uma variavel que recebe o resultado da funcao "c()" aplicada a variavel "a" e o valor "4"
b

c_0 <- sum(b) # "sum()" e uma funcao que retorna a soma de todos elementos do conjunto de dados.
?sum

# Operacoes basicas

a + c_0 
a - c_0 
a / c_0 
a * c_0 
a ^ c_0 
a %% c_0

# Pergunta: O que aconteceria se fizessemos as operacoes com "b" e nao com "c"?

# Formas de se aplicar uma funcao ####

# "nested" ou "Pipe"
# Para instalar o pacote, exclua o "#" da próxima linha:
#install.packages("purrr")
library(purrr)

# Podemos reescrever o valor de "c" nas duas formas:

c_1 <- sum(c(a,4))

c_2 <- c(a,4) %>% 
  sum()
c_2b <- a %>% 
  c(4) %>% 
  sum()


# Como saber se os valores sao iguais?
teste_1 <- c_0 == c_1
teste_2 <- c_0 == c_2

# Da mesma forma, podemos tambem perguntar se os valores sao diferentes:

teste_3 <- c_0 >  c_1 # Maior (ou menor "<")
teste_4 <- c_0 >= c_1 # Maior ou igual (ou menor ou igual "<=")
teste_5 <- c_0 != c_1 # Testa se os valores sao diferentes


# Criando uma funcao no R ####

# Ha tambem a possibilidade de se criar uma funcao para realizar alguma tarefa:

soma <- function(x,y) {
  z <- x + y
  return(z)
}

soma(a,c_0)
soma(a,c_0) == sum(a,c_0)

# Nesse caso vc pode tomar a liberdade de criar alguma funcao da forma que precisar

# Tipos de Objetos no R ####

# Texto
MIP <- c("Leontief", "Matriz")
typeof(MIP)

# Numeros Reais (Double)
r <- c(1, 2, 3)
typeof(r)

# Exemplo
typeof(a)
typeof(b)


# Numeros inteiros sao expressos com L no final
e <- c(-1L, 1L, 2L, 3L)
typeof(e)

# resultados logicos indicando se dois valores sao iguais
l <- c(TRUE, FALSE, T, F) # TRUE e FALSE podem ser escritos somente por T ou F
typeof(l)

#Exemplo
typeof(teste_1)
typeof(teste_2)

# Estrutura basica dos dados ####

# Existem duas principais formas de se estruturar os dados: vetores atomicos e listas:

# Vetores

vetor_exemplo <- c(5, 3 , 1:5, 3, 4:6)
View(vetor_exemplo)

# se eu quiser saber quantos elementos existem no meu vetor:
length(vetor_exemplo)

# Agora, eu desejo saber qual e o segundo valor do meu vetor:
vetor_exemplo[2]
# No caso o [] e usado para indicar a posicao dentro do vetor (ou matriz, como veremos mais a frente):

# outras opera??es
vetor_exemplo[5:8] # retorna um intervalo (continuo) dentro do vetor
vetor_exemplo[c(1,9)] # retorna o valor nas posicoes especificas (o primeiro e o nono, no caso)
vetor_exemplo[-c(5,7:10)] # retorna todos os valores exceto os especificados

# Para saber a "estrutura" dos dados, ou seja suas infos basicas:
str(vetor_exemplo)

# Podemos tambem associar "nomes" aos valores do vetor:
names(vetor_exemplo) <- letters[1:11]
View(vetor_exemplo)

# Apos inserir esse dado, vamos ver novamente a estrutura:
str(vetor_exemplo)

# Apresentar os metadados, aqui representado pelos "nomes"
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

# E uma forma muito util de se lidar com os dados, pois e possivel unir dados de diferentes tipos em um unico objeto:

lista_1 <- list("MIP", 2020, "UFRJ", TRUE)
lista_1[2]
str(lista_1)

vetor_1 <- c("MIP", 2020, "UFRJ", TRUE)
str(vetor_1)

# funcao unlist() traformara sua lista em um vetor atomico

# Uma lista tambem pode ser formada recursivamente por elementos que sao listas:
lista_2 <- list(list(list(list(list()))),list())
str(lista_2)

# Dataframes e matrizes ####

# Assim como os vetores podemos criar uma matriz no R. Nesse caso, usa-se a funcao matrix()
?matrix

matriz_a <- matrix(data = c(1:24), nrow = 8, ncol = 3)
# ou da mesma forma:
matriz_a <- matrix( c(1:24), 8, 3)

# Se, por exemplo, quisermos adicionar uma coluna de "character", podemos usar um data.frame:

df_a <- data.frame(letters[1:8], c(1:8), c(9:16), c(17:24))
# ou de forma equivalente:
df_b <- data.frame(letters[1:8], matriz_a)

# Tambem e possivel transformar uma matriz em data.frame (e vice-versa) usando as.matrix e as.data.frame:

df_a_matriz <- as.matrix(df_a)
str(df_a_matriz)
typeof(df_a_matriz)


# Visualizando informacoes de matrizes

head(df_a) # mostra as primeiras linhas de uma tabela
colnames(df_a)
colnames(matriz_a)
row.names(df_a)
row.names(matriz_a)

# podemos inserir nomes

row.names(matriz_a) <- letters[1:8]
row.names(matriz_a)
# o mesmo para as colunas
# Extraindo informacoes da matriz ou data.frame:

df_a[1,]
df_a[,1]
df_a[,-1]
df_a[,1:3]
df_a[c(1,3,5),]
df_a[2,4]

#### Operações Matriciais. ===========

# Temos três funcões e um operador matricial fundamentais para lidar com matrizes no R:

##### 1. Transposição de matriz: função t() #####

matriz_a %>% t()
t(matriz_a)




# Para entender melhor t() vamos ver as linhas e colunas com a função dim()

matriz_a %>% t() %>% dim()
matriz_a %>% dim()
# Lembrando que a transposta de uma transposta de uma matriz é a própria matriz.


##### 2. A função diag() #####

# A função diag pode ter vários usos.

# Criar uma matriz identidade: (se o input for apenas um escalar)

diag(3)

# Criar uma matriz diagonal (se o input for um vetor estritamente atômico)

diag(1:3)

# Extrair a diagonal principal de uma matriz (se o input for uma matriz)

matrix(1:9, nrow = 3, ncol = 3) %>% diag()

##### 3. A multiplicação matricial com o operador %*% #####

matriz_a %*% matrix(1:9, nrow = 3, ncol = 3) 

# Se as dimensões não forem compatíveis, retornará um erro!
matrix(1:9, nrow = 3, ncol = 3) %*% matriz_a

## 4. Inversão de matrizes com a função solve

matrix(1:4, nrow =2, ncol =2) %>% solve

# Se a matriz for singular, e portanto não tiver inversa, irá retornar erro!

matrix(1:9, nrow = 3, ncol = 3) %>% solve()



# Matrizes com uma coluna Vs Vetores Atômicos -----------------------------

vec <- c(1:10)
mat <- matrix(c(1:10), ncol =1, nrow =10)
# vec é um vetor atômico, e mat é uma matrix de uma coluna.
all.equal(vec,mat)

# Muitas vezes se comportam da mesma forma.
vec %>% t()
mat %>% t()
t(mat) %>% all.equal(t(vec))

## Subsetting ######
# Em certos aspectos matrizes com uma só coluna tem um comportamento mais parecido com vetores atomicos do que com matrizes de 2+ colunas
# Definamos vec2 e mat2:
vec2 <- vec[1:5]
vec2 %>% is.matrix() # Claramente não é uma matrix

mat2.0 <- mat[1:5]

mat2.0 %>% is.matrix 

mat[1:5,] %>% is.matrix() # Não é uma matrix.

matb <- matrix(1:20, ncol =2) # Matrix com duas colunas
matb[1:5,] %>% is.matrix() # É uma matrix

# Ou seja, se o objeto que você subselecionar não resultar em 2 colunas, o R transforma ele em atomico
# A forma mais segura de garantir que o resultado será uma matrix é fazer:

mat2 <- mat[1:5,] %>% matrix(ncol = 1) # Forma 1

mat2 <- mat[1:5,]%>% matrix(ncol = ncol(mat)) # Forma 2

### Pergunta pros alunos:
## Por que a Forma 2 seria melhor do que a Forma 1?

## Operações #####

# É importante relembrar que em muitos aspectos vec não é uma matrix como mat (e vice e versa).
# Um aspecto que isso fica muito claro é nas operações matemáticas

# Na divisão, mat e vec podem ser divididos um pelo outro sem problema
mat/vec
vec/mat

# O mesmo vale para as outras operações

mat+vec
vec-mat
vec*mat

# Porém diferenças emergem quando os elementos tem tamanhos diferentes.
# As matrizes não mudam de tamanho por conta da operação.
# Ou seja, o resultado tem que ser do tamanho dela, ou retornará um erro.
mat2+mat 

# No caso de uma operação entre uma matriz um vetor atõmico, é um pouco mais complicado.

# Nessa situação sempre retornará erro se:
# length(matrix) < length(vec)
mat2+vec

## Caso de Exceção
# length(matrix) > length(vec) 

mat+vec2
mat/vec2

# Para não retornar um warning tem uma condição:
# (length(elem1)%%length(elem2))==0 
# Ou seja, o tamanho de elem1 tem que ser multiplo do de elem2
mat+1:9

#Isso também vale para quando são 2 vetores atômicos:
vec + 1:9

### Importante: VOCÊ QUER O ERRO ####
# As vezes o warning pode não aparecer (ou passar desapercebido quando rodar um código muito longo).
# Dessa forma, é mais seguro você colocar tudo em matrix para garantir o erro.

vecRuim <- 1:9
vecRuim+mat

matRuim <- vecRuim %>% as.matrix(ncol = 1)

matRuim + mat

## Jogando na retranca #####

# Como vimos acima a melhor forma de garantir que o código vai funcionar do modo desejado é ser extra cuidadoso.
# Por isso, abrace o Celso Roth que existe em vocẽ:
# Coloque três zagueiros e três volantes, fale pros laterais não subirem muito e mande o atacante marcar.

# Um caso em que não afeta tanto o resultado ser extra cuidadoso:

vec %>% 
  matrix(ncol =1) %>% # transforma em matrix
  t() 
vec %>% t()

mat %>%
  c() %>% # transforma em vetor atômico
  t()

mat %>%
  t()

# Casos em que afeta:
vec %>% matrix(ncol =1) %>% diag()
vec %>% diag()

# Não vamos explicar aqui o porquê da função diag() fazer isso, pois é o dever de casa!
# Veja mais casos:
vec[10] %>% diag()
vec[10] %>% matrix(ncol =1) %>% diag()

# O mesmo podemos pensar pra mat

mat %>% diag()

mat %>% c() %>% diag()

# O ponto aqui é: você sabe a priori qual caso vai afetar ou não vai afetar?
# Ao longo do código é fácil perder quando cada objeto tá de um jeito e não de outro.
#Logo, na dúvida, o melhor é jogar seguro:

mat %>% as.matrix() %>% diag()
vec %>% c() %>% diag()