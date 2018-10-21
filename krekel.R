#Dit script bevat een methode om de gedragsdata van krekels te analyseren.
#Het genereert een tabel met de frequenties van de overgangen van het ene naar
#het andere gedrag ("sequentietabel).
#Deze data wordt ook weergegeven in een grafiek.


#Installeert de benodigde packages
install.packages("data.table")
install.packages("Gmisc")
install.packages("readxl")

#Activeert de benodigde packages.
library(readxl)
library(Gmisc)

#laadt het Excelbestand.
krekel <- read_excel("krekel.xlsx")

#Selecteert van de variabele koud alles behalve de laatste ("voor"),
#of alles behalve de eerste ("na").
  voor <- head(krekel$koud,-1)
  na <- tail(krekel$koud,-1)
  
#Sequentietabel: een frequentietabel wordt gemaakt met het aantal van iedere combi
#(soort gedrag voor en na)
ft <- table(voor, na)
diag(ft) = 0
ft

#Transitiegrafiek.
frame()
transitionPlot(ft)
