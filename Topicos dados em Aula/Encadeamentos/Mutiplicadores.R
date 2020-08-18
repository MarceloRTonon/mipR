library(readxl)
library(xlsx)



###################### Extraindo os dados ######################

names_SCN <- as.character(read_xlsx("MIP/Matriz_de_Insumo_Produto_2015_Nivel_67.xlsx", sheet = '14', range='c4:bq4', col_names = F))
An_67 <- read_xlsx("MIP/Matriz_de_Insumo_Produto_2015_Nivel_67.xlsx", sheet = '14', range='c6:bq72', col_names = names_SCN)
L_67 <-  read_xlsx("MIP/Matriz_de_Insumo_Produto_2015_Nivel_67.xlsx", sheet = '15', range='c6:bq72', col_names = names_SCN)
DF_127 <- read_xlsx("MIP/Matriz_de_Insumo_Produto_2015_Nivel_67.xlsx", sheet = '03', range='r6:w132',col_names = F)
S_67 <- read_xlsx("MIP/Matriz_de_Insumo_Produto_2015_Nivel_67.xlsx", sheet = '13', range='c6:dy72', col_names = F)
names_VA<- as.data.frame(read_xls("nivel_68_2010_2016_xls/68_tab2_2015.xls", 'VA', range='A6:a19', col_names = F))
tab02_VA_2015 <- read_xls("nivel_68_2010_2016_xls/68_tab2_2015.xls", 'VA', range='b6:bq19', col_names = F)

# Testando se a extracao foi correta
Teste_67 <- L_67-solve(diag(1,67,67)-An_67)

###################### Tornando a Consumo das Famílias como Induzido #########################

# coeficientes técnicos referentes a produçao das famílias

hr_67 <- tab02_VA_2015[3,]/tab02_VA_2015[13,]

# coeficientes referentes ao consumo das famílias

hc <- t(DF_127[,4])/(rep(rowSums(tab02_VA_2015_INPLAN[3,]),127))
hc_67 <- hc

# Teste Consumo das Famílias Induzido = Consumo das Famílias

C <- as.matrix(S)%*%t(as.matrix(hc))%*%as.matrix(hr)%*%t(as.matrix(tab02_VA_2015_INPLAN[13,]))
teste_C <- ifelse(abs(C-DF_13[,4])<0.00000001, 'Ok', 'Errado')

#matriz de coeficientes técnicos de consumo

Bcon_67 <- t(as.matrix(hc_67))%*%as.matrix(hr_67)

#matriz de coeficientes técnicos de consumo intersetoriais

Acon_67 <- as.matrix(S_67)%*%Bcon_67

# matriz de coeficientes técnicos intersetoriais completa

An_67_total <- An_67+Acon_67

# Inversa de leontief com Consumo Induzido

L_67_total <- solve(diag(1,67,67)-An_67_total)


###################### Indicadores de Encadeamentos ######################

## Linkages (Multiplicador Direto) - matriz simples

BL_67 <- as.data.frame(colSums(L_67))
names(BL_67) <- 'Backward Linkages'
FL_67 <- as.data.frame(rowSums(L_67),row.names = names_SCN)
names(FL_67) <- 'Forward Linkages'

# Indicadores de Poder e Sensibilidade de Dispersão - matriz simples

BL_67_medio <- BL_67/67
FL_67_medio <- FL_67/67
M_tot_67 <- as.data.frame(sum(L_67)/(67^2))
M_tot_67_aux <- rep.row(as.matrix(M_tot_67),67)

pd_67 <- BL_67_medio/M_tot_67_aux
sd_67 <- FL_67_medio/M_tot_67_aux


# Backward e Forward linkages (induzido)

BL_ind_67 <- as.data.frame(colSums(L_67_total))
names(BL_ind_67) <- 'Backward Linkages'
FL_ind_67 <- as.data.frame(rowSums(L_67_total),row.names = names_implan)
names(FL_ind_67) <- 'Forward Linkages'

# Indicadores de Poder e Sensibilidade de Dispersão - matriz induzida

BL_ind_67_medio <- BL_ind_67/67
FL_ind_67_medio <- FL_ind_67/67
M_ind_67_tot <- as.data.frame(sum(L_67_total)/(67^2))
M_ind_67_tot_aux <- rep.row(as.matrix(M_ind_67_tot),67)

pd_ind_67 <- BL_ind_67_medio/M_ind_67_tot_aux
sd_ind_67 <- FL_ind_67_medio/M_ind_67_tot_aux

linkages_67 <- data.frame(c(BL_67,BL_ind_67,FL_67,FL_ind_67,pd_67,pd_ind_67,sd_67,sd_ind_67),row.names = names_SCN)
names(linkages) <- c('BL','BL_ind','FL', 'FL_ind','pd','pd_ind','sd','sd_ind')
write.xlsx(linkages_67,file='Resultados/linkages - 67.xlsx',row.names = T,col.names = T)

####################### Multiplicadores ######################

BL_67_DI <- as.data.frame(t(t(colSums(L_67))%*%as.matrix(L_67)))
names(BL_67_DI) <- 'BL Direto e Indireto'

#Multiplicador Indireto
BL_67_I <- BL_67_DI-BL_67


# Multiplicador Direto, Indireto e Induzido

BL_67_DIR <- as.data.frame(t(t(as.matrix(BL_67))%*%L_67_total),row.names = names_implan)
names(BL_67_DIR) <- 'BL Direto, Indireto e Induzido'

# Sintese dos Multiplicadores

Mult_Sintese_BL_67 <- as.data.frame(c(BL_67,BL_67_I,BL_67_DIR-BL_67_DI,BL_67_DIR),col.names = c("Direto", "Indireto", "Induzido", "Total"),row.names = names_SCN)

