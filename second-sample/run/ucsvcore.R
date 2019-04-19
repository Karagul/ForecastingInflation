source("modelfunctions/func-ucsv.R")
library(HDeconometrics)
load("dados/rawdata.RData")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")

Y=cbind(core=core$core,dados)
Y=Y[,1:2]

nprev=180

## == presente == ##
ucsv.core=ucsv.rw(100*Y[,1],nprev,1:12)/100

write.table(ucsv.core,"forecasts/presente/ucsv-core.csv",sep=";",row.names = FALSE, col.names = FALSE)
