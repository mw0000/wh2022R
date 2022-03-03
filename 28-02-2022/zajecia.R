
# 0
# ustawmy sobie katalog roboczy na 28-02-2022

setwd("28-02-2022")

# 1.
# obiekt nowych mediów (jak pisze Manovich) jest MODULARNY = składa się z wielu elementów, które mogą funkcjonować samodzielnie, 
# nawet jeśli na pierwszy rzut oka trudno je wyróżnić (ale można to zrobić maszynowo)
# każda strona WWW jest takim obiektem, zobaczmy jak to działa

# wczytujemy pakiet xml2, pozwalający pracować z plikami xml/html

library(xml2)

# każdy plik html to USTRUKTURYZOWANY dokument tekstowy = zamiast zwykłego tekstu (plain text - takiego, jaki wpisujemy w notatniku windowsowym)
# dokument html to tekst ze ZNACZNIKAMI https://developer.mozilla.org/pl/docs/Glossary/Semantics#semantyka_w_j%C4%99zyku_html
# podobne znaczniki znajdują się w edycjach cyfrowych

# tworzymy obiekt a, do którego wrzucamy ciąg tekstowy (string) z adresem strony WWW dokumentującej wojnę w Ukrainie

a <- 'https://www.rp.pl/swiat/art35764011-wojna-rosji-z-ukraina'

# jeśli wpiszemy w konsoli

a

# wyświetli się
#[1] "https://www.rp.pl/swiat/art35764011-wojna-rosji-z-ukraina"

# [1] oznacza, że w obiekt zawiera tylko jeden element

# Teraz wczytajmy dokument HTML do środowiska (żeby z nim pracować dalej). Służy do tego funkcja read_html()
# W r funkcje stosujemy w ten sposób
# x <- nazwa_funkcji(argument1 = 1, argument2 = TRUE, argument3 = xd)
# x będzie tu wynikiem działania funkcji nazwa_funkcji, przy czym podaliśmy odpowiednie argumenty - jak widać, mogą być liczbowe (argument1)
# logiczne (argument2) albo nawet jako argument możemy podać inny obiekt (tutaj xd)

r <- read_html('https://www.rp.pl/swiat/art35764011-wojna-rosji-z-ukraina')

# OK, udało się coś pobrać. Możemy zobaczyć sobie podgląd
#> r
#{html_document}
#<html lang="pl">
#  [1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<meta charset="utf-8">\n<meta name="viewport" content="width=device ...
#  [2] <body class="" style="overflow-x: hidden">\n<script type="text/javascript">\n\n        window.commercialBreak = null;\n\n        function getCom ...

# w R różne obiekty mogą mieć różne typy - obiektem jest ciąg tekstowy, funkcja, liczba itp. W naszym przypadku r jest specyficznym obiektem
# funkcja str() coś nam o tym powie

str(r)

# > str(r)
# List of 2
# $ node:<externalptr> 
# $ doc :<externalptr> 
# - attr(*, "class")= chr [1:2] "xml_document" "xml_node"

# dokument HTML jest tutaj reprezentowany jako lista dwóch elementów
# w R możemy tworzyć własne klasy obiektów i dalej z nimi pracować

# ponieważ strona WWW jest obiektem modularnym, możemy potraktować ją jako coś w rodzaju bazy danych - zakładać, że znajdziemy w niej pewne
# USTRUKTYRYZOWANE dane
# jeśli wejdą Państwo na stronę https://www.rp.pl/swiat/art35764011-wojna-rosji-z-ukraina
# zobaczą Państwo, że widać pewne regularności - tytułu newsów są wyboldowane i napisane fontem tej samej wielkości itp., przy każdym mamy datę
# w kodzie HTML tej strony wygląda to tak

# <div class="txt"><h2> Najnowsze doniesienia z Ukrainy można znaleźć tutaj: </h2></div>
# jak widać, treść tytułu jest zamknięta w znacznikach H2, a te - w DIV z klasą 'txt'
# w HTML i (XML też) znaczniki mogą mieć atrybuty
# np. w semantycznej transkrypcji źródła, np. fragment Rocznika świętokrzyskiego (https://pl.wikisource.org/wiki/Rocznik_%C5%9Bwi%C4%99tokrzyski_dawny)
# w plain text wpis wygląda tak:
# 1002 Umarł cesarz Otton III. Nastąpił [po nim] Henryk
# w semantycznej transkrypcji wyglądałby mniej więcej tak:
# <data val="1002" type="year">1002</data> Umarł <role>cesarz</role> <person id="323">Otton III</person>. Nastąpił [po nim] <person id="324">Henryk</person>
# data, role, person to ELEMENTY (tagi)
# val, type, id to ATRYBUTY 
# wróćmy do strony WWW
# spróbujmy wyciągnąć wszystkei tytuły newsów
# jak pamiętamy, są zamknięte w elemencie h2
# funkcja xml_find_all pozwala zrobić kwerendę po dokumencie XML/HTML
# kwerenda napisana jest w języku xPath https://developer.mozilla.org/pl/docs/Web/XPath

r2 <- xml_find_all(r, '//div[@class="txt"]/h2/text()')

