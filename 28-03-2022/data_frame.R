

df <- read.csv('tweets3.csv', stringsAsFactors = FALSE, row.names = NULL)

nrow(df)

names(df)

library(dplyr)

head(df$screenName)

# pokaż wszystkie tweety użytkownika 'pidybi'

df2 <- df %>% filter(screenName == 'pidybi')

# wylicz średnią liczbę lajków, jakie dostają tweety użytkownika pidybi

mean(df2$favoriteCount)

# czy ta średnia jest wyższa od średniej dla całego zbioru?

# w jakich dniach ten user publikował najczęściej?

#1. dodajmy kolumnę z datą dzienną (a nie timestampem)

df3 <- df2 %>% mutate(date =  substr(created,1,10), .before=screenName)

# 2. sprawdzmy funkcja table, jakie daty byly najpopularniejsze

table(df3$date)

plot(table(df3$date), type = "l", col = "red", xlab = "Data", ylab = "Liczba tweetów")

# dodajmy średnią jego publikowania

abline(h=mean(table(df3$date)), col="blue")

# dodajmy medianę jego publikowania

abline(h=median(table(df3$date)), col="yellow")

#########################################

# zmiana tła
par(bg = "#66ccff")

plot(table(df3$date), type = "o", col = "white", xlab = "Data", ylab = "Liczba tweetów", pch = 20, cex = .5)  

text(table(df3$date), names(table(df3$date)), col = "red")

# pokazy tylko najwieksze wartosci

par(bg = "#66ccff")

plot(table(df3$date), type = "o", col = "white", xlab = "Data", ylab = "Liczba tweetów", pch = 20, cex = .5)  

text(table(df3$date), ifelse(table(df3$date) > 10, names(table(df3$date)),''), col = "red")

# lepsze rozwiązania tutaj https://ggplot2.tidyverse.org/reference/ggplot.html
# https://raw.githubusercontent.com/rstudio/cheatsheets/main/data-visualization.pdf
