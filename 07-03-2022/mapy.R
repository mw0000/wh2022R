
library(leaflet)

# pipes %>% 
# CTRL + SHIFT + M

a <- 'To jest napis, ciekawe ile ma znaków?'
a %>% nchar()
nchar(a)

# tworzymy mapę w obiekcie m

m <- leaflet()

# na razie nic na niej nie ma
# dodajemy map tiles (kafelki?)
# # https://www.e-education.psu.edu/geog585/node/706
#  A tile map is a map in which each region is represented by a single tile of the same shape and size.
# For example, a square tile map of the United States would consist of square tiles of the same size 
# for each state, regardless of the geographic area of each state.

# dodajmy standardowe (współczesne) kafelki

m <- leaflet() %>% addTiles()
m

# teraz dodajmy jakieś punkty na mapie
# tweety maja ID, ktore moze zostac przetworzone na notację naukową
# można ją wyłączyć

options(scipen=999)

# wczytujemy tweety
# uwaga na working directory!
# setwd("~/Code/wh2022/07-03-2022")
tt <- read.csv('tweets.csv', row.names = NULL, stringsAsFactors = FALSE)

# tt to data frame (coś w rodzaju tabelki excelowej)
# sprawdzamy, ile ma wierszy

nrow(tt)

# [1] 8
# sprawdzamy, jakie ma kolumny

names(tt)

# [1] "id"         "text"       "screenName" "longitude"  "latitude" 
# dodajmy do mapy punkty (markery)
# mamy już obiekt mapy
m

# dodajmy punkty

m <- m %>% addMarkers(lng = tt$longitude, lat = tt$latitude)

# error 
# https://github.com/rstudio/leaflet/issues/782



# teraz dodajmy do punktow popupy

m <- m %>% addMarkers(lng = tt$longitude, lat = tt$latitude, popup=tt$text)

m

# teraz zmieńmy estetykę mapy i pokazywane dane
# https://rstudio.github.io/leaflet/basemaps.html
# czyli wgrajmy inne niż standardowe tilesy

m <- leaflet() %>% addProviderTiles(providers$Stamen.Toner) %>% addMarkers(lng = tt$longitude, lat = tt$latitude, popup=tt$text)

m


# skoro mamy możliwość dogrywania różnych tilesów, może są też historyczne?
# https://mapwarper.net/maps/geosearch?show_warped=1
# https://rstudio-pubs-static.s3.amazonaws.com/412688_db1cd37b4d99418495e34079042c8347.html

m <- leaflet() %>% addTiles('https://mapwarper.net/maps/tile/2779/{z}/{x}/{y}.png') %>% addMarkers(lng = tt$longitude, lat = tt$latitude, popup=tt$text)

m <- leaflet() %>% addTiles('https://mapwarper.net/maps/tile/261/{z}/{x}/{y}.png') %>% addMarkers(lat="52.237049", long="21.017532")

m


m <- leaflet() %>% addTiles('https://mapwarper.net/maps/tile/261/{z}/{x}/{y}.png') %>% setView(lat="52.237049", lng="21.017532", zoom="11")

m


m <- leaflet() %>% addTiles('https://mapwarper.net/maps/tile/47323/{z}/{x}/{y}.png') 

m <- leaflet() %>% addTiles('https://mapwarper.net/maps/tile/47323/{z}/{x}/{y}.png') %>% addMarkers(-90.071533,29.951065)

m <- leaflet() %>% addTiles('https://mapwarper.net/maps/tile/47323/{z}/{x}/{y}.png') %>% addMarkers(-92.412930,33.813716)


