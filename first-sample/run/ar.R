source("modelfunctions/func-ar.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
Y=dados


nprev=132


## == passado == ##

ar1c=ar.rolling.window(Y,nprev,1,1,type="fixed")
ar1p=ar.rolling.window(Y,nprev,2,1,type="fixed")
ar2c=ar.rolling.window(Y,nprev,1,2,type="fixed")
ar2p=ar.rolling.window(Y,nprev,2,2,type="fixed")
ar3c=ar.rolling.window(Y,nprev,1,3,type="fixed")
ar3p=ar.rolling.window(Y,nprev,2,3,type="fixed")
ar4c=ar.rolling.window(Y,nprev,1,4,type="fixed")
ar4p=ar.rolling.window(Y,nprev,2,4,type="fixed")
ar5c=ar.rolling.window(Y,nprev,1,5,type="fixed")
ar5p=ar.rolling.window(Y,nprev,2,5,type="fixed")
ar6c=ar.rolling.window(Y,nprev,1,6,type="fixed")
ar6p=ar.rolling.window(Y,nprev,2,6,type="fixed")
ar7c=ar.rolling.window(Y,nprev,1,7,type="fixed")
ar7p=ar.rolling.window(Y,nprev,2,7,type="fixed")
ar8c=ar.rolling.window(Y,nprev,1,8,type="fixed")
ar8p=ar.rolling.window(Y,nprev,2,8,type="fixed")
ar9c=ar.rolling.window(Y,nprev,1,9,type="fixed")
ar9p=ar.rolling.window(Y,nprev,2,9,type="fixed")
ar10c=ar.rolling.window(Y,nprev,1,10,type="fixed")
ar10p=ar.rolling.window(Y,nprev,2,10,type="fixed")
ar11c=ar.rolling.window(Y,nprev,1,11,type="fixed")
ar11p=ar.rolling.window(Y,nprev,2,11,type="fixed")
ar12c=ar.rolling.window(Y,nprev,1,12,type="fixed")
ar12p=ar.rolling.window(Y,nprev,2,12,type="fixed")


bar1c=ar.rolling.window(Y,nprev,1,1,type="bic")
bar1p=ar.rolling.window(Y,nprev,2,1,type="bic")
bar2c=ar.rolling.window(Y,nprev,1,2,type="bic")
bar2p=ar.rolling.window(Y,nprev,2,2,type="bic")
bar3c=ar.rolling.window(Y,nprev,1,3,type="bic")
bar3p=ar.rolling.window(Y,nprev,2,3,type="bic")
bar4c=ar.rolling.window(Y,nprev,1,4,type="bic")
bar4p=ar.rolling.window(Y,nprev,2,4,type="bic")
bar5c=ar.rolling.window(Y,nprev,1,5,type="bic")
bar5p=ar.rolling.window(Y,nprev,2,5,type="bic")
bar6c=ar.rolling.window(Y,nprev,1,6,type="bic")
bar6p=ar.rolling.window(Y,nprev,2,6,type="bic")
bar7c=ar.rolling.window(Y,nprev,1,7,type="bic")
bar7p=ar.rolling.window(Y,nprev,2,7,type="bic")
bar8c=ar.rolling.window(Y,nprev,1,8,type="bic")
bar8p=ar.rolling.window(Y,nprev,2,8,type="bic")
bar9c=ar.rolling.window(Y,nprev,1,9,type="bic")
bar9p=ar.rolling.window(Y,nprev,2,9,type="bic")
bar10c=ar.rolling.window(Y,nprev,1,10,type="bic")
bar10p=ar.rolling.window(Y,nprev,2,10,type="bic")
bar11c=ar.rolling.window(Y,nprev,1,11,type="bic")
bar11p=ar.rolling.window(Y,nprev,2,11,type="bic")
bar12c=ar.rolling.window(Y,nprev,1,12,type="bic")
bar12p=ar.rolling.window(Y,nprev,2,12,type="bic")




### == juntando tudo ==  ###

cpi=cbind(ar1c$pred,ar2c$pred,ar3c$pred,ar4c$pred,
          ar5c$pred,ar6c$pred,ar7c$pred,ar8c$pred,
          ar9c$pred,ar10c$pred,ar11c$pred,ar12c$pred)

pce=cbind(ar1p$pred,ar2p$pred,ar3p$pred,ar4p$pred,
          ar5p$pred,ar6p$pred,ar7p$pred,ar8p$pred,
          ar9p$pred,ar10p$pred,ar11p$pred,ar12p$pred)

bcpi=cbind(bar1c$pred,bar2c$pred,bar3c$pred,bar4c$pred,
          bar5c$pred,bar6c$pred,bar7c$pred,bar8c$pred,
          bar9c$pred,bar10c$pred,bar11c$pred,bar12c$pred)

bpce=cbind(bar1p$pred,bar2p$pred,bar3p$pred,bar4p$pred,
          bar5p$pred,bar6p$pred,bar7p$pred,bar8p$pred,
          bar9p$pred,bar10p$pred,bar11p$pred,bar12p$pred)



##
write.table(cpi,"forecasts/passado2000/ar-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/ar-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

write.table(bcpi,"forecasts/passado2000/bicar-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(bpce,"forecasts/passado2000/bicar-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
