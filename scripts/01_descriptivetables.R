library(tidyverse)
install.packages("gtsummary")
install.packages("gt")
library(gtsummary)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
library(gt)
library(readr)
data<- read.csv("data/QOL_thalassemia_preprossed.csv")
view(data)
data|>
  select(1:8)|>
  tbl_summary(statistic= list(
    all_continuous()~ "{mean}({sd})" )) |>
     as_gt()|>
      gtsave("tables/tables1_demographic.docx")

data|>
  select(9:17)|>
  tbl_summary(type=all_categorical()~"categorical",
              statistic= list(
                all_continuous()~ "{mean}({sd})" ) ) |>
  as_gt()|>
  gtsave("tables/tables2_clinicalcharac.docx")
#difference
data|>
  select(Gender,18:25) |>
  tbl_summary(type = everything()~ "continuous",
          by= gender) |>
  add_overall() |>
  add_p() |>
  bold_p(t=0.05) |>
  as_gt() |>
  gtsave("tables/tables3_diffe_2G.docx")


data|>
  select(Type_of_Family,18:25) |>
  tbl_summary(type = everything()~ "continuous",
              by=Type_of_Family) |>
  add_overall() |>
  add_p() |>
  bold_p(t=0.05) |>
  as_gt() |>
  gtsave("tables/tables4_diffe_3G.docx")

data|>
  select(Total_QOL_Score,18:25) |>
  tbl_summary(type = everything()~ "continuous",
              by=Total_QOL_Score) |>
  add_overall() |>
  add_p() |>
  bold_p(t=0.05) |>
  as_gt() |>
  gtsave("tables/tables3_diffe_2G.docx")







    
    