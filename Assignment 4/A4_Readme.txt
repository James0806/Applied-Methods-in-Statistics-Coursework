1. #After using backward elimination and stepwise regression, we see that model3, the 4-degree polynomial, is best. We 
also note that forcing intercept=0 makes sense, since if a plant has 0 volume (i.e. it does not exist) then it should
have no dryweight and vica versa, so x=0 iff y=0. Further, fitting intercept=0 allows for a model that has lower p-values
on each input variable and alo a higher adjusted r^2 value, so this is obviously the better choice. We thus have the final model
Y ~ 0 + I(x^2) + I(x^3) + I(x^4)

2. a) Upon fitting the intial model y ~ x1 + x2 + x3, the model does not appear to be very good at predicting y. Plotting y 
against x1, x2 and x3 indivudally reveals only a very weak slight positive correlation, and the data point with y=0.56 appears
to be an outlier from all of these graphs. Analyzing the summary of the model shows that x2 appears to have the weakest
correlation, with a p value of 0.42, and the adjusted r^2 is unsatisfactory (0.24).

c) By observing all of the influence statistics in part b), it was clear that point 3 (with y = 0.56) was by far the most
influential point. Points 5, 13 and 19 also appeared to yeild considerable influence, though none were as high as point 3.
Refitting the model with point 3 removed yields a new model in which each regression coefficient has a significantly lower
p-value and the adjusted R^2 value is greater. We can thus confirm that point 3 was an outlier, and was rightfully removed
from the model.
