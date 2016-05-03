my_func <- function(X_left, X_right, Y_left, Y_right, N){
	X=X_left + runif(N)*(X_right - X_left);
	Y=Y_left + runif(N)*(Y_right - Y_left);
	list(X = X, Y = Y)
}

my_gauss_gen <- function(n){
	rnorm(n)
}