# A really simple code

x = seq(1, 20)
y = 2*x + rnorm(length(x))

lm1 <- lm(y~x)
summary(lm1)
plot(x, y, pch = 19, col = 'grey')
abline(lm1, col = 'blue')