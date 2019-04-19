source("modelfunctions/func-boosting.R")
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

## == passado == ##

boosting1c=boosting.rolling.window(Y,nprev,1,1)
boosting2c=boosting.rolling.window(Y,nprev,1,2)
boosting3c=boosting.rolling.window(Y,nprev,1,3)
boosting4c=boosting.rolling.window(Y,nprev,1,4)
boosting5c=boosting.rolling.window(Y,nprev,1,5)
boosting6c=boosting.rolling.window(Y,nprev,1,6)
boosting7c=boosting.rolling.window(Y,nprev,1,7)
boosting8c=boosting.rolling.window(Y,nprev,1,8)
boosting9c=boosting.rolling.window(Y,nprev,1,9)
boosting10c=boosting.rolling.window(Y,nprev,1,10)
boosting11c=boosting.rolling.window(Y,nprev,1,11)
boosting12c=boosting.rolling.window(Y,nprev,1,12)

### == juntando tudo ==  ###

corem=cbind(boosting1c$pred,boosting2c$pred,boosting3c$pred,boosting4c$pred,
           boosting5c$pred,boosting6c$pred,boosting7c$pred,boosting8c$pred,
           boosting9c$pred,boosting10c$pred,boosting11c$pred,boosting12c$pred)
corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],132)

sqrt(colMeans((corem-tail(core$core,132))^2))


write.table(corem,"forecasts/passado2000/boosting-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)
