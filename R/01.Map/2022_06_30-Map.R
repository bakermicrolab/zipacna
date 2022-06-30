library(tidyverse)
library(ggmap)
library(RColorBrewer)
# Input data --------------------------------------------------------------####
BR <- readr::read_tsv("data/12.Mapa/phylum_3")
# Transform ---------------------------------------------------------------####
BR$Latitude<-as.numeric(BR$Latitude)
BR$Longitude<-as.numeric(BR$Longitude)
# Colors ------------------------------------------------------------------####
nb.cols <- 17
mycolors <- colorRampPalette(brewer.pal(8, "Dark2"))(nb.cols)
mapworld <- borders("world",colour = "gray80",fill="white")
# Map plot ----------------------------------------------------------------####
mp <- NULL 
mp<-ggplot() + mapworld + ylim(-60,90) 
mp + 
  geom_point(data = BR, 
             aes(x = Longitude, y = Latitude, color=Habitat),
             size = 2) +
  theme_gray() +
  labs(x= "Longitude", y = "Latitude") +
  scale_fill_manual(values = mycolors) +
 coord_cartesian(xlim=c(-150,180),ylim=c(-50,80)) +
  theme(axis.text = element_text(size = 10), 
        axis.title = element_text(size = 12))

mp + 
  geom_point(data = BR, aes(x = Longitude, y = Latitude ) ,
             size = 2) +
  theme_classic() +
  labs(x= "Longitude", y = "Latitude") +
  coord_cartesian(xlim=c(-150,180),ylim=c(-50,80)) +
  theme(axis.text = element_text(size = 10), 
        axis.title = element_text(size = 12))

