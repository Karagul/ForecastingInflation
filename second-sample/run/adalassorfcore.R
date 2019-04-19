source("modelfunctions/func-adalassorf.R")
library(HDeconometricsBeta)
library(randomForest)
library(tidyverse)
load("dados/rawdata.RData")

core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))


nprev=180


## == presente == ##

lasso1c=lasso.rolling.window(Y,nprev,1,1,type="adalasso")
lasso2c=lasso.rolling.window(Y,nprev,1,2,type="adalasso")
lasso3c=lasso.rolling.window(Y,nprev,1,3,type="adalasso")
lasso4c=lasso.rolling.window(Y,nprev,1,4,type="adalasso")
lasso5c=lasso.rolling.window(Y,nprev,1,5,type="adalasso")
lasso6c=lasso.rolling.window(Y,nprev,1,6,type="adalasso")
lasso7c=lasso.rolling.window(Y,nprev,1,7,type="adalasso")
lasso8c=lasso.rolling.window(Y,nprev,1,8,type="adalasso")
lasso9c=lasso.rolling.window(Y,nprev,1,9,type="adalasso")
lasso10c=lasso.rolling.window(Y,nprev,1,10,type="adalasso")
lasso11c=lasso.rolling.window(Y,nprev,1,11,type="adalasso")
lasso12c=lasso.rolling.window(Y,nprev,1,12,type="adalasso")


### == juntando tudo ==  ###

corem=cbind(lasso1c$pred,lasso2c$pred,lasso3c$pred,lasso4c$pred,
          lasso5c$pred,lasso6c$pred,lasso7c$pred,lasso8c$pred,
        lasso9c$pred,lasso10c$pred,lasso11c$pred,lasso12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],180)

sqrt(colMeans((corem-tail(core$core,180))^2))

##
write.table(corem,"forecasts/presenteD/adalassorf-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)

