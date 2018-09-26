# Week 4 Project
# 5. How have emissions from motor vehicle sources changed 
# from 1999-2008 in Baltimore City?

library(ggplot2)
setwd("C:/Training/Data Science/Course 4 Exploratory Data Analysis/Week 4/project")
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# motor vehicle is of type ON-ROAD

Baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")

# [1] 1119    6

# # calculate total Emissions from motor vehicles by Year
#

aggMotorVehicleTotalsByYear <- aggregate(Emissions ~ year, Baltimore, sum)

aggMotorVehicleTotalsByYear
# year Emissions
# 1 1999 346.82000
# 2 2002 134.30882
# 3 2005 130.43038
# 4 2008  88.27546

png('plot5.png')

qplot(year, Emissions, data=aggMotorVehicleTotalsByYear,  geom="line") +
  xlab("Year") + ylab("PM2.5 Emissions") + ggtitle("Total Emissions PM2.5 from motor vehicle sources from 1999 to 2008'")

dev.off()

# Answer:
# From the plot5.png, it can be seen that 
# emissions from 
# motor vehicle sources from 1999-2008 decreases
#