# // - niezależnie od miejsca, w którym się znajdują w drzewie dokumentu
# div[@class="txt"] - wybierz wszystkie elementy DIV z atrybutem class o wartości txt 
# /h2
# w tych gałęziach (dic class='txt') wybierz wszystkie elementy h2
# /txt() - to funkcja xPath wyciągająca czysty tekst z zawartości elementu

r2

# > r2
# {xml_nodeset (151)}
# [1] \nNajnowsze doniesienia z Ukrainy można znaleźć tutaj:\n
# [2] \nKończymy relację\n
# [3] \nSkładowisko odpadów radioaktywnych trafione pociskami\n
# [4] \nKumoch: Polski ambasador i dyplomaci są w Kijowie\n
# [5] \nBrytyjski wywiad: Wojska rosyjskie napotykają silny opór\n
# [6] \nONZ: Na Ukrainie zginęło co najmniej 64 cywilów\n
# [7] \nCiężki ostrzał Charkowa\n
# [8] \nAntonov: Pożar pod Kijowem to katastrofa ekologiczna\n
# [9] \nRosja zamyka przestrzeń powietrzną dla samolotów z Litwy, Łotwy, Estonii i Słowenii\n
# [10] \nPremier Ukrainy dziękuje za zapowiedź sankcji na Rosję\n
# [11] \nAtak wojsk rosyjskich pod Kijowem, płoną zbiorniki z paliwem\n
# [12] \nPod Kijowem miał zginąć czeczeński generał\n
# [13] \nMusk odpowiada władzom Ukrainy ws. Starlink\n
# [14] \nNiektóre rosyjskie banki zostaną odłączone od systemu SWIFT\n
# [15] \nDesant wojsk rosyjskich - brak potwierdzenia\n
# [16] \nPremier Grecji: W rosyjskich nalotach na Ukrainie zginęli cywile\n
# [17] \nDoniesienia o desancie wojsk rosyjskich pod Kijowem\n
# [18] \nMer Kijowa: Rosjanie ostrzeliwują dzielnice mieszkalne. Zginęło dziecko\n
# [19] \nKolejne kraje wprowadzają zakaz lotów dla rosyjskich samolotów\n
# [20] \nTel Awiw: Tysiące protestują przeciw inwazji na Ukrainę\n
# ...

# OK, coś udało nam się uzyskać. Ale to wciąż trudny do przepracowania obiekt - lepiej zamienić go na zwykły ciąg tekstowy
# w xml2 najpierw gałęzie XML (które właśnie zebraliśmy) zamieniamy na listę funkcją as_list()
# a potem listę zamieniamy na obiekt zawierający ciągi tekstowe - unlist()

r3 <- unlist(as_list(r2))

# i teraz możemy sobie wyciągać poszczególne treści

r3[10:15]

# [1] "\nPremier Ukrainy dziękuje za zapowiedź sankcji na Rosję\n"       "\nAtak wojsk rosyjskich pod Kijowem, płoną zbiorniki z paliwem\n"
# [3] "\nPod Kijowem miał zginąć czeczeński generał\n"                   "\nMusk odpowiada władzom Ukrainy ws. Starlink\n"                 
# [5] "\nNiektóre rosyjskie banki zostaną odłączone od systemu SWIFT\n"  "\nDesant wojsk rosyjskich - brak potwierdzenia\n" 

# w tytułach mamy niepotrzebne znaki nowej linii \n - usuńmy je funkcją gsub

r4 <- gsub('\n','',r3)

# funkcja gsub przyjmuje takie argumenty 
# pattern - to, co ma być usunięte
# zamiennik - w naszym przypadku ''
# obiekt, który przetwaerzamy - r3

# 
# r4
# [1] "Najnowsze doniesienia z Ukrainy można znaleźć tutaj:"                                                       
# [2] "Kończymy relację"                                                                                           
# [3] "Składowisko odpadów radioaktywnych trafione pociskami"                                                      
# [4] "Kumoch: Polski ambasador i dyplomaci są w Kijowie"                                                          
# [5] "Brytyjski wywiad: Wojska rosyjskie napotykają silny opór"                                                   
# [6] "ONZ: Na Ukrainie zginęło co najmniej 64 cywilów"                                                            
# [7] "Ciężki ostrzał Charkowa"                                                                                    
# [8] "Antonov: Pożar pod Kijowem to katastrofa ekologiczna"                                                       
# [9] "Rosja zamyka przestrzeń powietrzną dla samolotów z Litwy, Łotwy, Estonii i Słowenii"                        
# [10] "Premier Ukrainy dziękuje za zapowiedź sankcji na Rosję"

# zapiszmy sobie teraz CSV z tymi danymi, żeby móc je zobaczyć w excelu
# służy do tego funkcja write.csv()

write.csv(r4,'titles.csv',row.names = FALSE)

#możemy też zapisać dane jako plik txt

writeLines(r4,'titles.txt')

# Ćwiczenie - dla chętnych
# 1. pobrać wszystkie adresy URL linkowane na tej stronie i zapisać jako plik txt
# 2. pobrać wszystkie daty z aktualności na tej stronie i zapisać jako plik CSV
# pomoc w xpath https://www.w3schools.com/xml/xpath_intro.asp
