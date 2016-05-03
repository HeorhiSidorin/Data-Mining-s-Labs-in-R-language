data <- read.table(file = "D:/Univer/Data mining/5th/data8.txt")

colnames(data) <- c("x","y")
plot(data)

cl = kmeans(data, 3)

plot(data, col = cl$cluster)
points(cl$centers, pch = 8)

C <- array(c(0.25, 2, 2.8, 0.8, 2.1, 4.2), c(3,2))

U <- array(0, dim(data))

Q <- 1000;
Qm <- 0;
eps <- 0.001;
m <- 1

repeat{
	clus <- array(0, c(3,1));
	for(i in 1:dim(data)[1]){
		for(k in 1:3){
			clus[k] = dist(rbind(C[k,],data[i,]), method =  "minkowski", p = 4);	
		}
		U[i,1] = which.min(clus);
		U[i,2] = min(clus);	
	}

	Qm <- sum(U[i,2]^2);

	C <- array(0, c(3,2))
	c1 <- 0;
	c2 <- 0;
	c3 <- 0;
	for(i in 1:dim(U)[1]){
		if(U[i,1] == 1) {
			C[1,1] <- C[1,1] + data[i,1];
			C[1,2] <- C[1,2] + data[i,2];
			c1 <- c1 + 1;
		}
		if(U[i,1] == 2) {
			C[2,1] <- C[2,1] + data[i,1];
			C[2,2] <- C[2,2] + data[i,2];
			c2 <- c2 + 1;
		}
		if(U[i,1] == 3) {
			C[3,1] <- C[3,1] + data[i,1];
			C[3,2] <- C[3,2] + data[i,2];
			c3 <- c3 + 1;
		}
	}	

	C[1,] <- C[1,]/c1
	C[2,] <- C[2,]/c2
	C[3,] <- C[3,]/c3

  	if(abs(Q-Qm) < eps){
    		break
  	}
	Q <- Qm;
	m <- m + 1
}

plot(data, col = U[,1])
points(C, col = 1:3, pch = 8)