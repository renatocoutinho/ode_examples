FROM andrewosh/binder-base

MAINTAINER Renato Coutinho <renato.coutinho@gmail.com>

USER root

# Add R dependencies
RUN apt-get update
RUN apt-get install -y  r-base r-base-dev libzmq3-dev && apt-get clean

# Install required packages
RUN R -e 'install.packages(c("deSolve", "ggplot2", "reshape2", "rootSolve", "pse"))'
# Install R Kernel
RUN R -e "install.packages(c('rzmq','repr','IRkernel','IRdisplay'),
    repos = c('http://irkernel.github.io/', 'http://www.vps.fmvz.usp.br/CRAN/'));
    IRkernel::installspec()"

USER main
