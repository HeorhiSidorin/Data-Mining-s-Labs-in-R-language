X_left <- -2;  
X_right <- 2;  
Y_left <- -3;  
Y_right <- 3;  
N <- 1000;
source("D:/Univer/Data mining/1/my_func.R")
ans <- my_func(X_left, X_right, Y_left, Y_right, N);  
plot(ans$X,ans$Y, pch = 8)

BinNumber <- 20;   
hist(ans$X,BinNumber, main="Some name", xlab="X label", ylab = "Y label");  
hist(ans$Y,BinNumber, main="Some name", xlab="X label", ylab = "Y label");

hist(my_gauss_gen(BinNumber),BinNumber, xlab="X label", ylab = "Y label")