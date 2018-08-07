#!/bin/bash
# Installs R, assumes this is run on debian stretch
echo "deb http://cran.rstudio.com/bin/linux/debian stretch-cran34/" > /etc/apt/sources.list.d/r.list

apt install -y dirmngr
apt-key adv --keyserver keys.gnupg.net --recv-key 'E19F5F87128899B192B1A2C2AD5F960A256A04AF'

apt update
apt install -y r-base

R -e 'install.packages(c("ggplot2"))'
