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

groupediceData <- group_by(extendiceData, Year)
groupediceData

SumgroupiceData <- summarize(groupediceData,avgannualConcent = mean(Concentration))

SumgroupiceData

ggplot(data=SumgroupiceData,mapping=aes(x=Year,y=avgannualConcent))+
  geom_line()+
  geom_smooth(method=lm)+
  labs(x="Year", y="Average Concentration")+
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  )

monthgroupiceData <- group_by(extendiceData,Month)
monthgroupiceData

summonthData <- summarize(monthgroupiceData,avgmonthConcent=mean(Concentration),.groups ="drop" )
summonthData

ggplot(data=summonthData,mapping=aes(x=Month,y=avgmonthConcent))+
  geom_jitter(aes(y=Concentration),data=extendiceData,alpha=.3)+
  geom_col(color="darkblue",alpha=.5)+
  labs(x="Month", y="Average Concentration")+
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(1)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  )

