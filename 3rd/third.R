data <- read.table(file = "D:/Univer/Data mining/3rd/data8.txt")

X <- as.matrix(data, nrow = 100, ncol = 8)

Xhatch <- matrix(ncol = 8, nrow = 100)

for(i in 1:8)
	for(j in 1:100)
		Xhatch[j,i] <-  (X[j,i] - mean(X[,i])) / sd(X[,i]) 

Cov <- t(Xhatch) %*% Xhatch / 99

D <- 0
for(i in 1:8)
	for(j in 1:8)
		if(i!=j)
			D <- D + Cov[i,j]^2
D <- D*100
chi2 <- qchisq(.95, df=28) 
print(D)
print(chi2)

A <- eigen(Cov)

Z <- Xhatch %*% A$vectors

Cov2 <- t(Z) %*% Z / 99

deltaX <- 0
deltaZ <- 0
for(i in 1:8){
	deltaX <- deltaX + sd(Xhatch[,i])^2;
	deltaZ <- deltaZ + sd(Z[,i])^2;
}

alpha <- matrix(ncol = 8)
gamma <- matrix(ncol = 8)
subDeltaZ <- 0
for(i in 1:8){
	alpha[i] <- sd(Z[,i])^2/deltaZ;
	subDeltaZ <- subDeltaZ + sd(Z[,i])^2;
	gamma[i] <- subDeltaZ/deltaZ;
}	

plot(flipud(Z))