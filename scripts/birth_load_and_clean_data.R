---
title: "Birth data"
author: "Shiying Wu"
date: "2023-10-23"
output: html_document
---

birthdata<-read.csv("nat2021us.csv")

library(dplyr)
birth <- birthdata |>
  filter(tbo_rec==1)|>
  #first child
  select(mager, mrace6,dmar, meduc, cig_0, m_ht_in,bmi,pwgt_r,dwgt_r,rf_pdiab,dbwt,rcity_pop)
#age,race, education, daily smoke before pregnancy, height in inches, bmi, weight in pound before pregancy, weight in pound when delivered, pre-diabetes, Birth Weight , mother live city population)
  