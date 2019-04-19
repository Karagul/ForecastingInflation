source("modelfunctions/func-rfols.R")
library(HDeconometrics)
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
set.seed(1)
rf1c=rfols.rolling.window(Y,nprev,1,1)
rf2c=rfols.rolling.window(Y,nprev,1,2)
rf3c=rfols.rolling.window(Y,nprev,1,3)
rf4c=rfols.rolling.window(Y,nprev,1,4)
rf5c=rfols.rolling.window(Y,nprev,1,5)
rf6c=rfols.rolling.window(Y,nprev,1,6)
rf7c=rfols.rolling.window(Y,nprev,1,7)
rf8c=rfols.rolling.window(Y,nprev,1,8)
rf9c=rfols.rolling.window(Y,nprev,1,9)
rf10c=rfols.rolling.window(Y,nprev,1,10)
rf11c=rfols.rolling.window(Y,nprev,1,11)
rf12c=rfols.rolling.window(Y,nprev,1,12)


### == juntando tudo ==  ###

corem=cbind(rf1c$pred,rf2c$pred,rf3c$pred,rf4c$pred,
          rf5c$pred,rf6c$pred,rf7c$pred,rf8c$pred,
          rf9c$pred,rf10c$pred,rf11c$pred,rf12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],180)

sqrt(colMeans((corem-tail(core$core,180))^2))

##
write.table(corem,"forecasts/presenteD/rfols-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)

