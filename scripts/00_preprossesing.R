library(tidyverse)
library(readr)
install.packages("naniar")
library(naniar)
data <- read.csv("data/QOL_Thalassemia.csv")
#missing value
miss_var_summary(data)
gg_miss_var(data)
View(data)

data<- data|>
  mutate(QOL_status_binary=case_when(
   Total_QOL_Score<50~"poor",
   Total_QOL_Score>50~"good"
  ))
data<-data|>
  mutate(QOL_status_binary_code=case_when(
    Total_QOL_Score<50~ 0,
    Total_QOL_Score>50~ 1
  ))

data<-data|>
  mutate(QOL_status_binary_ordinal=case_when(
    Total_QOL_Score<50~ "poor",
    Total_QOL_Score>=40 & Total_QOL_Score<=60 ~ "moderate",
    Total_QOL_Score>60 ~"good"
  ))
data<-data|>
  mutate(QOL_status_binary_ordinal_code=case_when(
    Total_QOL_Score<50~ 1,
    Total_QOL_Score>=40 & Total_QOL_Score<=60 ~ 2,
    Total_QOL_Score>60 ~3
  ))

write.csv(data,"data/QOL_Thalassemia_preprossed.csv",row.names = F)




