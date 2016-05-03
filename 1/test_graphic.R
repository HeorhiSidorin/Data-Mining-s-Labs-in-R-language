x <- seq(from = 0, to = 6.28, by = 0.1)

y <- sin(x)

plot(x,y,xlab="Argument x", ylab="Function y", main="Function sin(x)")

tiff(filename="D:/Univer/Data mining/1/plot.tiff", res=200)
plot(x,y,xlab="Argument x", ylab="Function y", main="Function sin(x)")
dev.off()