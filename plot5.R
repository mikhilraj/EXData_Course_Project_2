#  ------------------------------------------------------------------------------------------------------------------------
#
# Course:  Exploratory Data Analysis
# Project: Course Assignment 2
# Author:  Mikhil Raj
# 
# Program Name: plot5.R
# Date Written: October 25 2014
#
# set working directory
setwd("D:/Github/EXData_Course_Project_2")

# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question 5:
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# subset by on road - assuming motor vehicles is on road
Baltimore_on_road <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

# Aggregate
Baltimore_on_road_aggr <- aggregate(Emissions ~ year, Baltimore_on_road, sum)

# generate plot
# load libraries
library(ggplot2)

png('plot5.png', width=480, height=480)

qplot(year, Emissions, data=Baltimore_on_road_aggr, geom="line") +
  ggtitle(expression("Baltimore City Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))


dev.off()