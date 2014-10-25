#  ------------------------------------------------------------------------------------------------------------------------
#
# Course:  Exploratory Data Analysis
# Project: Course Assignment 2
# Author:  Mikhil Raj
# 
# Program Name: plot3.R
# Date Written: October 25 2014
#
# set working directory
setwd("D:/Github/EXData_Course_Project_2")

# load requried libaries
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 3:
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which   
# of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen   
# increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.  

#  subset data by county
BALT_City <- subset(NEI, fips == "24510") 
BALT_City_Aggr_Year <- aggregate(BALT_City[c("Emissions")], list(type = BALT_City$type, year = BALT_City$year), sum)

library(ggplot2)

#  Create Plot
png('plot3.png', width=480, height=480)
plot <- ggplot(BALT_City_Aggr_Year, aes(x=year, y=Emissions, colour=type)) +
     geom_point(alpha=.3) +
     geom_smooth(alpha=.2, size=1, method="loess") +
     ggtitle("Total Emissions by Type in Baltimore City")

print(plot)
dev.off()