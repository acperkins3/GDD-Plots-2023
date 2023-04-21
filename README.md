# GDD-Plots-2023

GDD tracking for our 2023 field locations by AP and DCL

This code webscrapes weather data for GDD and precipitation tracking. The output is intended to be viewed in the [GoogleSheet](https://docs.google.com/spreadsheets/d/1_QmalVr6MfYJ7xmk6pPng4dfTFPoGuEu0qGVzhs0ryE/edit?usp=sharing), which matches the format used by past lab members. 

For Arlington, Hancock, and Marshfield, temperature and precipitation both come from the [Michigan State weather stations](https://legacy.enviroweather.msu.edu/run.php?stn=hck&mod=w_sum&da1=7&mo1=4&da2=21&mo2=4&yr=2023&mc=604&ds=cd) located at those facilities. 

For West Madison, the temperature data come from the Middleton Airport weather station (KC29), which is close by, and the precipitation data come from the weather station at the Charmany Farm Instructional Facility (UW-Madison School of Veterinary Medicine, Mineral Point Road, CHMW3). See the code for the API calls used. The KC29 data comes from `weather.gov` and CHMW3 comes from `mesonet.agron.iastate.edu`.

The data structure is a bit complicated, but it's a product of the way the APIs work.

Please let us know if you have any questions or suggestions!

