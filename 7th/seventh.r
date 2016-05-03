library(plot3D)

source("D:/Univer/Data mining/7th/my_func.R")

xs <- matrix(seq(from = -5, to = 5, by = 0.25))
ys <- matrix(seq(from = -5, to = 5, by = 0.25))

XY <- mesh(xs,ys)
 
surf3D(x = XY$x,
       y = XY$y,
       z = my_func(XY$x,XY$y),
       colkey=FALSE,
       bty="f")

N <- 100000
A <- array(c(-5,5))
X <- A[1] + (A[2]-A[1])*runif(N)
Y <- A[1] + (A[2]-A[1])*runif(N)
SimpleRes <- my_func(X,Y)
SimpleResMin <- min(SimpleRes)
XMin <- X[which.min(SimpleRes)]
YMin <- Y[which.min(SimpleRes)]


T = 50;
To = 0.001;
v = 0.95;

X <- array(5, 2);
Xk <- array(0,2);
l <- 0;
repeat{
	l <- l + 1;
	while(5>3){
		Xk[1] <- X[1] + rnorm(1) * T * ((1 + l/T)^(2*runif(1) - 1) - 1);
		Xk[2] <- X[2] + rnorm(1) * T * ((1 + l/T)^(2*runif(1) - 1) - 1);
		if(Xk[1] < 5 && Xk[1] > -5 && Xk[2] < 5 && Xk[2] > -5)
			break
	}

	deltaE <- my_func(Xk[1], Xk[2]) - my_func(X[1], X[2]);
	if(deltaE < 0){
		X <- Xk;
	}
	else {
		P = exp(-deltaE/T);
		if(runif(1)	< P){
			X <- Xk;
		} 
		else{
			T <- T*v;
		}
	}

	if(T < To){
		break
	}
}