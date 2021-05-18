
exemplo_sala_13 <- read_excel("top2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls",   sheet = "13", range = "C4:Dy4", col_names = FALSE)

exemplo_sala_13_b <- read_excel("top2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls",   sheet = "13", range = "A3:B3", col_names = FALSE)


exemplo_sala_13 <- c(exemplo_sala_13_b, exemplo_sala_13)

sheet_13 <- read_excel("top2/Matriz_de_Insumo_Produto_2015_Nivel_67.xls", 
                     sheet = "13", range = "A6:DY72", col_names = unlist(exemplo_sala_13))