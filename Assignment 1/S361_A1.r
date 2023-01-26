x <- read.table("Forbes.txt")
t <- t(x[1])
p <- t(x[2])
t <- t[-1]
p <- p[-1]
t <- as.numeric(t)
p <- as.numeric(p)

plot(t, p, main="Pressure vs. Temperature", xlab="Temperature", ylab="Pressure")  
model <- lm(p~t)
abline(model)
res <- resid(model)
plot(fitted(model), res, main="Residuals vs. Fitted Values", xlab="Fitted Values", ylab="Residuals")
abline(0, 0)

p_logscaled <- 100 * log10(p)
print(p_logscaled)
plot(t, p_logscaled, main="log-scaled Pressure vs. Temperature", xlab="Temperature", ylab="Log-scaled Pressure")
model <- lm(p_logscaled~t)
abline(model)

av <- aov(model)
pls_mean = mean(p_logscaled)
res <- resid(model)
ressq <- res^2
print(res)
corr <- (p_logscaled - pls_mean)^2
rsq = 1- (sum(ressq) / sum(corr))

t_mean <- mean(t)
temp_squares <- (t - t_mean)^2
temp_ssq <- sum(temp_squares)
print(model$coefficients[2])

res <- resid(model)
plot(fitted(model), res, main="Residuals vs. Fitted Values (Log-Scaled Pressure)", xlab="Fitted Values", ylab="Residuals")
abline(0, 0)

df <- data.frame((t=200))
predict(model, newdata= df, interval="prediction", level = 0.99)
predict(model, newdata= df, interval="confidence", level = 0.99)






