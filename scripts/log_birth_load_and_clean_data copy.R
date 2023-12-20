---
title: "Birth data"
author: "Shiying Wu"
date: "2023-10-23"
output: html_document
---
  
  library(dplyr)
set.seed(1000)
sample_size <- 20000
birth2021 <- read.csv("dataset-ignore/nat2021us.csv")
birth2021 <- birth2021 |>
  filter(tbo_rec==1)|>
  #first child
  subset( select = c(mager, mrace6,dmar, meduc, cig_0, cig_1,cig_2,cig_3, m_ht_in,bmi,pwgt_r,dwgt_r,rf_gdiab,dbwt))|>
  #age,race, education, daily smoke before pregnancy, height in inches, bmi, weight in pound before pregancy, weight in pound when delivered, gestational diabetes, Birth Weight)
  na.omit()|>
  mutate(mrace6 = round(mrace6/10, digit=0))|>
  mutate(Race = ifelse(mrace6 == 1, "White", ifelse(mrace6 == 2, "Black",ifelse(mrace6 == 3, "AIAN",ifelse(mrace6 == 4, "Asian",ifelse(mrace6 == 5, "NHOPI", "Mixed"))))))|>
  mutate(Married = ifelse(dmar == 1, 1,0))|>
  mutate(GDiabetes = ifelse(rf_gdiab == "N", 0,1))|>
  subset( select = c(-mrace6,-dmar,-rf_gdiab))|>
  mutate(cig_before = ifelse(cig_0 > 0 & cig_1 == 0 & cig_2 == 0 & cig_3 == 0, 1, 0),
         cig_during = ifelse(cig_1 > 0 | cig_2 > 0 | cig_3 > 0, 1, 0)) |>
  subset( select = c(-cig_0, -cig_1, -cig_2, -cig_3))
birth2021$Year <- 2021
birth2021$underage <- ifelse(birth2021$mager < 18, 1, 0)
birth1<-birth2021|>
  filter(underage==1) |>
  sample_n(sample_size/2)
birth0<-birth2021|>
  filter(underage==0) |>
  sample_n(sample_size/2)
birth2021<-rbind(birth1,birth0)



birth2020 <- read.csv("dataset-ignore/nat2020us.csv")
birth2020 <- birth2020 |>
  filter(tbo_rec==1)|>
  #first child
  subset( select = c(mager, mrace6,dmar, meduc, cig_0, cig_1,cig_2,cig_3, m_ht_in,bmi,pwgt_r,dwgt_r,rf_gdiab,dbwt))|>
  #age,race, education, daily smoke before pregnancy, height in inches, bmi, weight in pound before pregancy, weight in pound when delivered, gestational diabetes, Birth Weight)
  na.omit()|>
  mutate(mrace6 = round(mrace6/10, digit=0))|>
  mutate(Race = ifelse(mrace6 == 1, "White", ifelse(mrace6 == 2, "Black",ifelse(mrace6 == 3, "AIAN",ifelse(mrace6 == 4, "Asian",ifelse(mrace6 == 5, "NHOPI", "Mixed"))))))|>
  mutate(Married = ifelse(dmar == 1, 1,0))|>
  mutate(GDiabetes = ifelse(rf_gdiab == "N", 0,1))|>
  subset( select = c(-mrace6,-dmar,-rf_gdiab))|>
  mutate(cig_before = ifelse(cig_0 > 0 & cig_1 == 0 & cig_2 == 0 & cig_3 == 0, 1, 0),
         cig_during = ifelse(cig_1 > 0 | cig_2 > 0 | cig_3 > 0, 1, 0)) |>
  subset( select = c(-cig_0, -cig_1, -cig_2, -cig_3))
birth2020$Year <- 2020
birth2020$underage <- ifelse(birth2020$mager < 18, 1, 0)
birth1<-birth2020|>
  filter(underage==1) |>
  sample_n(sample_size/2)
