source("modelfunctions/functionsD/func-adalassorf.R")
#library(HDeconometrics)
library(HDeconometricsBeta)
library(randomForest)
load("dados/rawdata.RData")
Y=dados
dum=rep(0,nrow(Y))
dum[which.min(Y[,1])]=1
Y=cbind(Y,dum=dum)

nprev=180


## == presente == ##

#lasso1c=lasso.rolling.window(Y,nprev,1,1,type="adalasso")
lasso1p=lasso.rolling.window(Y,nprev,2,1,type="adalasso")
#lasso2c=lasso.rolling.window(Y,nprev,1,2,type="adalasso")
lasso2p=lasso.rolling.window(Y,nprev,2,2,type="adalasso")
#lasso3c=lasso.rolling.window(Y,nprev,1,3,type="adalasso")
lasso3p=lasso.rolling.window(Y,nprev,2,3,type="adalasso")
#lasso4c=lasso.rolling.window(Y,nprev,1,4,type="adalasso")
lasso4p=lasso.rolling.window(Y,nprev,2,4,type="adalasso")
#lasso5c=lasso.rolling.window(Y,nprev,1,5,type="adalasso")
lasso5p=lasso.rolling.window(Y,nprev,2,5,type="adalasso")
#lasso6c=lasso.rolling.window(Y,nprev,1,6,type="adalasso")
lasso6p=lasso.rolling.window(Y,nprev,2,6,type="adalasso")
#lasso7c=lasso.rolling.window(Y,nprev,1,7,type="adalasso")
lasso7p=lasso.rolling.window(Y,nprev,2,7,type="adalasso")
#lasso8c=lasso.rolling.window(Y,nprev,1,8,type="adalasso")
lasso8p=lasso.rolling.window(Y,nprev,2,8,type="adalasso")
#lasso9c=lasso.rolling.window(Y,nprev,1,9,type="adalasso")
lasso9p=lasso.rolling.window(Y,nprev,2,9,type="adalasso")
#lasso10c=lasso.rolling.window(Y,nprev,1,10,type="adalasso")
lasso10p=lasso.rolling.window(Y,nprev,2,10,type="adalasso")
#lasso11c=lasso.rolling.window(Y,nprev,1,11,type="adalasso")
lasso11p=lasso.rolling.window(Y,nprev,2,11,type="adalasso")
#lasso12c=lasso.rolling.window(Y,nprev,1,12,type="adalasso")
lasso12p=lasso.rolling.window(Y,nprev,2,12,type="adalasso")


### == juntando tudo ==  ###

#cpi=cbind(rf1c$pred,rf2c$pred,rf3c$pred,rf4c$pred,
#          rf5c$pred,rf6c$pred,rf7c$pred,rf8c$pred,
#          rf9c$pred,rf10c$pred,rf11c$pred,rf12c$pred)

pce=cbind(lasso1p$pred,lasso2p$pred,lasso3p$pred,lasso4p$pred,
          lasso5p$pred,lasso6p$pred,lasso7p$pred,lasso8p$pred,
          lasso9p$pred,lasso10p$pred,lasso11p$pred,lasso12p$pred)


##
#write.table(cpi,"forecasts/presenteD/adalassorf-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/presenteD/adalassorf-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

