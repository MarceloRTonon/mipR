library(magrittr)
# Para controlar os valores aleatórios usamos a função set.seed (o aleatorio será sempre o msm)
set.seed(1)

# MIP no R
# x = U_d + f_d

f_d <- runif(3, min= 1, max = 10)
U_d <- runif(3^2, min =1, max = 10) %>% matrix(nrow =3)
x <- rowSums(U_d)+f_d


# U_d = A_d x -> A_d = U_d_ij/x_i
# Pegadinha no R: qual o problema de fazer U_d/x ???
U_d/x

# Vamos usar diag(x)
diag(x)

# A primeira vista os dois valores abaixo deveriam dar o mesmo resultado. Por que não dão?

U_d/diag(x)
U_d%*%diag(1/x)


A_d <- U_d%*%diag(1/x)

A_d%*% diag(x)
U_d
(A_d%*%diag(x))==U_d

# Por que não dá TRUE para todas as células acima?

all.equal(U_d, A_d%*%diag(x))

sqrt(.Machine$double.eps) # "erro" computacional

# Quais testes queremos fazer aqui??

# Matriz Identidade
I_matrix <- diag(3)

# A função diag é muito flexível. O seu comportamento vai variar de acordo com o input que você der a ela.
#Exemplos
x %>% c() %>% diag()
x %>% matrix(nrow=3) %>% diag()
# Na lista de exercicios do Tópico 1 tem uma seção específica só para entender a função diag!

# Inversa de Leontief
# L = [I-A]^(-1)
# Para inverter uma matriz usamos a função solve.

Leon_Inv <- solve(I_matrix-A_d)

Leon_Inv

# Com L podemos fazer:
# x = L f_d

all.equal(x,Leon_Inv%*%f_d)

# Lendo a mensagem de erro, você consegue dizer porque não retornou TRUE?

x %>%
  matrix(nrow=3) %>%
  all.equal(Leon_Inv%*%f_d)

listaMIP <- list(f_d = f_d,
                 U_d = U_d,
                 x = x,
                 Leon_Inv = Leon_Inv,
                 A_d = A_d)

# Vamos agora para uma coisa divertida.
#Imagina que você quer gerar todas as 5 matrizes acima só que para a 5 setores.
# Só que aí você também pensa: 
# "ahhh, amanha pode ser que eu queira 10 setores..."
# O que fazer? Criar uma função!


