f <- function(n){
	x <- sample(1:n)
	y <- matrix(x, 2, n/2)
	z <- matrix(x, n/2, 2)
	y.z <- (y %*% z)
	apply(yz, mean, 1)
}
