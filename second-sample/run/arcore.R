source("modelfunctions/func-ar.R")
library(HDeconometrics)
load("dados/rawdata.RData")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))
nprev=180


## == presente == ##

ar1c=ar.rolling.window(Y,nprev,1,1,type="fixed")
ar2c=ar.rolling.window(Y,nprev,1,2,type="fixed")
ar3c=ar.rolling.window(Y,nprev,1,3,type="fixed")
ar4c=ar.rolling.window(Y,nprev,1,4,type="fixed")
ar5c=ar.rolling.window(Y,nprev,1,5,type="fixed")
ar6c=ar.rolling.window(Y,nprev,1,6,type="fixed")
ar7c=ar.rolling.window(Y,nprev,1,7,type="fixed")
ar8c=ar.rolling.window(Y,nprev,1,8,type="fixed")
ar9c=ar.rolling.window(Y,nprev,1,9,type="fixed")
ar10c=ar.rolling.window(Y,nprev,1,10,type="fixed")
ar11c=ar.rolling.window(Y,nprev,1,11,type="fixed")
ar12c=ar.rolling.window(Y,nprev,1,12,type="fixed")


bar1c=ar.rolling.window(Y,nprev,1,1,type="bic")
bar2c=ar.rolling.window(Y,nprev,1,2,type="bic")
bar3c=ar.rolling.window(Y,nprev,1,3,type="bic")
bar4c=ar.rolling.window(Y,nprev,1,4,type="bic")
bar5c=ar.rolling.window(Y,nprev,1,5,type="bic")
bar6c=ar.rolling.window(Y,nprev,1,6,type="bic")
bar7c=ar.rolling.window(Y,nprev,1,7,type="bic")
bar8c=ar.rolling.window(Y,nprev,1,8,type="bic")
bar9c=ar.rolling.window(Y,nprev,1,9,type="bic")
bar10c=ar.rolling.window(Y,nprev,1,10,type="bic")
bar11c=ar.rolling.window(Y,nprev,1,11,type="bic")
bar12c=ar.rolling.window(Y,nprev,1,12,type="bic")




### == juntando tudo ==  ###

corem=cbind(ar1c$pred,ar2c$pred,ar3c$pred,ar4c$pred,
          ar5c$pred,ar6c$pred,ar7c$pred,ar8c$pred,
          ar9c$pred,ar10c$pred,ar11c$pred,ar12c$pred)


bcorem=cbind(bar1c$pred,bar2c$pred,bar3c$pred,bar4c$pred,
           bar5c$pred,bar6c$pred,bar7c$pred,bar8c$pred,
           bar9c$pred,bar10c$pred,bar11c$pred,bar12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],180)
bcorem=bcorem+tail(core$core[-c((length(core$core)-11):length(core$core))],180)

sqrt(colMeans((bcorem-tail(core$core,180))^2))


##
write.table(corem,"forecasts/presenteD/ar-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)

write.table(bcorem,"forecasts/presenteD/bicar-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)