birth0<-birth2020|>
  filter(underage==0) |>
  sample_n(sample_size/2)
birth2020<-rbind(birth1,birth0)



birth2019 <- read.csv("dataset-ignore/nat2019us.csv")
birth2019 <- birth2019 |>
  filter(tbo_rec==1)|>
  #first child
  subset( select = c(mager, mrace6,dmar, meduc, cig_0, cig_1,cig_2,cig_3, m_ht_in,bmi,pwgt_r,dwgt_r,rf_gdiab,dbwt))|>
  #age,race, education, daily smoke before pregnancy, height in inches, bmi, weight in pound before pregancy, weight in pound when delivered, gestational diabetes, Birth Weight)
  na.omit()|>
  mutate(mrace6 = round(mrace6/10, digit=0))|>
  mutate(Race = ifelse(mrace6 == 1, "White", ifelse(mrace6 == 2, "Black",ifelse(mrace6 == 3, "AIAN",ifelse(mrace6 == 4, "Asian",ifelse(mrace6 == 5, "NHOPI", "Mixed"))))))|>
  mutate(Married = ifelse(dmar == 1, 1,0))|>
  mutate(GDiabetes = ifelse(rf_gdiab == "N", 0,1))|>
  subset( select = c(-mrace6,-dmar,-rf_gdiab))|>
  mutate(cig_before = ifelse(cig_0 > 0 & cig_1 == 0 & cig_2 == 0 & cig_3 == 0, 1, 0),
         cig_during = ifelse(cig_1 > 0 | cig_2 > 0 | cig_3 > 0, 1, 0)) |>
  subset( select = c(-cig_0, -cig_1, -cig_2, -cig_3))
birth2019$Year <- 2019
birth2019$underage <- ifelse(birth2019$mager < 18, 1, 0)
birth1<-birth2019|>
  filter(underage==1) |>
  sample_n(sample_size/2)
birth0<-birth2019|>
  filter(underage==0) |>
  sample_n(sample_size/2)
birth2019<-rbind(birth1,birth0)



birth2018 <- read.csv("dataset-ignore/nat2018us.csv")
birth2018 <- birth2018 |>
  filter(tbo_rec==1)|>
  #first child
  subset( select = c(mager, mrace6,dmar, meduc, cig_0, cig_1,cig_2,cig_3, m_ht_in,bmi,pwgt_r,dwgt_r,rf_gdiab,dbwt))|>
  #age,race, education, daily smoke before pregnancy, height in inches, bmi, weight in pound before pregancy, weight in pound when delivered, gestational diabetes, Birth Weight)
  na.omit()|>
  mutate(mrace6 = round(mrace6/10, digit=0))|>
  mutate(Race = ifelse(mrace6 == 1, "White", ifelse(mrace6 == 2, "Black",ifelse(mrace6 == 3, "AIAN",ifelse(mrace6 == 4, "Asian",ifelse(mrace6 == 5, "NHOPI", "Mixed"))))))|>
  mutate(Married = ifelse(dmar == 1, 1,0))|>
  mutate(GDiabetes = ifelse(rf_gdiab == "N", 0,1))|>
  subset( select = c(-mrace6,-dmar,-rf_gdiab))|>
  mutate(cig_before = ifelse(cig_0 > 0 & cig_1 == 0 & cig_2 == 0 & cig_3 == 0, 1, 0),
         cig_during = ifelse(cig_1 > 0 | cig_2 > 0 | cig_3 > 0, 1, 0)) |>
  subset( select = c(-cig_0, -cig_1, -cig_2, -cig_3))
birth2018$Year <- 2018
birth2018$underage <- ifelse(birth2018$mager < 18, 1, 0)
birth1<-birth2018|>
  filter(underage==1) |>
  sample_n(sample_size/2)
birth0<-birth2018|>
  filter(underage==0) |>
  sample_n(sample_size/2)
birth2018<-rbind(birth1,birth0)

