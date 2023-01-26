#load in variables from file
table <- read.table("drug.txt")
x1 <- as.numeric(table$V1[2:20])
x2 <- as.numeric(table$V2[2:20])
x3 <- as.numeric(table$V3[2:20])
y <- as.numeric(table$V4[2:20])

#perform initial analysis of model
model1 <- lm(y ~ x1 + x2 + x3)
summary(model1)
?plot
plot(x1, y)
plot(x2, y)
plot(x3, y)
#point 3 (with y=0.56) appears to be outlier

#compute influence statistics
leverage <- as.vector(hatvalues(model1))
print(leverage)
#point 3 has by far highest leverage (0.85), points 5 and 13 also high

#compute cook's distance
cooks <- cooks.distance(model1)
print(cooks)
#Again point 3 has the highest by far, but 5, 13 and 19 also high

#compute DFFITS
DFFITS <- as.vector(dffits(model1))
print(DFFITS)
# Point 3 has largest magnitude DFFIT by far, 5, 13 and 19 all close to +- 1

#compute DFBETAS
DFBETAS <- as.data.frame(dfbetas(model1))
print(DFBETAS)
#Yet again points 3, 5, 13, 19 yield most influence, but more info gained:
#3 affects x1 and x3 coefficients greatly
#points 5, 13, 19 affect (inter, x2), (inter, x2), (inter) heavily
#points 5 and 13 likely have an effect on x2's p-value being so high initially

#point 3 is the most influential point, so will be removed
model_new <- lm(y[-3] ~ x1[-3] + x2[-3] + x3[-3])
summary(model_new)

