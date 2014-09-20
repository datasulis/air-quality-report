library("openair")

#Load the hourly weather data taken from Wunderground
#See create-weather-data.R for how this is generated
#
weather <- read.csv("bath-weather-data-hourly.csv", header = TRUE)
weather$date <- as.POSIXct( strptime(weather$date, format="%Y-%m-%d %H:%M:%S", tz="GMT" ) )

png(filename="wind-rose-local-station.png", height=800, width=800)
windRose(weather, paddle=FALSE, main="Wind Rose from Local Weather Station")
dev.off()

#Load the recent London Road AURN data, this has windspeed comparisons
londonRd = importAURN(site="bath", year=2010:2013, pollutant="all")

png(filename="wind-rose-london-road.png", height=800, width=800)
windRose(londonRd, paddle=FALSE, main="Wind Rose from London Road AURN")
dev.off()

#Temperature and Wind Speed
png(filename="weather-conditions-local-station.png", height=800, width=800)
timePlot(weather, pollutant=c("temp", "ws"), avg.time="day", 
         smooth=TRUE, main="Plots of Mean Daily Temperature and Wind Speed (Local Station)", 
         plot.type="l", name.pol = c("Temperature", "Wind Speed"), statistic="mean" )
dev.off()
