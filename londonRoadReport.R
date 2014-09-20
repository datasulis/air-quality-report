#Generate Report
library("openair")
library("knitr")
library("markdown")

args<-commandArgs(TRUE)

weather <- read.csv("bath-weather-data-hourly.csv", header = TRUE)
weather$date <- as.POSIXct( strptime(weather$date, format="%Y-%m-%d %H:%M:%S", tz="GMT" ) )

#Load the recent London Road AURN data, this has windspeed comparisons
londonRd = importAURN(site="bath", year=seq(as.integer(args[2]), as.integer(args[3])), pollutant="all")

dates=c(args[2], args[3])
from=args[2]
to=args[3]

opts_knit$set(base.dir = args[1])

knit2html('londonRoad.Rmd', output=paste(args[1], 'london-road-aurn.html', sep=""))
