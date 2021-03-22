
# Comecei a estudar isso daqui para melhorar meu domínio da função flatten,
#e vi que era muito bom para manipular a estrutura de listas e coisas do gênero.
#


# Aviso de gatilho: vai ter um pouco de pyramid of doom code aqui. 
# Prometo que é só um pouco.

library(purrr)
library(magrittr)

# The good

nice_pyramid <- list("a_"= list("alpha_" = list("a_alpha_.y1" = list(), "a_alpha_y2" = list()),
               "a_beta_" = list("a_beta_y1" = list(), "a_beta_y2" = list())),
     "b_"= list("b_alpha_" = list("b_alpha_.y1" = list(), "b_alpha_y2" = list()),
               "b_beta_" = list("b_beta_y1" = list(), "b_beta_y2" = list()))
)

# Vamos usar names para deixar claro a situação

lista_em_piramide %>%
  names() # Como esperado "a_" e "b_".

# Usando flatten uma vez, temos:
lista_em_piramide %>%
  purrr::flatten() %>%
  names()

# Podemos usar flatten várias vezes
lista_em_piramide %>%
  purrr::flatten() %>%
  purrr::flatten() %>%
  names()

# Pode ser útil também da seguinte forma:

lista_em_piramide %>% .[c("a_")] %>% map(~ .x) %>% flatten


# The bad

# No entanto não é muito indicado usar flatten DIRETAMENTE quando os nomes dos elementos das sublistas forem iguais
#Veja abaixo o caso

notSoNice_pyramid <- list("a_"= list("alpha_" = list("a_alpha_y1" = list(), "a_alpha_y2" = list()),
                                     "beta_" = list("a_beta_y1" = list(), "a_beta_y2" = list())),
                           "b_"= list("alpha_" = list("b_alpha_y1" = list(), "b_alpha_y2" = list()),
                                     "beta_" = list("b_beta_y1" = list(), "b_beta_y2" = list()))
)


notSoNice_pyramid %>% names()

notSoNice_pyramid %>% purrr::flatten() %>% names()

#Temos que "alpha_" e "alpha_" repetem-se duas vezes cada um. 
#Isso é um problema, em especial para subseting.
#Vamos fazer o subset de beta_ para exemplificar

# Vamos tentar acessar o que antes era:

notSoNice_pyramid$b_$beta_ %>% names


# Usando o operador $
notSoNice_pyramid %>% purrr::flatten() %$% beta_

# Usando o subseting do base R normal com [[]]

notSoNice_pyramid %>% purrr::flatten() %>% .[["beta_"]] %>% names

# Repare que sempre retorna o mesmo "beta_" 
# Se por um lado é positivo (mesma operação retorna o mesmo resultado),
# não conseguimos acessar o segundo "beta_" pelo nome. E se tentassemos chamar os dois 'beta_'s?

notSoNice_pyramid %>% purrr::flatten() %>% .[c("beta_", "beta_")] %>% flatten %>% names()

# Isso pode gerar problemas no seguinte nível:

notSoNice_pyramid %>% purrr::flatten() %>% .[[names(.)[4]]] %>% names

# Ou seja: usando um comando específico para um determinado valor, a gente obtém outro. 

# De todo modo, para acessar o "segundo beta_" só usando índice.

#É necessário usar o índice:

notSoNice_pyramid %>% purrr::flatten() %>% .[[4]]

# De modo geral, isso NÃO É UMA BOA PRÁTICA.
# É preferível usar os nomes, a ter que saber o índice de antemão.

# Como eu não quis assustar todos de primeira, no caso de notSoNice_pyramid podemos ter um final feliz

# Nesse caso temos que usar flatten duas vezes resolveria o problema:

notSoNice_pyramid %>% purrr::flatten() %>% purrr::flatten() %>% names()

# No entanto, você pode ter casos de ter

nightmare_pyramid <- list("a_"= list("alpha_" = list("alpha_y1" = list(), "alpha_y2" = list()),
                                      "beta_" = list("beta_y1" = list(), "beta_y2" = list())),
                           "b_"= list("alpha_" = list("alpha_y1" = list(), "alpha_y2" = list()),
                                      "beta_" = list("beta_y1" = list(), "beta_y2" = list()))
)

# Nesse caso, você teria cada nome duas vezes ao usar flatten duas vezes.

nightmare_pyramid %>% flatten %>% flatten

