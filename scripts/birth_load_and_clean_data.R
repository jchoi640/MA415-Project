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
  select(mager, mrace6,dmar, meduc, cig_0, m_ht_in,bmi,pwgt_r,dwgt_r,rf_pdiab,dbwt)
#age,race, education, daily smoke before pregnancy, height in inches, bmi, weight in pound before pregancy, weight in pound when delivered, pre-diabetes, Birth Weight , mother live city population)
  sample_size <- 100000  # Adjust the sample size as needed
  birth_sample <- birth |>
  sample_n(size = sample_size, replace = FALSE)