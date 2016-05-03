library(cluster)

data <- read.table(file = "D:/Univer/Data mining/4th/data8.txt")

plot(data, col="blue")

d0 <- as.matrix(data)


hclustfunc <- function(method, dmeth) {
	d1 <- dist(d0, method = dmeth);    
	hc <- hclust(d1, method = method);
	d2 <- cophenetic(hc);
	cor(d1,d2)
}

cophh <- matrix(ncol = 3, nrow = 3)
cophh[1,1] <- hclustfunc("complete", "euclidean")
cophh[1,2] <- hclustfunc("complete", "canberra")
cophh[1,3] <- hclustfunc("complete", "minkowski")
cophh[2,1] <- hclustfunc("average", "euclidean")
cophh[2,2] <- hclustfunc("average", "canberra")
cophh[2,3] <- hclustfunc("average", "minkowski")
cophh[3,1] <- hclustfunc("median", "euclidean")
cophh[3,2] <- hclustfunc("median", "canberra")
cophh[3,3] <- hclustfunc("median", "minkowski")

maxCoph <- max(cophh)
minCoph <- min(cophh)

d1 <- dist(d0, method = "euclidean");    
hc <- hclust(d1, method = "average");
plot(hc)
rect.hclust(hc, k=6, border="red")

plot(d0)

groups <- cutree(hc, k=6)

clus1 <- {}
clus2 <- {}
clus3 <- {}
clus4 <- {}
clus5 <- {}
clus6 <- {}
mids <- array(0, c(6,2))
disps <- array(0, c(6,2))
distances <- array(0, c(6,6))
for(i in 1:36){
	if(groups[i] == 1) 
		 clus1 = rbind(clus1, data[i,]);
	if(groups[i] == 2) 
		 clus2 = rbind(clus2, data[i,]);
	if(groups[i] == 3) 
		 clus3 = rbind(clus3, data[i,]);
	if(groups[i] == 4) 
		 clus4 = rbind(clus4, data[i,]);
	if(groups[i] == 5) 
		 clus5 = rbind(clus5, data[i,]);
	if(groups[i] == 6) 
		 clus6 = rbind(clus6, data[i,]);
}

mids[1,1] = mean(as.matrix(clus1)[,1]);
mids[1,2] = mean(as.matrix(clus1)[,2]);
disps[1,1] = sd(as.matrix(clus1)[,1])^2;
disps[1,2] = sd(as.matrix(clus1)[,2])^2;
for(i in 1:6)
	distances[1,i] <- sqrt((clus1[i,1] - mids[1,1])^2 + (clus1[i,2] - mids[1,2])^2)

mids[2,1] = mean(as.matrix(clus2)[,1]);
mids[2,2] = mean(as.matrix(clus2)[,2]);
disps[2,1] = sd(as.matrix(clus2)[,1])^2;
disps[2,2] = sd(as.matrix(clus2)[,2])^2;
for(i in 1:6)
	distances[2,i] <- sqrt((clus2[i,1] - mids[1,1])^2 + (clus2[i,2] - mids[1,2])^2)

mids[3,1] = mean(as.matrix(clus3)[,1]);
mids[3,2] = mean(as.matrix(clus3)[,2]);
disps[3,1] = sd(as.matrix(clus3)[,1])^2;
disps[3,2] = sd(as.matrix(clus3)[,2])^2;
for(i in 1:6) 
	distances[3,i] <- sqrt((clus3[i,1] - mids[1,1])^2 + (clus3[i,2] - mids[1,2])^2)

mids[4,1] = mean(as.matrix(clus4)[,1]);
mids[4,2] = mean(as.matrix(clus4)[,2]);
disps[4,1] = sd(as.matrix(clus4)[,1])^2;
disps[4,2] = sd(as.matrix(clus4)[,2])^2;
for(i in 1:6)
	distances[4,i] <- sqrt((clus4[i,1] - mids[1,1])^2 + (clus4[i,2] - mids[1,2])^2)


mids[5,1] = mean(as.matrix(clus5)[,1]);
mids[5,2] = mean(as.matrix(clus5)[,2]);
disps[5,1] = sd(as.matrix(clus5)[,1])^2;
disps[5,2] = sd(as.matrix(clus5)[,2])^2;
for(i in 1:6)
	distances[5,i] <- sqrt((clus5[i,1] - mids[1,1])^2 + (clus5[i,2] - mids[1,2])^2)


mids[6,1] = mean(as.matrix(clus6)[,1]);
mids[6,2] = mean(as.matrix(clus6)[,2]);
disps[6,1] = sd(as.matrix(clus6)[,1])^2;
disps[6,2] = sd(as.matrix(clus6)[,2])^2;
for(i in 1:6)
	distances[6,i] <- sqrt((clus6[i,1] - mids[1,1])^2 + (clus6[i,2] - mids[1,2])^2)

distBetweenCenters <- dist(mids, method = "euclidean")

plot(data, col=groups)
points(mids, col = groups, pch = 8)