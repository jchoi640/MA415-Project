combirth$underage <- ifelse(birth_sample$mager < 18, 0, 1)
logistic_model1 <- glm(underage ~ Year+Number.of.births+Birth.rate.per.1.000.population.+Fertility.rate.births.per.1.000.women.aged.15.44. +Percent.born.low.birthweight+Percent.born.preterm+ Percent.unmarried+Mean.age.at.first.birth+PCI+meduc + m_ht_in + bmi + pwgt_r + dwgt_r + Married + GDiabetes + cig_before + cig_during, family = binomial(), data = combirth)
logistic_model2 <- glm(underage ~ Year+PCI+meduc + m_ht_in + bmi + pwgt_r + dwgt_r + Married + GDiabetes + cig_before + cig_during, 
                      family = binomial(), 
                      data = combirth)

logistic_model3 <- glm(underage ~ Year+meduc + m_ht_in + bmi + pwgt_r + dwgt_r + Married + GDiabetes + cig_before + cig_during, 
                      family = binomial(), 
                      data = combirth)
AIC(logistic_model1)
AIC(logistic_model2)
AIC(logistic_model3)
summary(logistic_model3)


set.seed(821)
train_indices <- sample(1:nrow(combirth), 0.7 * nrow(combirth))
train_data <- combirth[train_indices, ]
test_data <- combirth[-train_indices, ]
glmlogistic_model_train <- glm(underage ~ Year  + meduc + m_ht_in + bmi + pwgt_r + dwgt_r + Married + GDiabetes + cig_before + cig_during, 
                               family = binomial(), 
                               data = train_data)
predictions <- predict(glmlogistic_model_train, newdata = test_data, type = "response")
mse <- mean((test_data$underage - predictions)^2)
print(mse)
predicted_class <- ifelse(predictions > 0.5, 1, 0)
accuracy <- mean(predicted_class == test_data$underage)
print(accuracy)