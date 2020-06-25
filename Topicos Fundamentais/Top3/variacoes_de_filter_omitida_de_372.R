##### (decidindo se farei) Variações de `filter` 

Existem três variações de `filter`: `filter_all`, `filter_if` e `filter_at`. Iremos explicar aqui as duas primeiras variações, pois a terceira é complexa demais para esse estágio. De todo modo, `filter_all` e `filter_if` são filtram uma base de dados aplicando um predicando a todas as variáveis. Esses predicados devem ser expostos com `all.vars()` ou `any_vars()`.

```{r}
#filtrando as linhas de airquality que algum dos seus valores for NA
# você deve usar o . para se referir as variáveis.
# Ex1: airquality %>% filter_all(any_vars(is.na()))
# Ex1 acima iria retornar um erro.
airquality %>% filter_all(any_vars(is.na(.))) %>% head()

#filtrando as linhas de airquality que TODOS os seus valores forem NA
airquality %>% filter_all(all_vars(is.na(.)))

```



