V <- c(1,2,3,4,5,6)
V[1]

L <- matrix(1:6, 2,3)
L[2,3]
L[,2]
L[1,]

cbind(L,c(9,9))
rbind(L,c(9,9,9))

min(V)
max(V)

M <- matrix(1:25,5,5)
min(M[,1])
min(M[,2])
min(M[,3])
min(M[,4])
min(M[,5])

max(M[,1])
max(M[,2])
max(M[,3])
max(M[,4])
max(M[,5])


min(M[1,])
min(M[2,])
min(M[3,])
min(M[4,])
min(M[5,])

max(M[1,])
max(M[2,])
max(M[3,])
max(M[4,])
max(M[5,])

M <- M[-1,]
M <- M[,-4]

A <- matrix(c(2,3,1,4),2,2)
B <- matrix(c(4,11),ncol = 1)
x <- ginv(A) %*% B
