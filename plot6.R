# Week 4 Project
# 6. Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los
# Angeles County, California (fips == "06037" ). Which city has seen greater 
# changes over time in motor vehicle
#
library(ggplot2)
setwd("C:/Training/Data Science/Course 4 Exploratory Data Analysis/Week 4/project")
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# motor vehicle is of type ON-ROAD

Baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")
dim(Baltimore)
# [1] 1119    6
Losangeles <- subset(NEI, fips == "06037" & type == "ON-ROAD")
dim(Losangeles)
# [1] 978   6

# Add the two dataset by rbind
#
Balti_Los <- rbind(Baltimore, Losangeles)
dim(Balti_Los)
# [1] 2097    6


# calculate total Emissions by Year
# for Baltimore

aggMotorVehicleTotalsByYear <- aggregate(Emissions ~ year + fips, Balti_Los, sum)

aggMotorVehicleTotalsByYear
# year Emissions
# 1 1999 346.82000
# 2 2002 134.30882
# 3 2005 130.43038
# 4 2008  88.27546

# calculate total Emissions by Year
# for Los Anageles

aggLosangelesMotorVehicleTotalsByYear <- aggregate(Emissions ~ year, Losangeles, sum)

# year Emissions
# 1 1999  3931.120
# 2 2002  4273.710
# 3 2005  4601.415
# 4 2008  4101.321

png('plot6.png')

qplot(year, Emissions, data=aggMotorVehicleTotalsByYear,  color = fips, geom="line") +
  xlab("Year") + ylab("PM2.5 Emissions") + ggtitle("Total Emissions PM2.5 from motor vehicle sources for Baltimore (fips=24510) and Los Anageles (fips=-6037) 1999-2008")

dev.off()

# Answer:
# From the plot6.png, it can be seen that Baltimore has greater change in
# emissions from motor vehicle sources from 1999-2008 decreases
#
