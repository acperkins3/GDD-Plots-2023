Rscript -e "rmarkdown::render('~/GetARL.Rmd')"
Rscript -e "rmarkdown::render('GDD-Plots-2023.Rmd')"
git add .
git commit -m "Daily updates"
git push
