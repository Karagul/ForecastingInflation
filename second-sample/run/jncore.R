source("modelfunctions/func-jn.R")
library(quadprog)
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


jackknife1c=jackknife.rolling.window(Y,nprev,1,1)
jackknife2c=jackknife.rolling.window(Y,nprev,1,2)
jackknife3c=jackknife.rolling.window(Y,nprev,1,3)
jackknife4c=jackknife.rolling.window(Y,nprev,1,4)
jackknife5c=jackknife.rolling.window(Y,nprev,1,5)
jackknife6c=jackknife.rolling.window(Y,nprev,1,6)
jackknife7c=jackknife.rolling.window(Y,nprev,1,7)
jackknife8c=jackknife.rolling.window(Y,nprev,1,8)
jackknife9c=jackknife.rolling.window(Y,nprev,1,9)
jackknife10c=jackknife.rolling.window(Y,nprev,1,10)
jackknife11c=jackknife.rolling.window(Y,nprev,1,11)
jackknife12c=jackknife.rolling.window(Y,nprev,1,12)

### == juntando tudo ==  ###

corem=cbind(jackknife1c$pred,jackknife2c$pred,jackknife3c$pred,jackknife4c$pred,
          jackknife5c$pred,jackknife6c$pred,jackknife7c$pred,jackknife8c$pred,
          jackknife9c$pred,jackknife10c$pred,jackknife11c$pred,jackknife12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],180)

sqrt(colMeans((corem-tail(core$core,180))^2))

##
write.table(corem,"forecasts/presenteD/jackknife-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)

