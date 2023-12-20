
motheragemodel <- lm(mager ~., data=birthdata)
summary(motheragemodel)
AIC(motheragemodel)
commotheragemodel <- lm(mager ~., data=combirth)
summary(commotheragemodel)
AIC(commotheragemodel)
allmotheragemodel <- lm(mager ~., data=allbirth)
summary(allmotheragemodel)
AIC(allmotheragemodel)

hist(birthdata$mager, main="Histogram of Mother's Age", xlab="Mother's Age")

commotheragemodel <- lm(log(mager) ~., data=combirth)
summary(commotheragemodel)
AIC(commotheragemodel)