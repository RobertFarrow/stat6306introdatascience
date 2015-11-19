## Downloading and Tidying GDP Dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileURL, destfile="gdp.csv")
gdp <- read.csv(file="gdp.csv", header=T)
names(gdp)
gdp <- read.csv(file="gdp.csv", skip=4)
head(gdp)
gdp <- read.csv(file="gdp.csv", skip=4, na.strings=c("..","Not Available."))
str(gdp)
gdp <- read.csv(file="gdp.csv", skip=4, na.strings=c("..","Not Available."), stringsAsFactors=FALSE)
str(gdp)
gdp <- dplyr::select(gdp, X, X.1, X.2, X.3, X.4)
str(gdp)
gdp <- dplyr::select(gdp, X, X.1, X.3, X.4)
str(gdp)
names(gdp) <- c("CountryCode", "Ranking", "Economy", "GDP")
str(gdp)
gdp[180:200,]
tail(gdp)
gdp <- gdp[1:190,]
tail(gdp)
str(gdp)
gdp$GDP <- gsub(",", "", gdp$GDP)
str(gdp)
gdp$GDP <- as.numeric(gdp$GDP)
str(gdp)
gdp$Ranking <- as.numeric(gdp$Ranking)
str(gdp)

## Downloading and Tidying EDSTATS Dataset
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileURL, destfile="EDSTATS.csv")
EDSTATS <- read.csv(file="EDSTATS.csv", header=T)
names(EDSTATS)
str(EDSTATS)
EDSTATS$CountryCode <- as.character(EDSTATS$CountryCode)
str(EDSTATS)

## Merging Data
MergedData1 <- merge(x=gdp, y= EDSTATS, by="CountryCode", all=TRUE)