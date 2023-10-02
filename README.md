# GDD-Plots-2023

GDD tracking for our 2023 field locations by AP and DCL

This (very clunky) code webscrapes weather data for GDD and precipitation tracking. The output is intended to be viewed in the [GoogleSheet](https://docs.google.com/spreadsheets/d/1_QmalVr6MfYJ7xmk6pPng4dfTFPoGuEu0qGVzhs0ryE/edit?usp=sharing), which matches the format used by past lab members. 

For Arlington, Hancock, and Marshfield, temperature and precipitation both come from the [Michigan State weather stations](https://legacy.enviroweather.msu.edu/run.php?stn=hck&mod=w_sum&da1=7&mo1=4&da2=21&mo2=4&yr=2023&mc=604&ds=cd) located at those facilities. 

**Update 6/13/23:** The Arlington weather station is no longer part of the Michigan State Network and was taken over by [Wisconet](https://wisconet.wisc.edu/stations/arlington/data_downloads.html), but their website doesn't seem to work. Therefore, starting 6/11/23, the Arlington weather data will come from our [WatchDog weather station there](https://www.specconnect.net/currentconditions/publicview?serialnumber=270011997&title=Current+Conditions&rfhours=24). 

On June 24, the webscraping for the Watchdog accidentally stopped, so I added the Watchdog values manually.

**Update 8/17/23** The Arlington WatchDog got full of water in the rainstorm and was destroyed. The Wisconet website still doesn't have any recent observations on it, so we will have to switch to the [Visual Crossing API](https://www.visualcrossing.com/resources/documentation/weather-api/timeline-weather-api/) starting on 8/13/23. I can't put the actual API call in the GitHub repository because that would make my API key public online, but it is like this

```
library(tidyverse)
library(curl)

date <- Sys.time()

curl_download(paste0("https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/43.3039263,-89.3877515/2023-08-13/2023-", str_sub(date, 6, 10),  "/?key=My_Key&contentType=csv&include=days"), "~/GDD-Plots-2023/ARLVisualCrossing.csv")
```

**Update 10/1/23** More bad news: the Hancock and Marshfield weather stations were taken over by Wisconet on 9/24, so the weather data starting 9/24 are from VisualCrossing. 

with `My_Key` replaced with my API key. VisualCrossing works by calculating a weighted average from nearby weather stations based on how close they are, and you can see what they are if you make this API call without the `contentType` and `include` arguments. The Visual Crossing download includes values for the current day, which are a forecast, but we don't use those.

For West Madison, the temperature data come from the Middleton Airport weather station (KC29), which is close by, and the precipitation data come from the weather station at the Charmany Farm Instructional Facility (UW-Madison School of Veterinary Medicine, Mineral Point Road, CHMW3). See the code for the API calls used. The KC29 data comes from `weather.gov` and CHMW3 comes from `mesonet.agron.iastate.edu`.

The data structure is a bit complicated, but it's a product of the way the APIs work.

GDDs are in degrees F and are calculated using the equation

```
calc.daily.GDD <- function (max, min) {
  min <- ifelse(min < 50, 50, min)
  max <- ifelse(max > 86, 86, max)
  mean <- (min + max) / 2
  ifelse(mean < 50, 0, mean - 50)
}
```

Please let us know if you have any questions or suggestions!

<p align="center"><img src="https://raw.githubusercontent.com/acperkins3/GDD-Plots-2023/main/TrialGDDs.png" /></p>

<p align="center"><img src="https://raw.githubusercontent.com/acperkins3/GDD-Plots-2023/main/Rainfall.png" /></p>

<p align="center"><img src="https://raw.githubusercontent.com/acperkins3/GDD-Plots-2023/main/Silage.png" /></p>

<p align="center"><img src="https://raw.githubusercontent.com/acperkins3/GDD-Plots-2023/main/NurseriesGDDs.png" /></p>

<p align="center"><img src="https://raw.githubusercontent.com/acperkins3/GDD-Plots-2023/main/SoilMoisture.png" /></p>