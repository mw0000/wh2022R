# error (awaria tilesow, CORS? na serwerach leaflet)
# https://github.com/rstudio/leaflet/issues/782
# dlatego zamiast addTiles() używamy addProviderTiles() - alternatywne zrodla kafelkow
# i zamiast addMarkers() uzywamy addAwesomeMarkers()

library(leaflet)

# ściągamy dane tweetów

tt <- read.csv('tweets3.csv', stringsAsFactors = FALSE, row.names = NULL)

nrow(tt)

names(tt)

# providerTiles
# https://rstudio.github.io/leaflet/basemaps.html
# https://leaflet-extras.github.io/leaflet-providers/preview/index.html

m2 <- leaflet() %>% 
  addProviderTiles(providers$OpenStreetMap.Mapnik) %>% 
  addAwesomeMarkers(lat=tt$latitude, lng = tt$longitude, icon = awesomeIcons())

m2 <- leaflet() %>% 
  addProviderTiles(providers$OpenStreetMap.Mapnik) %>% 
  addAwesomeMarkers(lat=tt$latitude, 
                    lng = tt$longitude, 
                    icon = awesomeIcons(),
                    clusterOptions = markerClusterOptions(lng=tt$longitude, 
                                                                         lat=tt$latitude))

m2
