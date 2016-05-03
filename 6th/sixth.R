library(kohonen)

data <- read.table(file = "D:/Univer/Data mining/6th/Learning_data8.txt")

data_train <- data
 
data_train_matrix <- as.matrix(scale(data_train))

som_grid <- somgrid(xdim = 2, ydim=2)

som_model <- som(data_train_matrix,	grid=som_grid, alpha = c(0.05, 0.01))

mapping <- map(som_model)

PCAdata <- read.table(file = "D:/Univer/Data mining/6th/PCA_data8.txt")

classif <- mapping$unit.classif
clus <- as.matrix(table(mapping$unit.classif))

s1 <- {}
s2 <- {}
s3 <- {}
s4 <- {}
c1 <- {}
c2 <- {}
c3 <- {}
c4 <- {}

for(i in 1:dim(PCAdata)[1]){
	if(classif[i] == 1){
		c1 = rbind(c1, PCAdata[i,]);
		s1 = rbind(s1, data[i,]);
	}
	if(classif[i] == 2){
		c2 = rbind(c2, PCAdata[i,]);
		s2 = rbind(s2, data[i,]);
	}
	if(classif[i] == 3){
		c3 = rbind(c3, PCAdata[i,]);
		s3 = rbind(s3, data[i,]);
	}
	if(classif[i] == 4){
		c4 = rbind(c4, PCAdata[i,]);
		s4 = rbind(s4, data[i,]);
	}
}

smids <- array(0, c(4,8))
smids[1,] <- apply(as.matrix(s1),2,mean)
smids[2,] <- apply(as.matrix(s2),2,mean)
smids[3,] <- apply(as.matrix(s3),2,mean)
smids[4,] <- apply(as.matrix(s4),2,mean)
par(mfrow=c(2,2))
plot(smids[1,], type="l")
plot(smids[2,], type="l")
plot(smids[3,], type="l")
plot(smids[4,], type="l")

par(mfrow=c(1,1))
plot(smids[1,], type="l", ylab = "smids", col=1, ylim=c(1,10))
par(new=T)
plot(smids[2,], type="l", ylab = "smids", col=2, ylim=c(1,10))
par(new=T)
plot(smids[3,], type="l", ylab = "smids", col=3, ylim=c(1,10))
par(new=T)
plot(smids[4,], type="l", ylab = "smids", col=4, ylim=c(1,10))

mids <- array(0, c(4,2))
mids[1,] <- apply(as.matrix(c1),2,mean)
mids[2,] <- apply(as.matrix(c2),2,mean)
mids[3,] <- apply(as.matrix(c3),2,mean)
mids[4,] <- apply(as.matrix(c4),2,mean)
par(mfrow=c(1,1))
plot(PCAdata, col = classif)
points(mids, col=1:4, pch = 8)