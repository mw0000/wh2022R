
# leaflet

#options(scipen=999)

library(leaflet)

m <- leaflet() %>% addTiles() %>% addMarkers(lng=tweets$longitude, lat=tweets$latitude, popup = tweets$text)

# https://rstudio.github.io/leaflet/basemaps.html

m <- leaflet() %>% addTiles() %>% addProviderTiles(providers$Stamen.Toner) %>% addMarkers(lng=tweets$longitude, lat=tweets$latitude, popup = tweets$text)


m  


############

library(xml2)

r <- read_html('https://www.rp.pl/swiat/art35764011-wojna-rosji-z-ukraina')

r2 <- xml_find_all(r, '//div[@class="txt"]/h2/text()')

r3 <- unlist(as_list(r2))
