source("modelfunctions/func-csr.R")
library(HDeconometrics)
library(tidyverse)
load("dados/rawdata.RData")

core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))

nprev=180

## == presente == ##

csr1c=csr.rolling.window(Y,nprev,1,1)
csr2c=csr.rolling.window(Y,nprev,1,2)
csr3c=csr.rolling.window(Y,nprev,1,3)
csr4c=csr.rolling.window(Y,nprev,1,4)
csr5c=csr.rolling.window(Y,nprev,1,5)
csr6c=csr.rolling.window(Y,nprev,1,6)
csr7c=csr.rolling.window(Y,nprev,1,7)
csr8c=csr.rolling.window(Y,nprev,1,8)
csr9c=csr.rolling.window(Y,nprev,1,9)
csr10c=csr.rolling.window(Y,nprev,1,10)
csr11c=csr.rolling.window(Y,nprev,1,11)
csr12c=csr.rolling.window(Y,nprev,1,12)


### == juntando tudo ==  ###

corem=cbind(csr1c$pred,csr2c$pred,csr3c$pred,csr4c$pred,
          csr5c$pred,csr6c$pred,csr7c$pred,csr8c$pred,
          csr9c$pred,csr10c$pred,csr11c$pred,csr12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],180)

sqrt(colMeans((corem-tail(core$core,180))^2))

##
write.table(corem,"forecasts/presenteD/csr-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)

