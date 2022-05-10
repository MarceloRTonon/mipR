
No caso de data frames, eles compartilham características tanto de listas quanto de matrizes. Lembrando aqui o que foi dito no Tópico 1, para você pensar que um `data.frame` **é** uma lista de vetores atômicos. Pois a verdade é que o `data.frame` ***é*** uma `class` (classe) especial do tipo `list`. Veja abaixo para entender:
  
  ```{r}

#A forma de definir ambas é bastante parecida!

df <- data.frame("A" = c("a", "b", "c"), "B" = c(1:3))

lista <- list("A" = c("a", "b", "c"), "B" = c(1:3))

# Conferindo o tipo das duas usando typeof (ambas são listas):

typeof(df)
typeof(lista)

# Usando == e identical para garantir que é a mesma coisa:

typeof(df) == typeof(lista)

identical(typeof(df), typeof(lista))

# Vendo agora a classe de cada uma:

class(lista)

class(df)

# Convertendo df para matrix

matrix_df <- as.matrix(df)

# typeof irá retorna o tipo de dado que está contido
typeof(matrix_df)
# class irá mostrar a class da estrutura de dados de matriz
class(matrix_df)
```

Temos `matrix` e `array` como o retorno de `class(matrix_df)`. `array` é um vetor atômico que possuí dimensões como linhas e colunas por exemplo. `matrix` é um caso especial de `array`, que possuí linhas e colunas apenas. Um `array` pode possuir mais do que essas dimensões.
