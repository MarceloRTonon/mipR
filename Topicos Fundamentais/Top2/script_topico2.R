# Script para a aula

library(purrr)
library(tibble)
library(readxl)
library(tibble)



# Absolute Path -----------------------------------------------------------

# Absolute path
"C:/Users/mtono/Documents/R_Projetos/didatica_mip/mipR/arquivo.Rdata"

#Absolute path a partir do default directory
"~/R_Projetos/didatica_mip/mipR/arquivo.Rdata"

# Relative path
"arquivo.Rdata"


# Working directory -------------------------------------------------------

original_wd <- getwd()

#setwd("algum diretorio qualquer")

setwd(original_wd)


# Salvando .Rdata ---------------------------------------------------------

x <- c(1:20)
y <- list(a = 1, b = TRUE, c = "oops")
save(x, y, file = "xy.RData") #cria um arquivo "xy.Rdata" no diretorio de trabalho atual
save.image() # cria um arquivo chamado ".Rdata" no diretorio de trabalho atual.
unlink("xy.RData") #apaga o arquivo "xy.Rdata"

# Como funciona a função save.image
save.image2 <- function(x){
  save(list = ls(all.names = TRUE), file = ".RData", envir = .GlobalEnv)
}


# Lendo .Rdata ------------------------------------------------------------

# Vetor Atómico Lógico
z <- c(TRUE, FALSE, TRUE, FALSE)
# Salvando z e save.image2 em "z2.Rdata"
save(z, save.image2, file = "z2.Rdata")
# Removendo z e save.image2 do Environment.
rm(z, save.image2)
#Carregando "z2.Rdata"
load("z2.Rdata")



# rds ---------------------------------------------------------------------


# usamos a função saveRDS para salvar um arquivo referente a z
saveRDS(z, file = "z.rds")

rm(z)

# usamos a função readRDS para ler o arquivo "z.rds"
readRDS("z.rds")

z <- readRDS("z.rds")


# csv ---------------------------------------------------------------------

#Criando uma pasta de dados chamada top2
dir.create("top2")

#Tirando a 1a coluna de iris

exemplo_iris <- iris[,-1]

# Escrevendo um arquivo em csv:

write.csv(exemplo_iris, file = "top2/exemplo_iris.csv")

rm(exemplo_iris)

# Lendo um arquivo csv

exemplo_iris2 <- read.csv("top2/exemplo_iris.csv")

exemplo_iris2 <- read.csv("top2/exemplo_iris.csv", row.names= 1)

