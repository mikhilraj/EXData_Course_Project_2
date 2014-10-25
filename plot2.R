#  ------------------------------------------------------------------------------------------------------------------------
#
# Course:  Exploratory Data Analysis
# Project: Course Assignment 2
# Author:  Mikhil Raj
# 
# Program Name: plot2.R
# Date Written: October 25 2014
#
# set working directory
setwd("D:/Github/EXData_Course_Project_2")

# load requried libaries
library(plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data and append years in one data frame
MD <- subset(NEI, fips=='24510')

# Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Generate the graph in the same directory
png('plot2.png', width=480, height=480)

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Total Emission in Baltimore City, Maryland', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()