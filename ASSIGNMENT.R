library(tidyverse)

#Loading in Sea Ice Data
seaiceData<-
read_fwf(
  file =  "Data/Antarctic Sea Ice Data Set.txt",
  col_positions = fwf_widths(
    widths = c(6, 10, 12,10,10,10,10,10,10,10,10,10,10),
    col_names = c("Year", "01", "02","03","04","05","06","07","08","09","10","11","12")
  ),
  na = "-999.00",
  skip = 8
)

seaiceData

extendiceData <-
pivot_longer(
  data = seaiceData,
  cols = `01`:`12`,
  names_to = "Month", 
  values_to = "Concentration",
  values_drop_na = TRUE
  )

extendiceData

mutate(
extendiceData,
  text_date = paste0(Year, "-", Month, "-01"),
  date = as.Date(text_date)
)

              
       
