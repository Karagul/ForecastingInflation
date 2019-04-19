source("modelfunctions/func-ucsv.R")
library(HDeconometricsBeta)
library(tidyverse)
load("dados/rawdata2000.rda")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
core=core[1:nrow(dados),]
Y=cbind(core=core$core,dados)
Y=dados[,1:2]

nprev=132

## == presente == ##
ucsv.core=ucsv.rw(100*Y[,1],nprev,1:12)/100

write.table(ucsv.core,"forecasts/passado2000/ucsv-core.csv",sep=";",row.names = FALSE, col.names = FALSE)
