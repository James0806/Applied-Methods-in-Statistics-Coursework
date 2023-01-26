#read in table, create independent and dependent variables
table <- read.table("dryweight.txt")
y <- as.numeric(table$V1[2:36])
y <- y^(1/2)
x <- as.numeric(table$V2[2:36])
x <- log(x+1)

#use backward elimination, removing predictor with highest p 
#value each time until every p-val < 0.05 (roughly)
model1 <- lm(y ~ x + I(x^2) + I(x^3) + I(x^4))
summary(model1)
model2 <- update(model1, .~. -x)
summary(model2)
model3 <- lm(y~ 0 + I(x^2) + I(x^3) + I(x^4))
summary(model3)
#each p-value is (roughly) less than 0.05, and adj. R^2 is
#large (0.9496), so model3 is satisfactory

#use stepwise regression to confirm findings
model4 <- step(model1)
summary(model4)
#model is too simplistic and has lower r^2, so try removing intercept
model5 <- lm(y~0 + x + I(x^2) + I(x^3) + I(x^4))
model6 <- step(model5)
summary(model6)
#arrive at model3 again, so stepwise regression confirms
#model3 (y ~ 0 + I(x^2) + I(x^3) + I(x^4)) is best.

