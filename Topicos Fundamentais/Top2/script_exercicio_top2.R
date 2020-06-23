#Exercicio Tópico 2

library(purrr)
library(tibble)
library(readxl)
library(openxlsx)

#### Exemplo de baixando o arquivo do IBGE diretamente da internet

## Aprendi o motivo que dava erro...

tmp <- tempfile(fileext = ".xls")

url_ibge <- "ftp://ftp.ibge.gov.br/Contas_Nacionais/Matriz_de_Insumo_Produto/2015/Matriz_de_Insumo_Produto_2015_Nivel_67.xls"

download.file(url = url_ibge, destfile = tmp, mode = "wb")

library(readxl)
colnames_dfQ1.1 <- read_excel(tmp, sheet = "14", range = "A4:BQ4", col_names = FALSE)



#### Q.1.1 Crie um tibble `dfQ1.1` com os dados da matriz de coeficientes técnicos intersetoriais (aba 14 de IBGE_2015) e também as duas colunas com o código e a descrição das atividades. Nomeie também as colunas ------

library(readxl)

colnames_dfQ1.1 <- read_excel("top2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls", sheet = "14", range = "A4:BQ4", col_names = FALSE)

colnames_dfQ1.1[1:2] <- read_excel("top2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls", sheet = "14", range = "A3:B3", col_names = FALSE)

dfQ1.1 <- read_excel("top2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls",
                     sheet = "14", range = "A6:BQ72", col_names = unlist(colnames_dfQ1.1))



#### Q.1.2 Crie um tibble `dfq1.2` com a matriz de Leontief (aba 15 de IBGE_2015) e também as duas colunas com o código e a descrição das atividades. Nomeie também as colunas ------

dfQ1.2 <- read_excel("top2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls",                               sheet = "15", range = "A6:BQ72", col_names = unlist(colnames_dfQ1.1))


#### Q.1.3 Crie um tibble `cod67` contendo apenas os dados da coluna `"Código da atividade nível 67"` da matriz `dfQ1.1`. Crie também um tibble `des67` contendo apenas os dados da coluna `"Descrição da atividade nível 67"` da matriz `dfQ1.1`; Mantenha os colnames de ambas.  -----

cod67 <- dfQ1.1[,1]
colnames(cod67)

dfQ1.1$`Código
da atividade
nível 67`
is_tibble(cod67)

des67 <- dfQ1.1[,2]
is_tibble(des67)


##### D.1.1 - ***Desafio:*** Rode `is.tibble()` ao invés de `is_tibble` em `cod67`. O que retornou? Procure saber sobre o pacote `lifecycle` com `??` -----

# Fazendo is.tible(cod67)
is.tibble(cod67)
#Indo no R Documentation do is.tibble
#?is.tibble
# Dando ?? no lifecycle
#??lifecycle
# Indo direto no help do lifecycle
#?lifecycle::lifecycle
# Vendo se ele tem vignette
#vignette(package ="lifecycle")
#vignette("lifecycle")

#### Q.1.5 Usando a função `as.data.frame`, crie `dfQ1.5` a partir de `dfQ1.1`, de modo que:
#- `dfQ1.5` seja um data.frame e não um tibble.
#- `dfQ1.5` tenha row.names com a Descrição de atividades.
#- `dfQ1.5` seja uma matriz quadrada (67 x 67), apenas com os dados númericos

#Dica: Ao contrario do que foi exposto na Aula 2, há um modo em que não é necessário uma nova linha apenas para mudar os `row.names` de `dfQ1.5`. Veja a documentação de `as.data.frame` para ver como.



dfQ1.5 <- as.data.frame(dfQ1.1[,-c(1:2)], row.names = dfQ1.1[,2])

#### Q.1.6 Usando a função `column_to_rownames`, crie um data.frame `dfQ1.6` a partir de `dfQ1.2` que siga as mesma 
#**Dica 1:** O argumento `var =` precisa estar explicito na função `column_to_rownames`. Ou seja, `var = "name_of_the_column"`, precisa estar escrito. Se você não escrever `var =`, a função irá pensar que esse segundo argumento é uma base de dados. Se precisar, veja como ela é usada nos exemplos da documentação.
#**Dica 2:** Usando a função `colnames()` você não tem que escrever o nome da coluna. Veja abaixo:

#Demonstração
colnames(dfQ1.1[,5])
colnames(dfQ1.1)[4:6]
colnames(dfQ1.1)[1]



#Resposta
library(tibble)
dfQ1.6 <-  column_to_rownames(dfQ1.2[,-1], var = colnames(dfQ1.2[,2]))
