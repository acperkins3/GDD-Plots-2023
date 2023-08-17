sleep 32400
for i in {1..1000}
do
Rscript -e "rmarkdown::render('~/GetARL.Rmd')"
Rscript -e "rmarkdown::render('GDD-Plots-2023.Rmd')"
git add .
git commit -m "Daily updates"
git push
sleep 43200
done
