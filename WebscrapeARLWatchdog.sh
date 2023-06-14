for i in {1..1000}
do
Rscript -e "rmarkdown::render('ArlingtonWatchDogWebScraping.Rmd')"
sleep 900
done

