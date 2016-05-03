x <- seq(from = 0, by = 0.1, to = 5);
y <- 2*x^2 + x - 1; 
M <- matrix(c(x,y),ncol=2);
str='Значения функции y = 2*x^2 + x - 1';
write(str, "D:/Univer/Data mining/1/MyFile.txt");
write(M, "D:/Univer/Data mining/1/MyFile.txt", ncolumns = 2, sep="\t\t", append = TRUE);
