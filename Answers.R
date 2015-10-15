str(MergedData1)
str(gdp)
str(EDSTATS)

## 1	Match the data based on the country shortcode. How many of the IDs match?	189 of the observations match.  There were 190 observations in the "gdp" data set, and 234 observations in the "EDSTATS" data set.  The "MergedData1" data set, the resulting merged data set, has 235 observations, which means that 1 of the observations from the "gdp" data set did not match with the "EDSTATS" data set.

attach(MergedData1)
SortedData <- MergedData1[order(-GDP),]
detach(MergedData1)
head(MergedData1, n=15)

## 2	Sort the data frame in ascending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame?	St. Kitts and Nevis

SortedData1 <- SortedData[complete.cases(SortedData[,4]),]  ##45 Rows were removed
tapply(SortedData1$Ranking, SortedData1$Income.Group, mean)

## 3	What are the average GDP rankings for the "High income: OECD" and "High income: nonOECD" groups?	High Income: OECD = 32.96667; High Income: nonOECD = 91.91304

SortedData1$RankedData[SortedData1$Ranking < 39] <- 1
SortedData1$RankedData[SortedData1$Ranking >= 39 & SortedData1$Ranking < 77] <- 2
SortedData1$RankedData[SortedData1$Ranking >= 77 & SortedData1$Ranking < 115] <- 3
SortedData1$RankedData[SortedData1$Ranking >= 115 & SortedData1$Ranking < 153] <- 4
SortedData1$RankedData[SortedData1$Ranking >= 153] <- 5
RDLabels <- c("Low", "Medium Low", "Medium", "Medium High", "High")
SortedData1$RankedData <- factor(SortedData1$RankedData, labels=RDLabels)
table(SortedData1$Income.Group, SortedData1$RankedData)

## 4	Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. How many countries are Lower middle income but among the 38 nations with highest GDP?	16