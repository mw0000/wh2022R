# skoro mamy możliwość dogrywania różnych tilesów, może są też historyczne?
# https://mapwarper.net/maps/geosearch?show_warped=1
# https://rstudio-pubs-static.s3.amazonaws.com/412688_db1cd37b4d99418495e34079042c8347.html


# mapa Prus Wschodnich
# Kreiseinteilung Preußen 1772-1807
# https://mapwarper.net/maps/59380#Export_tab
# https://mapwarper.net/maps/tile/59380/{z}/{x}/{y}.png

library(leaflet)

m <- leaflet() %>% addTiles('https://mapwarper.net/maps/tile/59380/{z}/{x}/{y}.png')

# https://geokeo.com/database/suburb/pl/79/
# Żabianka - Jelitkowo

m <- m %>% addMarkers(lat=54.42041199926709, lng=18.5831153, popup = "Żabianka / Jelitkowo")

m
