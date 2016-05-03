source("D:/Univer/Data mining/1/vrosenbrock.R")

xs <- matrix(seq(from = -5, to = 5, by = 0.5))
ys <- matrix(seq(from = -5, to = 5, by = 0.5))

XY <- mesh(xs,ys)
 
surf3D(x = XY$x,
       y = XY$y,
       z = vrosenbrock(XY$x,XY$y),
       colkey=FALSE,
       bty="b2")