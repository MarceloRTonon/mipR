library(purrr)
library(tibble)
library(readxl)
library(tibble)

# Q1.1 --------------------------------------------------------------------


colnames_dfQ1.1 <- read_excel("aula2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls", 
                              sheet = "14", range = "A4:BQ4", col_names = FALSE)
colnames_dfQ1.1[1:2] <- read_excel("aula2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls", 
                                   sheet = "14", range = "A3:B3", col_names = FALSE)

dfQ1.1 <- read_excel("aula2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls", 
                     sheet = "14", range = "A6:BQ72", col_names = unlist(colnames_dfQ1.1))


# Q.1.2 -------------------------------------------------------------------

dfQ1.2 <- read_excel("aula2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls",                               sheet = "15", range = "A6:BQ72", col_names = unlist(colnames_dfQ1.1))



# Q.1.3 -------------------------------------------------------------------

cod67 <- dfQ1.1[,1]
colnames(dfQ1.1)[1] <- "descricao"
dfQ1.1 <- as.data.frame(dfQ1.1)
rownames(dfQ1.1) <- unlist(cod67)
dfQ1.1 <- tibble:column_to_rownames(as.data.frame(dfQ1.1), var = "descricao")
dfQ1.2 <- tibble:column_to_rownames(as.data.frame(dfQ1.2), var = colnames(dfQ1.2[,1]))


# Q.1.4 -------------------------------------------------------------------


