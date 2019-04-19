source("modelfunctions/functionsD/func-bag.R")
library(HDeconometrics)
load("dados/rawdata.RData")
Y=dados
dum=rep(0,nrow(Y))
dum[which.min(Y[,1])]=1
Y=cbind(Y,dum=dum)

nprev=180


## == presente == ##

bagg1c=bagg.rolling.window(Y,nprev,1,1)
bagg1p=bagg.rolling.window(Y,nprev,2,1)
bagg2c=bagg.rolling.window(Y,nprev,1,2)
bagg2p=bagg.rolling.window(Y,nprev,2,2)
bagg3c=bagg.rolling.window(Y,nprev,1,3)
bagg3p=bagg.rolling.window(Y,nprev,2,3)
bagg4c=bagg.rolling.window(Y,nprev,1,4)
bagg4p=bagg.rolling.window(Y,nprev,2,4)
bagg5c=bagg.rolling.window(Y,nprev,1,5)
bagg5p=bagg.rolling.window(Y,nprev,2,5)
bagg6c=bagg.rolling.window(Y,nprev,1,6)
bagg6p=bagg.rolling.window(Y,nprev,2,6)
bagg7c=bagg.rolling.window(Y,nprev,1,7)
bagg7p=bagg.rolling.window(Y,nprev,2,7)
bagg8c=bagg.rolling.window(Y,nprev,1,8)
bagg8p=bagg.rolling.window(Y,nprev,2,8)
bagg9c=bagg.rolling.window(Y,nprev,1,9)
bagg9p=bagg.rolling.window(Y,nprev,2,9)
bagg10c=bagg.rolling.window(Y,nprev,1,10)
bagg10p=bagg.rolling.window(Y,nprev,2,10)
bagg11c=bagg.rolling.window(Y,nprev,1,11)
bagg11p=bagg.rolling.window(Y,nprev,2,11)
bagg12c=bagg.rolling.window(Y,nprev,1,12)
bagg12p=bagg.rolling.window(Y,nprev,2,12)


### == juntando tudo ==  ###

cpi=cbind(bagg1c$pred,bagg2c$pred,bagg3c$pred,bagg4c$pred,
          bagg5c$pred,bagg6c$pred,bagg7c$pred,bagg8c$pred,
          bagg9c$pred,bagg10c$pred,bagg11c$pred,bagg12c$pred)

pce=cbind(bagg1p$pred,bagg2p$pred,bagg3p$pred,bagg4p$pred,
          bagg5p$pred,bagg6p$pred,bagg7p$pred,bagg8p$pred,
          bagg9p$pred,bagg10p$pred,bagg11p$pred,bagg12p$pred)


##
write.table(cpi,"forecasts/presenteD/bagg-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/presenteD/bagg-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

