# R Script git intro
library("tmaptools")
library("jsonlite")
setwd("C:\\Users\\Obi\\Desktop\\CASA\\Git-Intro")

name <- c("obi")
home_town <- c("london")

df <- data.frame(name, home_town)

# Geocoding data
df <- df[, c("name", "home_town")]
dfGeo <- tmaptools::geocode_OSM(as.vector(df$home_town), as.data.frame = TRUE)
df <- merge(df, dfGeo, by.x = "home_town", by.y = "query")
print(df)

df <- df[, c("lat", "lon", "name", "home_town")]
write.table(df, "location01.csv", col.names = FALSE, row.names = FALSE, sep = ",")
