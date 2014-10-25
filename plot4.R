#  ------------------------------------------------------------------------------------------------------------------------
#
# Course:  Exploratory Data Analysis
# Project: Course Assignment 2
# Author:  Mikhil Raj
# 
# Program Name: plot4.R
# Date Written: October 25 2014
#
# set working directory
setwd("D:/Github/EXData_Course_Project_2")

# Loading provided datasets - loading from local machine
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal combustion related sources
SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge
merge <- merge(x=NEI, y=SCC.coal, by='SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by=list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

# Question 4:
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?

# Load ggplot2 library
require(ggplot2)

png('plot4.png', width=480, height=480)



dev.off()
