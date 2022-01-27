
eta0 <-c(1,1,1,
  0,1,1,
  1,1,1) |> matrix(nrow=3)

eta1 <- eta0
all.equal(A_0, A_1)

A_T0 <- c(0.2, 0.2, 0.4,
         0, 0.3, 0.1,
         0.3, 0.4, 0.2) |> matrix(nrow=3)

A_T1 <- c(0.2, 0.2, 0.4,
          0.5, 0.3, 0.1,
          0.3, 0.4, 0.2) |> matrix(nrow=3)
all.equal(A_T0, A_T1)

A_0 <- eta0 * A_T0
A_1 <- eta1 * A_T1
all.equal(A_0, A_1)

L_0 <- solve(diag(3)-A_0)
L_1 <- solve(diag(3)-A_1)
all.equal(L_0, L_1)

D_eta <- eta1 - eta0
D_AT <- A_T1 - A_T0

# DL_DAT != 0
DL_DAT <- ((L_0 %*% D_AT %*% L_1)+(L_1 %*% D_AT %*% L_0))/2
# DL_Deta == 0
DL_Deta <- ((L_0 %*% D_eta %*% L_1)+(L_1 %*% D_eta %*% L_0))/2
DL <- L_1 - L_0 # Nada mudou em L, DL==0
#Porém a soma dará valores diferentes de 0
all.equal(DL_DAT+DL_Deta, DL)

DL_DAT+DL_Deta