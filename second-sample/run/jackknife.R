source("modelfunctions/functionsD/func-jn.R")
library(HDeconometrics)
library(quadprog)
load("dados/rawdata.RData")
Y=dados
dum=rep(0,nrow(Y))
dum[which.min(Y[,1])]=1
Y=cbind(Y,dum=dum)

nprev=180


jackknife1c=jackknife.rolling.window(Y,nprev,1,1)
jackknife1p=jackknife.rolling.window(Y,nprev,2,1)
jackknife2c=jackknife.rolling.window(Y,nprev,1,2)
jackknife2p=jackknife.rolling.window(Y,nprev,2,2)
jackknife3c=jackknife.rolling.window(Y,nprev,1,3)
jackknife3p=jackknife.rolling.window(Y,nprev,2,3)
jackknife4c=jackknife.rolling.window(Y,nprev,1,4)
jackknife4p=jackknife.rolling.window(Y,nprev,2,4)
jackknife5c=jackknife.rolling.window(Y,nprev,1,5)
jackknife5p=jackknife.rolling.window(Y,nprev,2,5)
jackknife6c=jackknife.rolling.window(Y,nprev,1,6)
jackknife6p=jackknife.rolling.window(Y,nprev,2,6)
jackknife7c=jackknife.rolling.window(Y,nprev,1,7)
jackknife7p=jackknife.rolling.window(Y,nprev,2,7)
jackknife8c=jackknife.rolling.window(Y,nprev,1,8)
jackknife8p=jackknife.rolling.window(Y,nprev,2,8)
jackknife9c=jackknife.rolling.window(Y,nprev,1,9)
jackknife9p=jackknife.rolling.window(Y,nprev,2,9)
jackknife10c=jackknife.rolling.window(Y,nprev,1,10)
jackknife10p=jackknife.rolling.window(Y,nprev,2,10)
jackknife11c=jackknife.rolling.window(Y,nprev,1,11)
jackknife11p=jackknife.rolling.window(Y,nprev,2,11)
jackknife12c=jackknife.rolling.window(Y,nprev,1,12)
jackknife12p=jackknife.rolling.window(Y,nprev,2,12)

### == juntando tudo ==  ###

cpi=cbind(jackknife1c$pred,jackknife2c$pred,jackknife3c$pred,jackknife4c$pred,
          jackknife5c$pred,jackknife6c$pred,jackknife7c$pred,jackknife8c$pred,
          jackknife9c$pred,jackknife10c$pred,jackknife11c$pred,jackknife12c$pred)

pce=cbind(jackknife1p$pred,jackknife2p$pred,jackknife3p$pred,jackknife4p$pred,
          jackknife5p$pred,jackknife6p$pred,jackknife7p$pred,jackknife8p$pred,
          jackknife9p$pred,jackknife10p$pred,jackknife11p$pred,jackknife12p$pred)


##
write.table(cpi,"forecasts/presenteD/jackknife-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/presenteD/jackknife-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

