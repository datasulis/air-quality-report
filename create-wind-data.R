library("openair")

# weather.csv is a complete download of the weather dataset in Socrata
# https://data.bathhacked.org/Historic-Data/weather/3jiu-nb4x
#
# The data comes from Wunderground, and is originally sourced from a local station
#
weather <- read.csv("weather.csv", header = TRUE)
weather$time <- as.POSIXct( strptime(weather$time, format="%m/%d/%Y %I:%M:%S %p", tz="GMT" ) )

# Create a new data frame with just the columns we want
wind_data <- subset( weather, select = c("time", "wspdm", "wdird") )

# Rename the columns
names(wind_data)[1] = "date"
names(wind_data)[2] = "ws"
names(wind_data)[3] = "wd"

# Convert wind speed to m/s from kph
wind_data$ws = wind_data$ws * 1000 / 60 / 60

# Calculate hourly averages for wind speed and direction
wind <- timeAverage( wind_data, avg.time = "hour", statistic="mean" )

# Save it to disk for later (re)use
write.csv(wind, file="bath-wind-data.csv", row.names=FALSE)
