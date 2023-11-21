---
title: "Birth data"
author: "Shiying Wu"
date: "2023-10-23"
output: html_document
---
  
library(dplyr)
set.seed(1000)
sample_size <- 20000
birth2021 <- read.csv("nat2021us.csv")
birth2021 <- birth2021 |>
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
birth2021$Year <- 2021
birth2021 <- sample_n(birth2021, size = sample_size)


birth2020 <- read.csv("nat2020us.csv")
birth2020 <- birth2020 |>
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
birth2020$Year <- 2020
birth2020 <- sample_n(birth2020, size = sample_size)

birth2019 <- read.csv("nat2019us.csv")
birth2019 <- birth2019 |>
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
birth2019$Year <- 2019
birth2019 <- sample_n(birth2019, size = sample_size)

birth2018 <- read.csv("nat2018us.csv")
birth2018 <- birth2018 |>
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
birth2018$Year <- 2018
birth2018 <- sample_n(birth2018, size = sample_size)

birth2017 <- read.csv("natl2017.csv")
birth2017 <- birth2017 |>
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
birth2017$Year <- 2017
birth2017 <- sample_n(birth2017, size = sample_size)

birth2016 <- read.csv("natl2016.csv")
birth2016 <- birth2016 |>
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
birth2016$Year <- 2016
birth2016 <- sample_n(birth2016, size = sample_size)
birthdata <- bind_rows(birth2021, birth2020, birth2019, birth2018, birth2017, birth2016)

write.csv(birthdata, "cleanedbirth.csv", row.names = FALSE)



  