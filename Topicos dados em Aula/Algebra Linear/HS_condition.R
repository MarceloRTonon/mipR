library(tidyverse)
library(readxl)
#Criando um arquivo temporário
arq_temp <- tempfile(fileext = ".xlsx")
#Baixando o arquivo
# Usamos 'mode = "wb"' porque iremos baixar um arquivo binário (que não é texto puro, como no caso de csv).
download.file(url = "http://www.wiod.org/protected3/data16/niot/ITA_niot_nov16.xlsx", destfile = arq_temp, mode = "wb")

# Importando a NIOT para o R:
niotITA <- read_xlsx(arq_temp, sheet = 2)

# Excluindo arq_temp
unlink(arq_temp)


niotITA2 <- niotITA %>% 
  drop_na() %>%
  filter(Origin == "Domestic") %>%
  filter(Year == "2000") %>%
  select(all_of(.$Code)) %>%
  type_convert()

GO <- niotITA %>%
  drop_na() %>%
  type_convert() %>%
  filter(Code == "GO") %>%
  filter(Year == "2000") %>%
  select(names(niotITA2)) %>%
  as.matrix()

GOinv <- GO %>% c() %>% diag() %>% .^-1

GOinv[is.infinite(GOinv)] <- 0

A_ITA <- as.matrix(niotITA2)%*% GOinv

B_ITA <- diag(nrow(A_ITA)) - A_ITA

B_ITA %>% det()

nan.to.zero <- function(x){
x[is.nan(x)] <- 0
return(x)
}

principalMinors <- 1:nrow(B_ITA) %>%
  as.list() %>%
  map_dbl(function(x) det(as.matrix((B_ITA[c(1:x),c(1:x)])))) %>%
  nan.to.zero() 

# pmHtZ = principal minors higher than zero
# pmLtZ = principal minors lower than zero

pmHtz <- which((principalMinors>0))
pmLtz <- which( (principalMinors <=0) )
which(principalMinors <=0)

HS_condition_result <- all((principalMinors > 0 & !is.nan(principalMinors)))


# Hawkins-Simons Conditions
HS_condition <- function(.A, which0 = FALSE){
  require(purrr)
  require(stats)
  .B <- diag(nrow(.A)) - as.matrix(.A)
 .mnors <-  1:nrow(.B) %>%
    as.list() %>%
    map_dbl(~ det(as.matrix((.B[c(1:.x),c(1:.x)]))))

 .mnors[is.nan(.mnors)] <- 0
 
  .mnors[is.na(.mnors)] <- 0
  
# return(.mnors)
 ifelse(which0,
        ifelse(.mnors >0, return(NA) ,return(which(.mnors <=0))),
        return(all(.mnors >0)))
}

HS_condition(A_ITA)
HS_condition(A_ITA, which0 = T)

### (Brauer-)Solow  Conditions

BS_condition <- function(.A){
  .A[is.nan(.A)] <- 0
  all(colSums(.A) <1 | rowSums(.A) <1)
}

BS_condition(A_ITA)


principalMinorsA <- 1:nrow(A_ITA) %>%
  as.list() %>%
  map_dbl(function(x) det(-as.matrix((A_ITA[c(1:x),c(1:x)])))) %>%
  nan.to.zero()

principalMinorsA < 0