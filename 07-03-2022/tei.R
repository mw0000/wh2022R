
library(xml2)

x <- read_xml('https://tei.nplp.pl/document/1443/v/1467/xml')

x2 <- xml_find_all(x, '//name[@type="person"]/text()')

x3 <- unlist(as_list(x2))

x3
