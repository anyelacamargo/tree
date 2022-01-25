library(rgdal)
library(ggplot2)
library(viridis)
# library(sf)
library(tmap)


# This dataset reports sightings of the Chalara_Fraxinea across the UK
# Load shape file
my_spdf <- readOGR( 
  dsn= "Chalara_Fraxinea_Confirmed_Infection_Areas_GB_10K_GB-shp" , 
  layer="2ebf86a6-28d3-4594-a0b4-cfb77a3bbaa2202047-1-1rqsbyc.fe7p",
  verbose=FALSE
)


#' Print summary
summary(my_spdf)

# Extra data matrix
d <- my_spdf@data
road_palette <- c("blue", "green", "grey", "purple", 'black',
                  "pink", "orange", "red")
# Plot data on map
plot(my_spdf, col=my_spdf@data$Year)

legend("bottomright",   # location of legend
       legend = unique(my_spdf@data$Year), fill = unique(my_spdf@data$Year))


#' Data plots - I couldn't install the library and didn't make an effor to
#' install on a a different R version
#' 
# ggplot(data = my_spdf, # the input data
#        aes(fill = Year)) + # define variables
#   geom_sf(lwd = NA) +
#   facet_wrap(~ Year, ncol = 2) 


#' Change British projection to WGS84 (lat lon)
coord <- coordinates(spTransform(my_spdf, CRS("+proj=longlat +datum=WGS84")))
colnames(coord) <- c('lon', 'lat')

print(colnames)