# Mesmo problema.

#Porém, esse não é o pior caso

trueNightmare_pyramid <- list("a_"= list("alpha_" = list("y1" = list(), "y2" = list()),
                                      "beta_" = list("y1" = list(), "y2" = list())),
                           "b_"= list("alpha_" = list("y1" = list(), "y2" = list()),
                                      "beta_" = list("y1" = list(), "y2" = list()))
)

# Quatro vezes cada nome! Imagine that!

trueNightmare_pyramid %>% flatten %>% flatten %>% names

# O usuário de R mais experiente pode estar se perguntando porém:
# okok, é meio chato, porém a gente tem unlist(). Claro. Temos sim. Vamos ver então

trueNightmare_pyramid %>% unlist()

# Ops, _mea culpa_^[Nem tanto despropositalmente, eu devo dizer.].
# Todas as listas até então são feitas só de outras listas sem nada além disso.
# E isso já fala a primeira diferença entre unlist e flatten: o tipo retornado.
# Como já vimos sobre coerção de tipos de dados, existem tipos dos mais flexíveis (logical) aos menos flexíveis (character).
# O mais flexível sempre se converte ao menos flexível, porém nem sempre o inverso ocorre^[Não vamos entrar muito nisso aqui]:

# Repare que nenhum NA indesejado^[NA é um tipo lógico,
#porém ele aparece em todos os outros tipos. Ele é do tipo lógico, justamente para ser mais flexível e aparecer em todos os tipos.]
# aparece embaixo na hora de coergir um vetor lógico para characther

v_lgl <-  c(TRUE, F, T, TRUE, TRUE, FALSE) 

  v_lgl %>%
  as.character()

# Porém, se os valores do tipo character não seguirem um certo padrão, eles viram NA
chr_lgl <- c("TRUE", "F", "T", "TrUe", "tRuE", "FaLsE")

  chr_lgl %>%
  as.logical

# A conversão de um tipo menos flexível (no caso de ) para um mais flexível só ocorre pois os valores do vetor character são próprios para o tipo lógico.
# Para que isso fique mais claro, vamos colocar situações abaixo: 
# (o valor em parênteses indica o quão flexível é cada tipo, sendo quanto maior, mais flexível é):


# character(1) -> logical(4) -> double(3)

chr_dbl1 <- chr_lgl %>% #(1)
  as.logical %>% #(4)
  as.double #(3)


# character(1)  -> double(3)
chr_dbl2 <- chr_lgl %>% #(1)
  as.double() #(3)

# chr_lgl para dbl
tibble("chr_original" = chr_lgl,
       "Coerção Indireta" = chr_dbl1,
           "Coerção Direta" = chr_dbl2)

lgl_dbl <- v_lgl %>%
  as.double()

lgl_dbl2 <- v_lgl %>%
  as.character %>%
  as.double()


lgl_int <- v_lgl %>%
  as.integer

lgl_int2 <- v_lgl %>%
  as.character %>%
  as.integer

lgl_chr <- v_lgl %>%
  as.character()

lgl_chr2 <- v_lgl %>%
  as.double() %>%
  as.character



tibble("lgl Original" = v_lgl,
       "int Direto" = lgl_int,
       "int Indireto" = lgl_int2,
       "chr Direto" = lgl_chr,
       "chr Indireto" = lgl_chr2,
       "dbl Direto" = lgl_dbl,
       "dbl Indireto" = lgl_dbl2)

#Repare que, uma vez que não há nenhuma NA em v_lgl, e lgl é o tipo mais flexível, nunca é introduzido um NA na hora de converter diretamente de um tipo mais flexível para outro menos flexível. 
#Perceba que na coluna `chr Indireto` não há nenhum NA introduzido, pois dbl é mais flexível do que chr.

# Isso tudo se aplica a unlist, pelo fato de que unlist transforma a lista num vetor atômico. Custe o que custar.
# Então uma lista de profundidade alta (vec_depth) vai terminar sempre como um vetor atômico cuja profundidade é sempre igual à 1, enquanto flatten, vai apenas tirar uma camada de profundidade.
# O leitor mais atento já concluiu que unlist além do mais vai coergir todos os valores para um mesmo tipo (o menos flexível entre os valores presentes).
# Nessa altura do texto, o leitor talvez já tenha sacado a relação disso com o valor de trueNightmare_Pyramid %>% unlist ser NULL:
# Como as listas estão todas vazias, não há valor para preencher o vetor atômico, logo se torna um vetor vazio.
# É tal o caso, que o comprimento e profundidade do vetor são iguais à zero.

