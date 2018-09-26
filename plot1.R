# Week 4 Project
# 1. Have total emissions from PM2.5 decreased in the United States from 
# 1999 to 2008? Using the base plotting system,
# make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.
#
setwd("C:/Training/Data Science/Course 4 Exploratory Data Analysis/Week 4/project")
NEI <- readRDS("summarySCC_PM25.rds")

# calculate total Emissions by Year
#
aggTotalsByYear <- aggregate(Emissions ~ year,NEI, sum)

#year Emissions
#1 1999   7332967
#2 2002   5635780
#3 2005   5454703
#4 2008   3464206

# Plot bar graph
#
png('plot1.png')
barplot(
  aggTotalsByYear$Emissions/10^6,
  names.arg=aggTotalsByYear$year,
  col="blue",
  xlab="Year",
  ylab="Emissions PM2.5  (Tons)",
  main="Total Emissions PM2.5  For All US Sources"
)
dev.off()

# Answer: 
# From the plot1.png, it can be seen that the total emissions from 
# PM2.5 decreased in the United States from 1999 to 2008
#
