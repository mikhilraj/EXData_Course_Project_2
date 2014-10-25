#  ------------------------------------------------------------------------------------------------------------------------
#
# Course:  Exploratory Data Analysis
# Project: Course Assignment 2
# Author:  Mikhil Raj
# 
# Program Name: plot1.R
# Date Written: October 25 2014
#
# set working directory
setwd("D:/Github/EXData_Course_Project_2")

# load requried libaries
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

# Generate the graph
png('plot1.png', width=480, height=480)

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression(paste('Total Emission of PM',''[2.5],' ','in USA')),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()