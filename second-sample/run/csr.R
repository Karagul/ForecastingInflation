source("modelfunctions/functionsD/func-csr.R")
library(HDeconometrics)
load("dados/rawdata.RData")
Y=dados
dum=rep(0,nrow(Y))
dum[which.min(Y[,1])]=1
Y=cbind(Y,dum=dum)

nprev=180


## == presente == ##

csr1c=csr.rolling.window(Y,nprev,1,1)
csr1p=csr.rolling.window(Y,nprev,2,1)
csr2c=csr.rolling.window(Y,nprev,1,2)
csr2p=csr.rolling.window(Y,nprev,2,2)
csr3c=csr.rolling.window(Y,nprev,1,3)
csr3p=csr.rolling.window(Y,nprev,2,3)
csr4c=csr.rolling.window(Y,nprev,1,4)
csr4p=csr.rolling.window(Y,nprev,2,4)
csr5c=csr.rolling.window(Y,nprev,1,5)
csr5p=csr.rolling.window(Y,nprev,2,5)
csr6c=csr.rolling.window(Y,nprev,1,6)
csr6p=csr.rolling.window(Y,nprev,2,6)
csr7c=csr.rolling.window(Y,nprev,1,7)
csr7p=csr.rolling.window(Y,nprev,2,7)
csr8c=csr.rolling.window(Y,nprev,1,8)
csr8p=csr.rolling.window(Y,nprev,2,8)
csr9c=csr.rolling.window(Y,nprev,1,9)
csr9p=csr.rolling.window(Y,nprev,2,9)
csr10c=csr.rolling.window(Y,nprev,1,10)
csr10p=csr.rolling.window(Y,nprev,2,10)
csr11c=csr.rolling.window(Y,nprev,1,11)
csr11p=csr.rolling.window(Y,nprev,2,11)
csr12c=csr.rolling.window(Y,nprev,1,12)
csr12p=csr.rolling.window(Y,nprev,2,12)


### == juntando tudo ==  ###

cpi=cbind(csr1c$pred,csr2c$pred,csr3c$pred,csr4c$pred,
          csr5c$pred,csr6c$pred,csr7c$pred,csr8c$pred,
          csr9c$pred,csr10c$pred,csr11c$pred,csr12c$pred)

pce=cbind(csr1p$pred,csr2p$pred,csr3p$pred,csr4p$pred,
          csr5p$pred,csr6p$pred,csr7p$pred,csr8p$pred,
          csr9p$pred,csr10p$pred,csr11p$pred,csr12p$pred)


##
write.table(cpi,"forecasts/presenteD/csr-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/presenteD/csr-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

