for i in {1..100000000000000000000000000}
do
Rscript -e "rmarkdown::render('ArlingtonWatchDogWebScraping.Rmd')"
sleep 900
done
