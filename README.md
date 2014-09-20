# Air Quality Report

Created at the BathHacked Air Quality hack day, this project aims to answer two questions:

1. Can we provide Bath citizens with more insight into the air quality for Bath?
2. Can we provide the local council with new ways to generate meaningful visualisations and summary reports?

## Background

This project explores the weather and air quality data available for Bath. Air quality is an important topic as it 
can have both short and long term effects on people's health. Access to information, guidance and data on air quality 
can be important for people with health problems, health professionals, and citizens looking to be more 
environmentally friendly.

However air quality is a complex topic. There are a number of different types of pollutants and complex analysis is 
often required to bring some meaning to the data. The [DEFRA Air Quality website](http://uk-air.defra.gov.uk/) provides 
lots of useful information and defines a standard [Air Quality Index](http://uk-air.defra.gov.uk/air-pollution/daqi) that 
can be used to provide clear guidance to citizens.

At a local level, B&NES provide [an overview of air quality analysis](http://www.bathnes.gov.uk/services/your-council-and-democracy/local-research-and-statistics/wiki/air-quality) 
from a local perspective. This includes descriptions of the key pollutants, how air quality is monitored, and a summary of local trends.

While this is useful information, it is likely that there are other ways to present the data that can help make this 
information more accessible.

## Data Sources

The code in this project draws on several sources:

* [Historical air quality data](https://data.bathhacked.org/Environment/Historical-Air-Quality-Sensor-Data/37nn-vnib) from B&NES air quality sensors
* [Weather data](https://data.bathhacked.org/Historic-Data/weather/3jiu-nb4x) from a local amateur weather station
* Historical [air quality data from the AURN network](http://uk-air.defra.gov.uk/networks/site-info?uka_id=UKA00306), specifically London Road

## The Application

The scripts are based on [R](http://www.r-project.org/) and use [the OpenAir package](http://www.openair-project.org/) for data analysis. [Knitr](http://yihui.name/knitr/) is used for generating dynamic reports as HTML. The reports are then published to github pages in this project.

All development was done in [RStudio](http://www.rstudio.com/).

## Generating the Report

```
Rscript londonRoadReport.R /path/to/directory/ 2010 2013
```

## Example Reports

* [London Road AURN report for 1997-2013](http://datasulis.org/air-quality-report/london-road-aurn.html) -- contains report showing wind direction, time of day of pollutants, general trends and effects of wind.
