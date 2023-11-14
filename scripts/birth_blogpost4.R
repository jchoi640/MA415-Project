
read.csv("dataset/cleanedbirth.csv")

birthweightmodel <- lm(dbwt ~ mager+ meduc+ m_ht_in+  bmi+ pwgt_r+ dwgt_r+  Married+ GDiabetes+ cig_before+ cig_during, data=birth_sample)
summary(birthweightmodel)

birthweightmodel <- lm(mager ~ meduc+ m_ht_in+  bmi+ pwgt_r+ dwgt_r+  Married+ GDiabetes+ cig_before+ cig_during, data=birth_sample)
summary(birthweightmodel)

library(ggplot2)
ggplot(birth_sample, aes(y = mager, x = meduc, color = Race)) +
geom_smooth()
  labs(x = "Maternal Age", y = "Education Level", 
       title = "Scatter Plot of Maternal Age vs Education Level by Race")
ggplot(birth_sample, aes(y = dbwt, x = mager, color = Race)) +
  geom_smooth() +
  labs(x = "Maternal Age", y = "Education Level", 
       title = "Scatter Plot of Maternal Age vs Prepreg Smoking")