nightmare_pyramid %>% unlist %>% list("Valor" = .,
                                      "Comprimento" = length(.),
                                      "Profundidade" = vec_depth(.))

# Então vamos criar uma lista preenchida. 
# Primeiro um caso (nem tão) bem comportado.

Cabulous_Pyramid <- list("Nacionais" = list("CampeonatoBrasileiro"= list("C" = list("Santos" = 1966,
                                                                       "Santos" = 2003,
                                                                       "Gremio" = 2013,
                                                                       "SaoPaulo" = 2014),
                                                      "VC" = list("Palmeiras" = 1969,
                                                                           "Vasco" = 1974,
                                                                           "Internacional" = 1975,
                                                                           "Corinthians" = 1998,
                                                                           "Fluminense" = 2010)),
                                            "CopadoBrasil" = list("C" = list("Gremio" = 1993,
                                                                  "Palmeiras" = 1996,
                                                                  "SaoPaulo" = 2000,
                                                                  "Flamengo" = 2003,
                                                                  "Flamengo"= 2017,
                                                                  "Corinthians" = 2018))),
                         "Internacionais" = list("CopaLibertadores" = list("C" = list("RiverPlate" = 1976,
                                                                    "SportingCristal" = 1997),
                                                   "VC" = list("BocaJuniors" = 1977,
                                                                        "Estudiantes" = 2009)),
                                                 "RecopaSulAmericana" = list("C" = list("River Plate" = 1998)),
                                                      "SuperCopaLibertadores" = list("C" = list("River Plate" = 1991,
                                                                                                "Racing" = 1992)))
                                                 )


# Pedimos desculpas pelo código embaralhado, mas é que são muitos títulos.
# Na lista acima, indica quando o cabuloso foi campeão e vice-campeão do Brasileirão e na Copa Libertadores da América.
# Os nomes dos times em "C" indica os times que ficaram em segundo lugar no ano que ele foi campeão.
# E os nomes dos times em "VC" indica os que ganharam o torneio quando o Cabuloso foi vice-campeão.
# Ou seja, é sempre o clube que disputou na ponta.

# Querendo ver os nomes:
Cabulous_Pyramid  %>% names()

# Usando flatten, temos:

Cabulous_Pyramid %>% flatten %>% names()
Cabulous_Pyramid %>% flatten %>% flatten %>% names()
Cabulous_Pyramid %>% flatten %>% flatten %>% flatten %>% names()

#Neste caso, o nome "Santos", "Gremio", "SaoPaulo", "Flamengo", "Palmeiras" se repete duas vezes. Assim, o mesmo problema que tivemos antes, teriamos agora. 
#Ou seja, especialmente para um clube que tem muita história,
# que não tem apenas uma conquista de cada título, isso poderia vir a ser um problema.

# Vamos então usar unlist:

Cabulous_Pyramid %>% unlist %>% names

# Os nomes ficam horrorosos, porém, não fica apenas os nomes dos times como antes.
# Ainda sim, o nomes se repetem. Em algumas situações, como para o "Santos" e o "Flamengo", ambos vices duas vezes.

# E isso de novo trás o problema do subsetting:
Cabulous_Pyramid %>% unlist %>% .["Nacionais.CampeonatoBrasileiro.C.Santos"]
Cabulous_Pyramid %>% unlist %>% .["Nacionais.CopadoBrasil.C.Flamengo"]



lista_coercoes <- list("lgl" = list( "Original" = v_lgl),
       "int" = list("Direto" = lgl_int,
                    "Indireto" = lgl_int2),
       "chr" = list("Direto" = lgl_chr,
                    "Indireto" = lgl_chr2),
       "dbl" = list("Direto" = lgl_dbl,
                    "Indireto" = lgl_dbl2))

# Ok, vamos ver ok acontece então, usando unlist():

lista_coercoes %>% unlist

#Repare que todos os valores aparecem com nomes.
#Perceba que o número no final de cada nome indica a ordem desse elemento na 
#Isso é bom, porém é importante ter em mente (como veremos mais à frente) que num vetor atômico, não se usa subsetting via nome.
# Podemos resolver isso fazendo:

lista_coercoes %>% unlist %>% as.list %>% 


