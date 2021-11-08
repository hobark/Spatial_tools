library(raster)
library(rgdal)
library(sf)
library(tiff)
library(bioimagetools)

library(raster)

mypath="C:/Users/wb543838/OneDrive - WBG/02_Data/DLR_landcover/GHSL_ucbd_new500_450m/"
raster_files <- list.files(mypath,full.names = T) #use pattern = '.tif$' or something else if you have multiple files in this folder

r_name <- list.files(mypath,full.names = F)

rList <- list() # to save raster values
statList <- list() # to save data.frame with statistics

temp <- paste0(raster_files[1])
rList[[1]] <- values(temp)
raster::

r <- raster(system.file(raster_files[1], package="raster"))
maxValue(r)

r=raster(raster_files[1])
class(raster_files[1])

idx = suppressWarnings(which.max(temp))

plot(temp)

setwd(wd)
#first import all files in a single folder as a list 
rastlist <- list.files(path = "C:/Users/wb543838/OneDrive - WBG/02_Data/DLR_landcover/GHSL_ucbd_new500_450m/", pattern='.tif$', 
                       all.files=TRUE, full.names=TRUE)
r_name <- list.files(path=wd,full.names = F)

rList <- list() # to save raster values
statList <- list() # to save data.frame with statistics

temp <- raster('C:/Users/wb543838/OneDrive - WBG/02_Data/DLR_landcover/GHSL_ucbd_new500_450m/BuildingHeight_450m_13.tif')

for(i in 1:length(rastlist)){
  temp <- raster(rastlist[i])
  rList[[i]] <- values(temp) # extract values for each raster
  
  # name
  Name <- r_name[i]
  
  mx=raster::maxValue(temp)
#  v = t(sapply(temp, function(i) i[which.max(i[,2]), ] ))
#  xy = xyFromCell(r, v[,1])
  
  statList[[i]] <- data.frame(Name,mx) # create a data.frame to save statistics
}




df <- do.call(rbind.data.frame,statList) # final data.frame with all statistics



height <- raster(uildingHeight_450m_10036.tif)

#import all raster files in folder using lapply
rastlist[3]

#to check the index numbers of all imported raster list elements
allrasters

#call single raster element
allrasters[[1]]

#to run a function on an individual raster e.g., plot 
plot(allrasters[[1]])



# create raster
r <- raster(ncol=36, nrow=18)
r[] <- runif(ncell(r))
# create SpatialPolygons from GridTopology
grd <- GridTopology(c(-150, -50), c(40, 40), c(8, 3))
Spol <- as(grd, "SpatialPolygons")
# create SpatialPolygonsDataFrame
centroids <- coordinates(Spol)
x <- centroids[,1]
y <- centroids[,2]
SPDF <- SpatialPolygonsDataFrame(Spol, data=data.frame(x=x, y=y, row.names=row.names(Spol)))
ext <- raster::extract(r, SPDF, cellnumbers=TRUE)
v <- t(sapply(ext, function(i) i[which.max(i[,2]), ] ))
xyFromCell(r, v[,1])
