---
title: "Birth data"
author: "Shiying Wu"
date: "2023-10-23"
output: html_document
---

birthdata<-read.csv("nat2021us.csv")
library(dplyr)
set.seed(1000)
birth <- birthdata |>
  filter(tbo_rec==1)|>
  #first child
  subset( select = c(mager, mrace6,dmar, meduc, cig_0, cig_1,cig_2,cig_3, m_ht_in,bmi,pwgt_r,dwgt_r,rf_gdiab,dbwt))|>
  #age,race, education, daily smoke before pregnancy, height in inches, bmi, weight in pound before pregancy, weight in pound when delivered, gestational diabetes, Birth Weight)
  na.omit()|>
  mutate(Race = ifelse(mrace6 == 1, "White", ifelse(mrace6 == 2, "Black",ifelse(mrace6 == 3, "AIAN",ifelse(mrace6 == 4, "Asian",ifelse(mrace6 == 5, "NHOPI", "Mixed"))))))|>
  mutate(Married = ifelse(dmar == 1, 1,0))|>
  mutate(GDiabetes = ifelse(rf_gdiab == "N", 0,1))|>
  subset( select = c(-mrace6,-dmar,-rf_gdiab))|>
  mutate(cig_before = ifelse(cig_0 > 0 & cig_1 == 0 & cig_2 == 0 & cig_3 == 0, 1, 0),
         cig_during = ifelse(cig_1 > 0 | cig_2 > 0 | cig_3 > 0, 1, 0)) |>
  subset( select = c(-cig_0, -cig_1, -cig_2, -cig_3))


sample_size <- 100000  # Adjust the sample size as needed
birth_sample <- birth |>
  sample_n(size = sample_size, replace = FALSE) # selected 100000 sample

write.csv(birth_sample, "cleanedbirth.csv", row.names = FALSE)
