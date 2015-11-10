# Enter the Data
fileLocation1 <- "http://stat.columbia.edu/~rachel/datasets/nyt1.csv"
fileLocation2 <- "http://stat.columbia.edu/~rachel/datasets/nyt2.csv"
fileLocation3 <- "http://stat.columbia.edu/~rachel/datasets/nyt3.csv"
fileLocation4 <- "http://stat.columbia.edu/~rachel/datasets/nyt4.csv"
fileLocation5 <- "http://stat.columbia.edu/~rachel/datasets/nyt5.csv"
fileLocation6 <- "http://stat.columbia.edu/~rachel/datasets/nyt6.csv"
fileLocation7 <- "http://stat.columbia.edu/~rachel/datasets/nyt7.csv"
fileLocation8 <- "http://stat.columbia.edu/~rachel/datasets/nyt8.csv"
fileLocation9 <- "http://stat.columbia.edu/~rachel/datasets/nyt9.csv"
fileLocation10 <- "http://stat.columbia.edu/~rachel/datasets/nyt10.csv"
fileLocation11 <- "http://stat.columbia.edu/~rachel/datasets/nyt11.csv"
fileLocation12 <- "http://stat.columbia.edu/~rachel/datasets/nyt12.csv"
fileLocation13 <- "http://stat.columbia.edu/~rachel/datasets/nyt13.csv"
fileLocation14 <- "http://stat.columbia.edu/~rachel/datasets/nyt14.csv"
fileLocation15 <- "http://stat.columbia.edu/~rachel/datasets/nyt15.csv"
fileLocation16 <- "http://stat.columbia.edu/~rachel/datasets/nyt16.csv"
fileLocation17 <- "http://stat.columbia.edu/~rachel/datasets/nyt17.csv"
fileLocation18 <- "http://stat.columbia.edu/~rachel/datasets/nyt18.csv"
fileLocation19 <- "http://stat.columbia.edu/~rachel/datasets/nyt19.csv"
fileLocation20 <- "http://stat.columbia.edu/~rachel/datasets/nyt20.csv"
fileLocation21 <- "http://stat.columbia.edu/~rachel/datasets/nyt21.csv"
fileLocation22 <- "http://stat.columbia.edu/~rachel/datasets/nyt22.csv"
fileLocation23 <- "http://stat.columbia.edu/~rachel/datasets/nyt23.csv"
fileLocation24 <- "http://stat.columbia.edu/~rachel/datasets/nyt24.csv"
fileLocation25 <- "http://stat.columbia.edu/~rachel/datasets/nyt25.csv"
fileLocation26 <- "http://stat.columbia.edu/~rachel/datasets/nyt26.csv"
fileLocation27 <- "http://stat.columbia.edu/~rachel/datasets/nyt27.csv"
fileLocation28 <- "http://stat.columbia.edu/~rachel/datasets/nyt28.csv"
fileLocation29 <- "http://stat.columbia.edu/~rachel/datasets/nyt29.csv"
fileLocation30 <- "http://stat.columbia.edu/~rachel/datasets/nyt30.csv"
fileLocation31 <- "http://stat.columbia.edu/~rachel/datasets/nyt31.csv"
data1 <- read.csv(url(fileLocation1))
data2 <- read.csv(url(fileLocation2))
data3 <- read.csv(url(fileLocation3))
data4 <- read.csv(url(fileLocation4))
data5 <- read.csv(url(fileLocation5))
data6 <- read.csv(url(fileLocation6))
data7 <- read.csv(url(fileLocation7))
data8 <- read.csv(url(fileLocation8))
data9 <- read.csv(url(fileLocation9))
data10 <- read.csv(url(fileLocation10))
data11 <- read.csv(url(fileLocation11))
data12 <- read.csv(url(fileLocation12))
data13 <- read.csv(url(fileLocation13))
data14 <- read.csv(url(fileLocation14))
data15 <- read.csv(url(fileLocation15))
data16 <- read.csv(url(fileLocation16))
data17 <- read.csv(url(fileLocation17))
data18 <- read.csv(url(fileLocation18))
data19 <- read.csv(url(fileLocation19))
data20 <- read.csv(url(fileLocation20))
data21 <- read.csv(url(fileLocation21))
data22 <- read.csv(url(fileLocation22))
data23 <- read.csv(url(fileLocation23))
data24 <- read.csv(url(fileLocation24))
data25 <- read.csv(url(fileLocation25))
data26 <- read.csv(url(fileLocation26))
data27 <- read.csv(url(fileLocation27))
data28 <- read.csv(url(fileLocation28))
data29 <- read.csv(url(fileLocation29))
data30 <- read.csv(url(fileLocation30))
data31 <- read.csv(url(fileLocation31))

# Add a variable to denote the day of the month for each data set
data1$Day <- 1
data2$Day <- 2
data3$Day <- 3
data4$Day <- 4
data5$Day <- 5
data6$Day <- 6
data7$Day <- 7
data8$Day <- 8
data9$Day <- 9
data10$Day <- 10
data11$Day <- 11
data12$Day <- 12
data13$Day <- 13
data14$Day <- 14
data15$Day <- 15
data16$Day <- 16
data17$Day <- 17
data18$Day <- 18
data19$Day <- 19
data20$Day <- 20
data21$Day <- 21
data22$Day <- 22
data23$Day <- 23
data24$Day <- 24
data25$Day <- 25
data26$Day <- 26
data27$Day <- 27
data28$Day <- 28
data29$Day <- 29
data30$Day <- 30
data31$Day <- 31

# Combine all the data sets into 1 dataset called NYT
NYT <- rbind(data1, data2)
NYT <- rbind(NYT, data3)
NYT <- rbind(NYT, data4)
NYT <- rbind(NYT, data5)
NYT <- rbind(NYT, data6)
NYT <- rbind(NYT, data7)
NYT <- rbind(NYT, data8)
NYT <- rbind(NYT, data9)
NYT <- rbind(NYT, data10)
NYT <- rbind(NYT, data11)
NYT <- rbind(NYT, data12)
NYT <- rbind(NYT, data13)
NYT <- rbind(NYT, data14)
NYT <- rbind(NYT, data15)
NYT <- rbind(NYT, data16)
NYT <- rbind(NYT, data17)
NYT <- rbind(NYT, data18)
NYT <- rbind(NYT, data19)
NYT <- rbind(NYT, data20)
NYT <- rbind(NYT, data21)
NYT <- rbind(NYT, data22)
NYT <- rbind(NYT, data23)
NYT <- rbind(NYT, data24)
NYT <- rbind(NYT, data25)
NYT <- rbind(NYT, data26)
NYT <- rbind(NYT, data27)
NYT <- rbind(NYT, data28)
NYT <- rbind(NYT, data29)
NYT <- rbind(NYT, data30)
NYT <- rbind(NYT, data31)