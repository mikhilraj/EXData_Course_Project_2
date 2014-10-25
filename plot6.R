#  ------------------------------------------------------------------------------------------------------------------------
#
# Course:  Exploratory Data Analysis
# Project: Course Assignment 2
# Author:  Mikhil Raj
# 
# Program Name: plot6.R
# Date Written: October 25 2014
#
# set working directory
setwd("D:/Github/EXData_Course_Project_2")

# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 5:
# How have emissions from motor VEHicle sources changed from 1999-2008 in Baltimore City?

# Transform NEI by using year as a factor variable and load SCC data frame  
NEItr = transform(NEI, type=factor(type), year = factor(year))

# Total emissions from PM2.5 in the Baltimore City, Maryland (fips == 24510) from 1999 to 2008
NEI_BLT_LA = NEItr[NEItr$fips == "24510" | NEItr$fips == "06037", ]

VEH = as.data.frame(SCC[grep("VEH", SCC$SCC.Level.Two, ignore.case = T), 1])
names(VEH) = "SCC"
data = merge(VEH, NEI_BLT_LA, by = "SCC")

data$city[data$fips == "24510"] = "Baltimore"
data$city[data$fips == "06037"] = "LA"

data = ddply(data, .(year, city), summarize, sum = sum(Emissions))

# generate plot
# load libraries
library(ggplot2)

png('plot6.png', width=640, height=480)

ggplot(data, aes(year, sum)) + geom_point(aes(color = city), size = 4) + 
  labs(title = "PM2.5 Emission from motor vehicle sources",
       y="total PM2.5 emission each year")

dev.off()
