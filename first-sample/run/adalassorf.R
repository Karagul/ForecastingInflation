source("modelfunctions/func-adalassorf.R")
#library(HDeconometrics)
library(HDeconometricsBeta)
library(randomForest)
load("dados/rawdata2000.rda")
Y=dados

nprev=132


## == presente == ##

#rf1c=lasso.rolling.window(Y,nprev,1,1,type="adalasso")
rf1p=lasso.rolling.window(Y,nprev,2,1,type="adalasso")
#rf2c=lasso.rolling.window(Y,nprev,1,2,type="adalasso")
rf2p=lasso.rolling.window(Y,nprev,2,2,type="adalasso")
#rf3c=lasso.rolling.window(Y,nprev,1,3,type="adalasso")
rf3p=lasso.rolling.window(Y,nprev,2,3,type="adalasso")
#rf4c=lasso.rolling.window(Y,nprev,1,4,type="adalasso")
rf4p=lasso.rolling.window(Y,nprev,2,4,type="adalasso")
#rf5c=lasso.rolling.window(Y,nprev,1,5,type="adalasso")
rf5p=lasso.rolling.window(Y,nprev,2,5,type="adalasso")
#rf6c=lasso.rolling.window(Y,nprev,1,6,type="adalasso")
rf6p=lasso.rolling.window(Y,nprev,2,6,type="adalasso")
#rf7c=lasso.rolling.window(Y,nprev,1,7,type="adalasso")
rf7p=lasso.rolling.window(Y,nprev,2,7,type="adalasso")
#rf8c=lasso.rolling.window(Y,nprev,1,8,type="adalasso")
rf8p=lasso.rolling.window(Y,nprev,2,8,type="adalasso")
#rf9c=lasso.rolling.window(Y,nprev,1,9,type="adalasso")
rf9p=lasso.rolling.window(Y,nprev,2,9,type="adalasso")
#rf10c=lasso.rolling.window(Y,nprev,1,10,type="adalasso")
rf10p=lasso.rolling.window(Y,nprev,2,10,type="adalasso")
#rf11c=lasso.rolling.window(Y,nprev,1,11,type="adalasso")
rf11p=lasso.rolling.window(Y,nprev,2,11,type="adalasso")
#rf12c=lasso.rolling.window(Y,nprev,1,12,type="adalasso")
rf12p=lasso.rolling.window(Y,nprev,2,12,type="adalasso")


### == juntando tudo ==  ###

#cpi=cbind(rf1c$pred,rf2c$pred,rf3c$pred,rf4c$pred,
#          rf5c$pred,rf6c$pred,rf7c$pred,rf8c$pred,
#          rf9c$pred,rf10c$pred,rf11c$pred,rf12c$pred)

pce=cbind(rf1p$pred,rf2p$pred,rf3p$pred,rf4p$pred,
          rf5p$pred,rf6p$pred,rf7p$pred,rf8p$pred,
          rf9p$pred,rf10p$pred,rf11p$pred,rf12p$pred)


##
#write.table(cpi,"forecasts/passado2000/adalassorf-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/adalassorf-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

