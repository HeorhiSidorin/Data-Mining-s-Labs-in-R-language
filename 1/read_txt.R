filename <- "D:/Univer/Data mining/1/MyFile.txt"
S <- read.table(file = filename, nrows = 1)

A <- read.table(file = filename, skip = 1)

plot(as.matrix(A), main="Function y = 2*x^2 + x - 1", xlab = "Argument x", ylab = "Function y");