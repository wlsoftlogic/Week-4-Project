# Week 4 Project
# 3. Of the four types of sources indicated by the (point, nonpoint, onroad, nonroad) 
# variable, which of these four
# sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in
# emissions from 1999-2008? Use the ggplot2 plotting system to 
# make a plot answer this question.
library(ggplot2)
setwd("C:/Training/Data Science/Course 4 Exploratory Data Analysis/Week 4/project")
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- subset(NEI, fips == "24510")

# # calculate total Emissions by Year
# and type for Baltimore

aggBaltiTotalsByYearType <- aggregate(Emissions ~ year + type, Baltimore, sum)

aggBaltiTotalsByYearType

#year     type  Emissions
#1  1999 NON-ROAD  522.94000
#2  2002 NON-ROAD  240.84692
#3  2005 NON-ROAD  248.93369
#4  2008 NON-ROAD   55.82356
#5  1999 NONPOINT 2107.62500
#6  2002 NONPOINT 1509.50000
#7  2005 NONPOINT 1509.50000
#8  2008 NONPOINT 1373.20731
#9  1999  ON-ROAD  346.82000
#10 2002  ON-ROAD  134.30882
#11 2005  ON-ROAD  130.43038
#12 2008  ON-ROAD   88.27546
#13 1999    POINT  296.79500
#14 2002    POINT  569.26000
#15 2005    POINT 1202.49000
#16 2008    POINT  344.97518

png('plot3.png')

qplot(year, Emissions, data=aggBaltiTotalsByYearType, color=type, geom="line") +
  xlab("Year") + ylab("PM2.5 Emissions") + ggtitle("Total Emissions PM2.5 in Baltimore by source type (fips == "24510") from 1999 to 2008'")

dev.off()

# Answer:
# From the plot13.png, it can be seen that 
# Overall, the Emissions for sources NON-ROAD, NON POINT, ON-Road
# have decreased 
# The Emission for POINT has a spike in 2005
