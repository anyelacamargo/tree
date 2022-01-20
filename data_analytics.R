library(rgdal)
library(ggplot2)
library(viridis)
library(sf)
library(tmap)

my_spdf <- readOGR( 
  dsn= "Chalara_Fraxinea_Confirmed_Infection_Areas_GB_10K_GB-shp" , 
  layer="2ebf86a6-28d3-4594-a0b4-cfb77a3bbaa2202047-1-1rqsbyc.fe7p",
  verbose=FALSE
)

road_palette <- c("blue", "green", "grey", "purple", 'black',
                  "pink", "orange", "red")

plot(my_spdf, col=my_spdf@data$Year)
d <- my_spdf@data

legend("bottomright",   # location of legend
       legend = unique(my_spdf@data$Year), fill = unique(my_spdf@data$Year))

ggplot(data = my_spdf, # the input data
       aes(fill = Year)) + # define variables
  geom_sf(lwd = NA) +
  facet_wrap(~ Year, ncol = 2) 

tree_data <- my_spdf@data
