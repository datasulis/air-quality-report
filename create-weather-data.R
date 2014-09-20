library("openair")

# weather.csv is a complete download of the weather dataset in Socrata
# https://data.bathhacked.org/Historic-Data/weather/3jiu-nb4x
#
# The data comes from Wunderground, and is originally sourced from a local station
#
weather <- read.csv("weather.csv", header = TRUE)
weather$time <- as.POSIXct( strptime(weather$time, format="%m/%d/%Y %I:%M:%S %p", tz="GMT" ) )

# Create a new data frame with just the columns we want
weather_data <- subset( weather, select = c("time", "wspdm", "wdird", "wgustm", "tempm", "dewptm", "hum", "pressurem", "precip_ratem", "precip_totalm", "solarradiation") )

# Rename the columns
names(weather_data)[1] = "date"
names(weather_data)[2] = "ws"
names(weather_data)[3] = "wd"
#wind gust kph
names(weather_data)[4] = "gust"
#centrigrade
names(weather_data)[5] = "temp"
names(weather_data)[6] = "dewpt"
#percentage
names(weather_data)[7] = "hum"
#mBar
names(weather_data)[8] = "pressure"
names(weather_data)[9] = "precip_rate"
names(weather_data)[10] = "precip_total"

# Convert wind speed to m/s from kph
weather_data$ws = weather_data$ws * 1000 / 60 / 60
weather_data$gust = weather_data$gust * 1000 / 60 / 60

# Save it to disk for later (re)use
write.csv(weather_data, file="bath-weather-data-raw.csv", row.names=FALSE)

# Calculate hourly averages for wind speed and direction
weather_average <- timeAverage( weather_data, avg.time = "hour", statistic="mean" )

# Save it to disk for later (re)use
write.csv(weather_average, file="bath-weather-data-hourly.csv", row.names=FALSE)
