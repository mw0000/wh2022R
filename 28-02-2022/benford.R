
############

# analiza zgodności z rozkładem benforda

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

