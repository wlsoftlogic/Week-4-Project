# Week 4 Project
# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland ( ) from 1999 to
# 2008? Use the base plotting system to make a plot answering this question.

setwd("C:/Training/Data Science/Course 4 Exploratory Data Analysis/Week 4/project")
NEI <- readRDS("summarySCC_PM25.rds")

Baltimore <- subset(NEI, fips == "24510")

# calculate total Emissions by Year for Baltimore
#

aggBaltiTotalsByYear <- aggregate(Emissions ~ year,Baltimore, sum)

# year Emissions
# 1 1999  3274.180
# 2 2002  2453.916
# 3 2005  3091.354
# 4 2008  1862.282
png('plot2.png')

barplot(
  aggBaltiTotalsByYear$Emissions,
  names.arg=aggBaltiTotalsByYear$year,
  col="blue",
  xlab="Year",
  ylab="Emissions PM2.5",
  main="Total Emissions PM2.5  For All US Sources"
)
dev.off()

# Answer:
# From the plot2.png, it can be seen that the total emissions from 
# PM2.5 decreased in the Baltimore from 1999 to 2008 in general trend,
# however, PM2.5 in 2005 came higher than 2002
#
