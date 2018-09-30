#mtcars linear regression
install.packages('olsrr')
library(olsrr)
model = lm(mpg ~ wt + disp +  hp + qsec, data=mtcars)
model = ols_step_all_possible(model)
model
plot(model)


#create modela nd check which model is better
(m1 = lm(mpg ~ wt, data=mtcars))
summary(m1)
(m2 = lm(mpg ~ wt + disp +  hp + qsec, data=mtcars))
summary(m2)
anova(m1,m2)
AIC(m1,m2)
