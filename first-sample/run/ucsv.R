source("modelfunctions/func-ucsv.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
Y=dados[,1:2]

nprev=132

## == presente == ##
ucsv.cpi=ucsv.rw(100*Y[,1],nprev,1:12)/100
ucsv.pce=ucsv.rw(100*Y[,2],nprev,1:12)/100

write.table(ucsv.cpi,"forecasts/passado2000/ucsv-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(ucsv.pce,"forecasts/passado2000/ucsv-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
