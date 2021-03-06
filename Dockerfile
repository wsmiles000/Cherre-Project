FROM rocker/verse:3.5.2

################
#install linux deps
################

RUN apt-get update -y && \
	apt-get install -y \ 
		curl

################
#install R packages
################

RUN R -e "install.packages(c('devtools','DBI','ProjectTemplate')); \
  devtools::install_github('rstudio/gt'); \
  devtools::install_github('rstats-db/RSQLite')"



