
library(dplyr)
balbirthdata <-read.csv("dataset/balancedlogbirth.csv")
BirthStat <- read.csv("dataset/BirthStat.csv")
YI <- read.csv("dataset/Yearly income data.csv")

comlogbirth <- balbirthdata |>
  left_join(YI, by = c("Year" = "Year"))
alllogbirth <- comlogbirth |>
  left_join(BirthStat, by = c("Year" = "Year"))


train_indices <- sample(1:nrow(alllogbirth), 0.7 * nrow(alllogbirth))
train_data <- alllogbirth[train_indices, ]
test_data <- alllogbirth[-train_indices, ]

logistic_model1 <- glm(underage ~ Year  + meduc + m_ht_in + bmi + pwgt_r + dwgt_r + Married + GDiabetes + cig_before + cig_during, 
                          family = binomial(), 
                          data = train_data)
predictions1 <- predict(logistic_model1, newdata = test_data, type = "response")
mse1 <- mean((test_data$underage - predictions1)^2)
print(mse1)
predicted_class1 <- ifelse(predictions1 > 0.5, 1, 0)
accuracy1 <- mean(predicted_class1 == test_data$underage)
print(accuracy1)
library(pROC)
roc_curve1 <- roc(predicted_class1, test_data$underage)
pROC::roc(predicted_class1, test_data$underage, levels = c(0, 1), direction = "<")
auc_value1 <- auc(roc_curve1)
print(paste("AUC:", auc_value1))
plot(roc_curve1)
library("caret")
table1<-table(predicted_class1, test_data$underage)
confusionMatrix(table1)
AIC(logistic_model1)
hist(predictions1, main="Histogram of Predicted Probabilities", xlab="Predicted Probability")



logistic_model2 <- glm(underage ~ Year+PCI+meduc + m_ht_in + bmi + pwgt_r + dwgt_r + Married + GDiabetes + cig_before + cig_during, 
                      family = binomial(), 
                      data = train_data)
predictions2 <- predict(logistic_model2, newdata = test_data, type = "response")
mse2 <- mean((test_data$underage - predictions2)^2)
print(mse2)
predicted_class2 <- ifelse(predictions2 > 0.5, 1, 0)
accuracy2 <- mean(predicted_class2 == test_data$underage)
print(accuracy2)
library(pROC)
roc_curve2 <- roc(predicted_class2, test_data$underage)
pROC::roc(predicted_class2, test_data$underage, levels = c(0, 1), direction = "<")
auc_value2 <- auc(roc_curve2)
print(paste("AUC:", auc_value2))
plot(roc_curve2)
library("caret")
table2<-table(predicted_class2, test_data$underage)
confusionMatrix(table2)
AIC(logistic_model2)


logistic_model3 <- glm(underage ~ Year+meduc + m_ht_in + bmi + pwgt_r + dwgt_r + Married + GDiabetes + cig_before + cig_during+PCI+Number.of.births+Birth.rate.per.1.000.population.+Fertility.rate.births.per.1.000.women.aged.15.44.+Percent.born.low.birthweight+Percent.born.preterm+Percent.unmarried+Mean.age.at.first.birth, 
                      family = binomial(), 
                      data = train_data)

predictions3 <- predict(logistic_model3, newdata = test_data, type = "response")
mse3 <- mean((test_data$underage - predictions3)^2)
print(mse3)
predicted_class3 <- ifelse(predictions3 > 0.5, 1, 0)
accuracy3 <- mean(predicted_class3 == test_data$underage)
print(accuracy3)
library(pROC)
roc_curve3 <- roc(predicted_class3, test_data$underage)
pROC::roc(predicted_class3, test_data$underage, levels = c(0, 1), direction = "<")
auc_value3 <- auc(roc_curve3)
print(paste("AUC:", auc_value3))
plot(roc_curve3)
library("caret")
table3<-table(predicted_class3, test_data$underage)
confusionMatrix(table3)
AIC(logistic_model3)


library(pROC)
plot(roc_curve1, col="red", main="Comparison of ROC Curves", xlim=c(0, 1), ylim=c(0, 1))
lines(roc_curve2, col="blue")
lines(roc_curve3, col="green")
legend("bottomright", legend=c("Model 1", "Model 2", "Model 3"), col=c("red", "blue", "green"), lwd=2)