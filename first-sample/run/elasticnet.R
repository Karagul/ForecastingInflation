source("modelfunctions/func-lasso.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
Y=dados

nprev=132
alpha=0.5

## == passado == ##

elasticnet1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="lasso")
elasticnet1p=lasso.rolling.window(Y,nprev,2,1,alpha,type="lasso")
elasticnet2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="lasso")
elasticnet2p=lasso.rolling.window(Y,nprev,2,2,alpha,type="lasso")
elasticnet3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="lasso")
elasticnet3p=lasso.rolling.window(Y,nprev,2,3,alpha,type="lasso")
elasticnet4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="lasso")
elasticnet4p=lasso.rolling.window(Y,nprev,2,4,alpha,type="lasso")
elasticnet5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="lasso")
elasticnet5p=lasso.rolling.window(Y,nprev,2,5,alpha,type="lasso")
elasticnet6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="lasso")
elasticnet6p=lasso.rolling.window(Y,nprev,2,6,alpha,type="lasso")
elasticnet7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="lasso")
elasticnet7p=lasso.rolling.window(Y,nprev,2,7,alpha,type="lasso")
elasticnet8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="lasso")
elasticnet8p=lasso.rolling.window(Y,nprev,2,8,alpha,type="lasso")
elasticnet9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="lasso")
elasticnet9p=lasso.rolling.window(Y,nprev,2,9,alpha,type="lasso")
elasticnet10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="lasso")
elasticnet10p=lasso.rolling.window(Y,nprev,2,10,alpha,type="lasso")
elasticnet11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="lasso")
elasticnet11p=lasso.rolling.window(Y,nprev,2,11,alpha,type="lasso")
elasticnet12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="lasso")
elasticnet12p=lasso.rolling.window(Y,nprev,2,12,alpha,type="lasso")


# pols #
pols.elasticnet1c=pols.rolling.window(Y,nprev,1,1,elasticnet1c$coef)
pols.elasticnet1p=pols.rolling.window(Y,nprev,2,1,elasticnet1p$coef)
pols.elasticnet2c=pols.rolling.window(Y,nprev,1,2,elasticnet2c$coef)
pols.elasticnet2p=pols.rolling.window(Y,nprev,2,2,elasticnet2p$coef)
pols.elasticnet3c=pols.rolling.window(Y,nprev,1,3,elasticnet3c$coef)
pols.elasticnet3p=pols.rolling.window(Y,nprev,2,3,elasticnet3p$coef)
pols.elasticnet4c=pols.rolling.window(Y,nprev,1,4,elasticnet4c$coef)
pols.elasticnet4p=pols.rolling.window(Y,nprev,2,4,elasticnet4p$coef)
pols.elasticnet5c=pols.rolling.window(Y,nprev,1,5,elasticnet5c$coef)
pols.elasticnet5p=pols.rolling.window(Y,nprev,2,5,elasticnet5p$coef)
pols.elasticnet6c=pols.rolling.window(Y,nprev,1,6,elasticnet6c$coef)
pols.elasticnet6p=pols.rolling.window(Y,nprev,2,6,elasticnet6p$coef)
pols.elasticnet7c=pols.rolling.window(Y,nprev,1,7,elasticnet7c$coef)
pols.elasticnet7p=pols.rolling.window(Y,nprev,2,7,elasticnet7p$coef)
pols.elasticnet8c=pols.rolling.window(Y,nprev,1,8,elasticnet8c$coef)
pols.elasticnet8p=pols.rolling.window(Y,nprev,2,8,elasticnet8p$coef)
pols.elasticnet9c=pols.rolling.window(Y,nprev,1,9,elasticnet9c$coef)
pols.elasticnet9p=pols.rolling.window(Y,nprev,2,9,elasticnet9p$coef)
pols.elasticnet10c=pols.rolling.window(Y,nprev,1,10,elasticnet10c$coef)
pols.elasticnet10p=pols.rolling.window(Y,nprev,2,10,elasticnet10p$coef)
pols.elasticnet11c=pols.rolling.window(Y,nprev,1,11,elasticnet11c$coef)
pols.elasticnet11p=pols.rolling.window(Y,nprev,2,11,elasticnet11p$coef)
pols.elasticnet12c=pols.rolling.window(Y,nprev,1,12,elasticnet12c$coef)
pols.elasticnet12p=pols.rolling.window(Y,nprev,2,12,elasticnet12p$coef)


### == juntando tudo ==  ###

cpi=cbind(elasticnet1c$pred,elasticnet2c$pred,elasticnet3c$pred,elasticnet4c$pred,
          elasticnet5c$pred,elasticnet6c$pred,elasticnet7c$pred,elasticnet8c$pred,
          elasticnet9c$pred,elasticnet10c$pred,elasticnet11c$pred,elasticnet12c$pred)

pce=cbind(elasticnet1p$pred,elasticnet2p$pred,elasticnet3p$pred,elasticnet4p$pred,
          elasticnet5p$pred,elasticnet6p$pred,elasticnet7p$pred,elasticnet8p$pred,
          elasticnet9p$pred,elasticnet10p$pred,elasticnet11p$pred,elasticnet12p$pred)


pols.cpi=cbind(pols.elasticnet1c$pred,pols.elasticnet2c$pred,pols.elasticnet3c$pred,pols.elasticnet4c$pred,
               pols.elasticnet5c$pred,pols.elasticnet6c$pred,pols.elasticnet7c$pred,pols.elasticnet8c$pred,
               pols.elasticnet9c$pred,pols.elasticnet10c$pred,pols.elasticnet11c$pred,pols.elasticnet12c$pred)

pols.pce=cbind(pols.elasticnet1p$pred,pols.elasticnet2p$pred,pols.elasticnet3p$pred,pols.elasticnet4p$pred,
               pols.elasticnet5p$pred,pols.elasticnet6p$pred,pols.elasticnet7p$pred,pols.elasticnet8p$pred,
               pols.elasticnet9p$pred,pols.elasticnet10p$pred,pols.elasticnet11p$pred,pols.elasticnet12p$pred)



##
write.table(cpi,"forecasts/passado2000/elasticnet-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/elasticnet-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

write.table(pols.cpi,"forecasts/passado2000/pols-elasticnet-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pols.pce,"forecasts/passado2000/pols-elasticnet-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
