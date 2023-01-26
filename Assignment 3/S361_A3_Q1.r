library(DescTools)

X <- read.table("CommercialProperties.txt")
y <- as.numeric(X$V1[2:82])
x1 <- as.numeric(X$V2[2:82])
x2 <- as.numeric(X$V3[2:82])
x3 <- as.numeric(X$V4[2:82])
x4 <- as.numeric(X$V5[2:82])

plot(x4, y)

ym <- vector(mode = "numeric", length = 81)
ym[1:81] <- mean(y)
line1 <- lm(y ~ ym)
line2 <- lm(y ~ x1)
line3 <- lm(y ~ x1 + x2)
line4 <- lm(y ~ x1 + x2 + x3)
line5 <- lm(y ~ x1 + x2 + x3 + x4)
linex <- lm(y ~ x3 + x4)


confint(line5, level=0.99)
summary(line5)


?ScheffeTest
ScheffeTest(line5, g = y)
