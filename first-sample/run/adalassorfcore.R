source("modelfunctions/func-adalassorf.R")
#library(HDeconometrics)
library(HDeconometricsBeta)
library(tidyverse)
load("dados/rawdata2000.rda")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
core=core[1:nrow(dados),]
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))
nprev=132


## == presente == ##

rf1c=lasso.rolling.window(Y,nprev,1,1,type="adalasso")
rf2c=lasso.rolling.window(Y,nprev,1,2,type="adalasso")
rf3c=lasso.rolling.window(Y,nprev,1,3,type="adalasso")
rf4c=lasso.rolling.window(Y,nprev,1,4,type="adalasso")
rf5c=lasso.rolling.window(Y,nprev,1,5,type="adalasso")
rf6c=lasso.rolling.window(Y,nprev,1,6,type="adalasso")
rf7c=lasso.rolling.window(Y,nprev,1,7,type="adalasso")
rf8c=lasso.rolling.window(Y,nprev,1,8,type="adalasso")
rf9c=lasso.rolling.window(Y,nprev,1,9,type="adalasso")
rf10c=lasso.rolling.window(Y,nprev,1,10,type="adalasso")
rf11c=lasso.rolling.window(Y,nprev,1,11,type="adalasso")
rf12c=lasso.rolling.window(Y,nprev,1,12,type="adalasso")


### == juntando tudo ==  ###

corem=cbind(rf1c$pred,rf2c$pred,rf3c$pred,rf4c$pred,
         rf5c$pred,rf6c$pred,rf7c$pred,rf8c$pred,
         rf9c$pred,rf10c$pred,rf11c$pred,rf12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],132)

sqrt(colMeans((corem-tail(core$core,132))^2))
##
write.table(corem,"forecasts/passado2000/adalassorf-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)

