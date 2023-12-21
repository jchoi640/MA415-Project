

hist(birthdata$mager, main="Histogram of Mother's Age", xlab="Mother's Age")

commotheragemodel <- lm(log(mager) ~., data=combirth)
summary(commotheragemodel)
AIC(commotheragemodel)

library(ggplot2)

ggplot(combirth, aes(y = mager, x = meduc, color = Race)) +
  geom_smooth(method = "gam", formula = y ~ s(x, k = 5))+
  labs(x = "Education Level", y = "First Kid Birth Age", 
       title = "First Kid Birth Age vs Prepreg Education Level")

ggplot(combirth, aes(y = mager, x = dwgt_r-pwgt_r, color = Race)) +
  geom_smooth() +
  labs(y = "First Kid Birth Age", x = "Weight gained during pregancy")

ggplot(combirth, aes(y = mager, x = bmi, color = Race)) +
  geom_smooth() +
  labs(y = "First Kid Birth Age", x = "Weight gained during pregancy")

ggplot(combirth, aes(y = mager, x = PCI, color = Race)) +
  geom_smooth(method = 'gam', formula = y ~ s(x, bs = "cs", k = 5)) +
  labs(y = "First Kid Birth Age", x = "Real Per Capita")
