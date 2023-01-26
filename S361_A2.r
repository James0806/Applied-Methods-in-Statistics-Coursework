x <- read.table("flow.txt")
Qo <- as.numeric(x$V1[2:11])
Qp <- as.numeric(x$V2[2:11])
x1 <- as.numeric(x$V3[2:11])
x2 <- as.numeric(x$V4[2:11])
x3 <- as.numeric(x$V5[2:11])
x4 <- as.numeric(x$V6[2:11])

Y <- log(Qo / Qp)

md4in <- lm(Y ~ x1 + x2 + x3 + x4)
md4 <- lm(Y ~ x1 + x2 + x3 + x4 - 1)
md2 <- lm(Y ~ x1 + x4 - 1)

summary(md4in)
summary(md4)
summary(md2)

