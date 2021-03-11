library(tidyverse)

#Loading in Sea Ice Data
seaiceData<-
read_fwf(
  "Data/Antarctic Sea Ice Data Set.txt", 
  fwf_widths(c(6, 10, 12,10,10,10,10,10,10,10,10,10,10), c("Year",
                                               "Jan",
                                               "Feb",
                                               "Mar",
                                               "Apr",
                                               "May",
                                               "June",
                                               "July",
                                               "Aug",
                                               "Sept",
                                               "Oct",
                                               "Nov",
                                               "Dec")),
  skip = 8
)

seaiceData

