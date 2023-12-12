
library("caret")
library("corrplot")
library("tidyverse")
correlation_matrix <- 
  birth_sample|>
  select(-Race)|>
  cor()
corrplot(correlation_matrix, method = "circle", type = "upper", tl.col = "black", tl.srt = 45)
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {
  usr <- par("usr")
  on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))}
  
  
motheragemodel <- lm(mager ~ Year+meduc + m_ht_in + bmi + pwgt_r + dwgt_r + Married + GDiabetes + cig_before + cig_during+Year, data = birth_sample)
original_AIC <- AIC(motheragemodel)
commotheragemodel<- lm(mager ~ Year+meduc + m_ht_in + bmi + pwgt_r + dwgt_r + Married + GDiabetes + cig_before + cig_during+Year, data = combirth)
AIC(motheragemodel)

factors <- c("meduc", "m_ht_in", "bmi", "pwgt_r", "dwgt_r", "Married", "GDiabetes", "cig_before", "cig_during")

results <- data.frame(Factor = character(0), AIC = numeric(0), Percent_Decrease = numeric(0))

for (factor in factors) {
  reduced_formula <- as.formula(paste("mager ~", paste(factors[factors != factor], collapse = " + ")))
  reduced_model <- lm(reduced_formula, data = birth_sample)
  reduced_AIC <- AIC(reduced_model)
  percent_decrease <- ((original_AIC - reduced_AIC) / original_AIC) * 100
  results <- rbind(results, data.frame(Factor = factor, AIC = reduced_AIC, Percent_Decrease = percent_decrease))
}

print(results)