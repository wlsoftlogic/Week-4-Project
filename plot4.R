# Week 4 Project
# 4. Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999-2008?

library(ggplot2)
setwd("C:/Training/Data Science/Course 4 Exploratory Data Analysis/Week 4/project")
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")

# Coal can be identified from the SCC.Short.Name column, 
# such as Ext Comb /Electric Gen /Bituminous Coal /Cyclone Furnace

# Find Coal related rows from SCC

SCC.coal <- SCC[grepl("Coal", SCC$Short.Name, ignore.case = TRUE),]

# Find the corresponding rows in NEI

NEI.coal <- NEI[NEI$SCC %in% SCC.coal$SCC,]


# calculate total Emissions from Coal source by Year
# 


aggCoalTotalsByYear <- aggregate(Emissions ~ year, NEI.coal, sum)

aggCoalTotalsByYear
#year Emissions
# 1 1999  602624.1
# 2 2002  564940.0
# 3 2005  569654.7
# 4 2008  358083.9

png('plot4.png')

qplot(year, Emissions, data=aggCoalTotalsByYear,  geom="line") +
  xlab("Year") + ylab("PM2.5 Emissions") + ggtitle("Total Emissions PM2.5 from coal combustion-related sources from 1999 to 2008'")

dev.off()

# Answer:
# From the plot4.png, it can be seen that 
# emissions from coal 
# combustion-related sources changed from 1999-2008 decreases in general
#
