# https://etherpad.wikimedia.org/p/wh2022

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


####################
#https://www.r-bloggers.com/2020/08/benfords-law-applying-to-existing-data/
#https://www.bbc.com/news/60528276
# https://abhayk1201.github.io/files/EE604_tp.pdf
#https://github.com/sjaishanker/Benford-Analysis-For-Fraud-Detection

library(imagerExtra)
library(imager)
library(benford.analysis)
library(imagerExtra)
library(dplyr)

# load image
im = load.image("_123420620_plane-house.jpg") %>% grayscale()
# perform (DCT)
im_df = DCT2D(im) %>% as.data.frame()
# apply benford law
bfd.im = benford(im_df$value, number.of.digits = 1, discrete = T, round = 1, sign = "both") 
bfd.im
# plot the results
plot(bfd.im)


im = load.image("_123420620_plane-house_2.jpg") %>% grayscale()
# perform (DCT)
im_df = DCT2D(im) %>% as.data.frame()
# apply benford law
bfd.im = benford(im_df$value, number.of.digits = 1, discrete = T, round = 1, sign = "both") 
bfd.im
# plot the results
plot(bfd.im)


im = load.image("_123420620_plane-house_3.jpg") %>% grayscale()
# perform (DCT)
im_df = DCT2D(im) %>% as.data.frame()
# apply benford law
bfd.im = benford(im_df$value, number.of.digits = 1, discrete = T, round = 1, sign = "both") 
bfd.im
# plot the results
plot(bfd.im)


im = load.image("person.jpeg") %>% grayscale()
# perform (DCT)
im_df = DCT2D(im) %>% as.data.frame()
# apply benford law
bfd.im = benford(im_df$value, number.of.digits = 5, discrete = T, round = 1, sign = "both") 
bfd.im
# plot the results
plot(bfd.im)

