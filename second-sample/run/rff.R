source("modelfunctions/functionsD/func-rffact.R")
load("~/Dropbox/tese/inflacao jbes/workspaces/presenteD/randomforest.RData")
#library(HDeconometrics)
#library(randomForest)
load("dados/rawdata.RData")
Y=dados
dum=rep(0,nrow(Y))
dum[which.min(Y[,1])]=1
Y=cbind(Y,dum=dum)

nprev=180


## == presente == ##

rff1c=rffact.rolling.window(Y,nprev,1,1,rf1c$save.importance)
rff1p=rffact.rolling.window(Y,nprev,2,1,rf1p$save.importance)
rff2c=rffact.rolling.window(Y,nprev,1,2,rf2c$save.importance)
rff2p=rffact.rolling.window(Y,nprev,2,2,rf2p$save.importance)
rff3c=rffact.rolling.window(Y,nprev,1,3,rf3c$save.importance)
rff3p=rffact.rolling.window(Y,nprev,2,3,rf3p$save.importance)
rff4c=rffact.rolling.window(Y,nprev,1,4,rf4c$save.importance)
rff4p=rffact.rolling.window(Y,nprev,2,4,rf4p$save.importance)
rff5c=rffact.rolling.window(Y,nprev,1,5,rf5c$save.importance)
rff5p=rffact.rolling.window(Y,nprev,2,5,rf5p$save.importance)
rff6c=rffact.rolling.window(Y,nprev,1,6,rf6c$save.importance)
rff6p=rffact.rolling.window(Y,nprev,2,6,rf6p$save.importance)
rff7c=rffact.rolling.window(Y,nprev,1,7,rf7c$save.importance)
rff7p=rffact.rolling.window(Y,nprev,2,7,rf7p$save.importance)
rff8c=rffact.rolling.window(Y,nprev,1,8,rf8c$save.importance)
rff8p=rffact.rolling.window(Y,nprev,2,8,rf8p$save.importance)
rff9c=rffact.rolling.window(Y,nprev,1,9,rf9c$save.importance)
rff9p=rffact.rolling.window(Y,nprev,2,9,rf9p$save.importance)
rff10c=rffact.rolling.window(Y,nprev,1,10,rf10c$save.importance)
rff10p=rffact.rolling.window(Y,nprev,2,10,rf10p$save.importance)
rff11c=rffact.rolling.window(Y,nprev,1,11,rf11c$save.importance)
rff11p=rffact.rolling.window(Y,nprev,2,11,rf11p$save.importance)
rff12c=rffact.rolling.window(Y,nprev,1,12,rf12c$save.importance)
rff12p=rffact.rolling.window(Y,nprev,2,12,rf12p$save.importance)


### == juntando tudo ==  ###

cpi=cbind(rff1c$pred,rff2c$pred,rff3c$pred,rff4c$pred,
          rff5c$pred,rff6c$pred,rff7c$pred,rff8c$pred,
          rff9c$pred,rff10c$pred,rff11c$pred,rff12c$pred)

pce=cbind(rff1p$pred,rff2p$pred,rff3p$pred,rff4p$pred,
          rff5p$pred,rff6p$pred,rff7p$pred,rff8p$pred,
          rff9p$pred,rff10p$pred,rff11p$pred,rff12p$pred)


##
write.table(cpi,"forecasts/presenteD/rffact-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/presenteD/rffact-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