birth2017 <- read.csv("dataset-ignore/natl2017.csv")
birth2017 <- birth2017 |>
  filter(tbo_rec==1)|>
  #first child
  subset( select = c(mager, mrace6,dmar, meduc, cig_0, cig_1,cig_2,cig_3, m_ht_in,bmi,pwgt_r,dwgt_r,rf_gdiab,dbwt))|>
  #age,race, education, daily smoke before pregnancy, height in inches, bmi, weight in pound before pregancy, weight in pound when delivered, gestational diabetes, Birth Weight)
  na.omit()|>
  mutate(mrace6 = round(mrace6/10, digit=0))|>
  mutate(Race = ifelse(mrace6 == 1, "White", ifelse(mrace6 == 2, "Black",ifelse(mrace6 == 3, "AIAN",ifelse(mrace6 == 4, "Asian",ifelse(mrace6 == 5, "NHOPI", "Mixed"))))))|>
  mutate(Married = ifelse(dmar == 1, 1,0))|>
  mutate(GDiabetes = ifelse(rf_gdiab == "N", 0,1))|>
  subset( select = c(-mrace6,-dmar,-rf_gdiab))|>
  mutate(cig_before = ifelse(cig_0 > 0 & cig_1 == 0 & cig_2 == 0 & cig_3 == 0, 1, 0),
         cig_during = ifelse(cig_1 > 0 | cig_2 > 0 | cig_3 > 0, 1, 0)) |>
  subset( select = c(-cig_0, -cig_1, -cig_2, -cig_3))
birth2017$Year <- 2017
birth2017$underage <- ifelse(birth2017$mager < 18, 1, 0)
birth1<-birth2017|>
  filter(underage==1) |>
  sample_n(sample_size/2)
birth0<-birth2017|>
  filter(underage==0) |>
  sample_n(sample_size/2)
birth2017<-rbind(birth1,birth0)

birth2016 <- read.csv("dataset-ignore/natl2016.csv")
birth2016 <- birth2016 |>
  filter(tbo_rec==1)|>
  #first child
  subset( select = c(mager, mrace6,dmar, meduc, cig_0, cig_1,cig_2,cig_3, m_ht_in,bmi,pwgt_r,dwgt_r,rf_gdiab,dbwt))|>
  #age,race, education, daily smoke before pregnancy, height in inches, bmi, weight in pound before pregancy, weight in pound when delivered, gestational diabetes, Birth Weight)
  na.omit()|>
  mutate(mrace6 = round(mrace6/10, digit=0))|>
  mutate(Race = ifelse(mrace6 == 1, "White", ifelse(mrace6 == 2, "Black",ifelse(mrace6 == 3, "AIAN",ifelse(mrace6 == 4, "Asian",ifelse(mrace6 == 5, "NHOPI", "Mixed"))))))|>
  mutate(Married = ifelse(dmar == 1, 1,0))|>
  mutate(GDiabetes = ifelse(rf_gdiab == "N", 0,1))|>
  subset( select = c(-mrace6,-dmar,-rf_gdiab))|>
  mutate(cig_before = ifelse(cig_0 > 0 & cig_1 == 0 & cig_2 == 0 & cig_3 == 0, 1, 0),
         cig_during = ifelse(cig_1 > 0 | cig_2 > 0 | cig_3 > 0, 1, 0)) |>
  subset( select = c(-cig_0, -cig_1, -cig_2, -cig_3))
birth2016$Year <- 2016
birth2016$underage <- ifelse(birth2016$mager < 18, 1, 0)
birth1<-birth2016|>
  filter(underage==1) |>
  sample_n(sample_size/2)
birth0<-birth2016|>
  filter(underage==0) |>
  sample_n(sample_size/2)
birth2016<-rbind(birth1,birth0)

balbirthdata <- bind_rows(birth2021, birth2020, birth2019, birth2018, birth2017, birth2016)

write.csv(balbirthdata, "dataset/balancedlogbirth.csv", row.names = FALSE)




