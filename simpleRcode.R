# A really simple code

n = 100
x = seq(1, n)
y = 2*x + rnorm(n, 0, 5)

lm1 <- lm(y~x)
summary(lm1)
fit <- predict (lm1)
yBar <- mean(y)
SStot = sum((y - yBar)^2); SSreg = sum((fit - yBar)^2); SSres = sum((y - fit)^2)
stdErr = sqrt(SSres/(n-p-1))
r2 = 1 - SSres/SStot
p = length(coef(lm1)) - 1
adjR2 = r2 - (1 - r2)*p/(n - p - 1)
fStat = (SSreg/p)/(SSres/(n-p-1))
pvalue = 1 - pf(fStat, p, (n-p-1))

# LM tabs
tab1 <- summary(lm1)$coefficients
tab1 <- signif(tab1, 3)
tab2 <- rbind(ResidStdErr = signif(stdErr, 3), Rsquared = signif(r2, 4), AdjRsquared = signif(adjR2, 4), FStatistic = signif(fStat, 3), pValue = ifelse(pvalue == 0, '<2e-16', pvalue))


# Graph
X11(type = 'dbcairo')
plot(x, y, pch = 19, col = 'grey')
abline(lm1, col = 'blue', lwd = 2)
addtable2plot(0, 150, tab1, bty = 'n', display.rownames = TRUE, title = 'Regression coefs.')
addtable2plot(60, 40, tab2, bty = 'n', display.rownames = TRUE, display.colnames = FALSE, title = 'Regression diagnostic')
title(sub = format(Sys.time(), "%Y-%b-%d"))
savePlot('SimpleReg.png', type = 'png')
dev.off()

