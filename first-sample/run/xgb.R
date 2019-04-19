source("modelfunctions/func-xgb.R")
library(HDeconometrics)
load("dados/rawdata2000.rda")
Y=dados

nprev=132


## == presente == ##

xgb1c=xgb.rolling.window(Y,nprev,1,1)
xgb1p=xgb.rolling.window(Y,nprev,2,1)
xgb2c=xgb.rolling.window(Y,nprev,1,2)
xgb2p=xgb.rolling.window(Y,nprev,2,2)
xgb3c=xgb.rolling.window(Y,nprev,1,3)
xgb3p=xgb.rolling.window(Y,nprev,2,3)
xgb4c=xgb.rolling.window(Y,nprev,1,4)
xgb4p=xgb.rolling.window(Y,nprev,2,4)
xgb5c=xgb.rolling.window(Y,nprev,1,5)
xgb5p=xgb.rolling.window(Y,nprev,2,5)
xgb6c=xgb.rolling.window(Y,nprev,1,6)
xgb6p=xgb.rolling.window(Y,nprev,2,6)
xgb7c=xgb.rolling.window(Y,nprev,1,7)
xgb7p=xgb.rolling.window(Y,nprev,2,7)
xgb8c=xgb.rolling.window(Y,nprev,1,8)
xgb8p=xgb.rolling.window(Y,nprev,2,8)
xgb9c=xgb.rolling.window(Y,nprev,1,9)
xgb9p=xgb.rolling.window(Y,nprev,2,9)
xgb10c=xgb.rolling.window(Y,nprev,1,10)
xgb10p=xgb.rolling.window(Y,nprev,2,10)
xgb11c=xgb.rolling.window(Y,nprev,1,11)
xgb11p=xgb.rolling.window(Y,nprev,2,11)
xgb12c=xgb.rolling.window(Y,nprev,1,12)
xgb12p=xgb.rolling.window(Y,nprev,2,12)


### == juntando tudo ==  ###

cpi=cbind(xgb1c$pred,xgb2c$pred,xgb3c$pred,xgb4c$pred,
          xgb5c$pred,xgb6c$pred,xgb7c$pred,xgb8c$pred,
          xgb9c$pred,xgb10c$pred,xgb11c$pred,xgb12c$pred)

pce=cbind(xgb1p$pred,xgb2p$pred,xgb3p$pred,xgb4p$pred,
          xgb5p$pred,xgb6p$pred,xgb7p$pred,xgb8p$pred,
          xgb9p$pred,xgb10p$pred,xgb11p$pred,xgb12p$pred)


##
write.table(cpi,"forecasts/passado2000/xgb-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/xgb-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

