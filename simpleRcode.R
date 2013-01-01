# A really simple code

n = 100
x = seq(1, n)
y = 2*x + rnorm(n, 0, 5)

lm1 <- lm(y~x)
summary(lm1)
X11(type = 'dbcairo')
plot(x, y, pch = 19, col = 'grey')
abline(lm1, col = 'blue')
