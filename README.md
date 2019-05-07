# Cherre-Project


## Setup & Installation (RStudio)
https://www.rstudio.com/products/rstudio/download/ (download Rstudio desktop client)

Assuming the Rstudio desktop client is already installed:  
- Clone the respository 
- Open the cloned directory in RStudio
- Install the necessary libraries by running the code block below
- Knit the `Cherre-Project.rmd` file to create the desired table output of the top 10 site visitors (Frequent Browsers). 

Install the necessary libraries by running the following commands in the Rstudio console: 
  ~~~
  install.packages(c('tidyverse','dplyr','devtools','DBI','ProjectTemplate','RSQLite'))
  devtools::install_github('rstudio/gt')
  ~~~

## Building and Running Docker File
Assuming Docker version 18.09.2 is installed: https://hub.docker.com/editions/community/docker-ce-desktop-mac (download link)

After cloning the repository, run `make run` in the directory where the Makefile and Dockerfile reside (same directory from cloning). NOTE: This make take 5-10 minutes for the relevant packages to install. Afterwards, you can can move to http://localhost:8787 (if not already launched) in your browser to launch the virtual RStudio Server. You can then find the cloned repository within the "hostdata" directory. After finding the cloned repository in the "hostdata" directory, open the `Cherre-Project.Rmd` file and click on the knit button to create the table output. 
