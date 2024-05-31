library(tidyverse)
library(gtsummary)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
library(gt)
library(readr)

data|>
  select(QOL_status_binary,2:8) |>
  tbl_summary(by= QOL_status_binary) |>
  add_overall() |>
  add_p() |>
  bold_p(t=0.05) |>
  as_gt() |>
  gtsave("tables/tables4_asociation_2G.docx")