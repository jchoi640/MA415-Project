
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

# Factors in the model
factors <- c("meduc", "m_ht_in", "bmi", "pwgt_r", "dwgt_r", "Married", "GDiabetes", "cig_before", "cig_during")

# Initialize a data frame to store results
results <- data.frame(Factor = character(0), AIC = numeric(0), Percent_Decrease = numeric(0))

# Loop through each factor
for (factor in factors) {
  # Create the formula for the reduced model
  reduced_formula <- as.formula(paste("mager ~", paste(factors[factors != factor], collapse = " + ")))
  
  # Fit the reduced model
  reduced_model <- lm(reduced_formula, data = birth_sample)
  
  # Calculate the AIC for the reduced model
  reduced_AIC <- AIC(reduced_model)
  
  # Calculate the percentage decrease in AIC
  percent_decrease <- ((original_AIC - reduced_AIC) / original_AIC) * 100
  
  # Add the results to the data frame
  results <- rbind(results, data.frame(Factor = factor, AIC = reduced_AIC, Percent_Decrease = percent_decrease))
}

# Display the results
print(results)