# Create Age Groups
NYT$ageGroup <- cut(NYT$Age, c(-Inf, 18, 24, 34, 44, 54, 64, Inf))
levels(NYT$ageGroup) <- c("<18", "18-24", "25-34", "35-44", "45-54", "55-64", "65+")

# Question of Interest 1: What is the relationship between Day of the Month and the Age Groups that look at the NYTimes?
ggplot(NYT,aes(x=Day,fill=ageGroup))+geom_histogram(binwidth=1)
# Analysis: There are the fewest numbers of views of the NYTimes homepage in May 2012 on Saturdays, with Sundays having by far the largest number of views.  The weekdays, Monday through Friday, had relatively the same number of views during each week, even though the number of views varied by each week.  I find it surprising that Sunday has such a drastically higher number of views than any other day of the week.  I am not surprised that Sunday has the largest views compared to other days of the week, especially Saturdays, but I expected the gap between Sundays and Weekdays to be much closer than it was.

# Create Gender Labels/Groups
NYT$GenderLabel <- cut(NYT$Gender, c(-Inf, .5, Inf))
levels(NYT$GenderLabel) <- c("Female", "Male")

#Question of Interest 2: What is the relationship between the Day of the Month and the Gender that looks at the NYTimes?
ggplot(NYT,aes(x=Day,fill=GenderLabel))+geom_histogram(binwidth=1)
# Analysis: The ratio of Males and Females stays the same for the days of the week.  I find this slightly surprising, because I would have expected the ratio to include more Males on the 1st and 3rd Fridays and Saturdays of the month.  This is because the Kentucky Derby and the Preakness happen on those Saturdays, respectively.  While the Kentucky Derby and Preakness is a sport which I feel gets watched by both genders relatively equally(I know a lot more Females than Males who ride horses), I would have expected the NYTimes to have a higher proportion of Males checking the NYTimes on the days before the races, because I expected the Males to be checking the betting odds right before the races(I know a lot more Males who gamble than Females).  The most logical reason I can think this is not the case is because of the increase in popularity of ESPN.com and online betting websites.  Also, the French Open happened the last week in May, and the views did not increase on those days relative to other weeks, because of people checking the results of the tennis matches.  However, there is no discernible increase in views during the last week in May 2012, among both Males and Females.
