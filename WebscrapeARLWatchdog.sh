x=1
while [ $x = 1 ]
do
Rscript -e "rmarkdown::render('ArlingtonWatchDogWebScraping.Rmd')"
sleep 900
done
