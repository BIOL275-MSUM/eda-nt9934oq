library(tidyverse)
read_fwf(file = "EDA Project/Data/Antarctic Sea Ice Data Set.txt",skip=6,col_positions = )

read_csv(
  file,
  col_positions,
  col_types = NULL,
  locale = default_locale(),
  na = c("", "NA"),
  comment = "",
  trim_ws = TRUE,
  skip = 7,
  n_max = Inf,
  guess_max = min(n_max, 1000),
  progress = show_progress(),
  skip_empty_rows = TRUE
)

read_fwf(
  file,
  col_positions,
  col_types = NULL,
  locale = default_locale(),
  na = c("", "NA"),
  comment = "",
  trim_ws = TRUE,
  skip = 7,
  n_max = Inf,
  guess_max = min(n_max, 1000),
  progress = show_progress(),
  skip_empty_rows = TRUE
)

fwf_empty(
  ,
  skip = 0,
  skip_empty_rows = FALSE,
  col_names = NULL,
  comment = "",
  n = 100L
)
