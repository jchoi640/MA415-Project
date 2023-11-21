---
title: "Birth data"
author: "Shiying Wu"
date: "2023-10-23"
output: html_document
---
library(dplyr)
birthdata <-read.csv("cleanedbirth.csv")
BirthStat <- read.csv("BirthStat.csv")
YI <- read.csv("Yearly income data.csv")
combirth
combirth <- birthdata |>
  left_join(BirthStat, by = c("Year" = "Year"))
combirth <- combirth |>
  left_join(YI, by = c("Year" = "Year"))












  