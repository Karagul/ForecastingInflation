source("modelfunctions/func-lasso.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
Y=dados

nprev=132
alpha=0.5

## == passado == ##

adaelasticnet1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="adalasso")
adaelasticnet1p=lasso.rolling.window(Y,nprev,2,1,alpha,type="adalasso")
adaelasticnet2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="adalasso")
adaelasticnet2p=lasso.rolling.window(Y,nprev,2,2,alpha,type="adalasso")
adaelasticnet3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="adalasso")
adaelasticnet3p=lasso.rolling.window(Y,nprev,2,3,alpha,type="adalasso")
adaelasticnet4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="adalasso")
adaelasticnet4p=lasso.rolling.window(Y,nprev,2,4,alpha,type="adalasso")
adaelasticnet5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="adalasso")
adaelasticnet5p=lasso.rolling.window(Y,nprev,2,5,alpha,type="adalasso")
adaelasticnet6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="adalasso")
adaelasticnet6p=lasso.rolling.window(Y,nprev,2,6,alpha,type="adalasso")
adaelasticnet7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="adalasso")
adaelasticnet7p=lasso.rolling.window(Y,nprev,2,7,alpha,type="adalasso")
adaelasticnet8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="adalasso")
adaelasticnet8p=lasso.rolling.window(Y,nprev,2,8,alpha,type="adalasso")
adaelasticnet9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="adalasso")
adaelasticnet9p=lasso.rolling.window(Y,nprev,2,9,alpha,type="adalasso")
adaelasticnet10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="adalasso")
adaelasticnet10p=lasso.rolling.window(Y,nprev,2,10,alpha,type="adalasso")
adaelasticnet11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="adalasso")
adaelasticnet11p=lasso.rolling.window(Y,nprev,2,11,alpha,type="adalasso")
adaelasticnet12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="adalasso")
adaelasticnet12p=lasso.rolling.window(Y,nprev,2,12,alpha,type="adalasso")


# pols #
pols.adaelasticnet1c=pols.rolling.window(Y,nprev,1,1,adaelasticnet1c$coef)
pols.adaelasticnet1p=pols.rolling.window(Y,nprev,2,1,adaelasticnet1p$coef)
pols.adaelasticnet2c=pols.rolling.window(Y,nprev,1,2,adaelasticnet2c$coef)
pols.adaelasticnet2p=pols.rolling.window(Y,nprev,2,2,adaelasticnet2p$coef)
pols.adaelasticnet3c=pols.rolling.window(Y,nprev,1,3,adaelasticnet3c$coef)
pols.adaelasticnet3p=pols.rolling.window(Y,nprev,2,3,adaelasticnet3p$coef)
pols.adaelasticnet4c=pols.rolling.window(Y,nprev,1,4,adaelasticnet4c$coef)
pols.adaelasticnet4p=pols.rolling.window(Y,nprev,2,4,adaelasticnet4p$coef)
pols.adaelasticnet5c=pols.rolling.window(Y,nprev,1,5,adaelasticnet5c$coef)
pols.adaelasticnet5p=pols.rolling.window(Y,nprev,2,5,adaelasticnet5p$coef)
pols.adaelasticnet6c=pols.rolling.window(Y,nprev,1,6,adaelasticnet6c$coef)
pols.adaelasticnet6p=pols.rolling.window(Y,nprev,2,6,adaelasticnet6p$coef)
pols.adaelasticnet7c=pols.rolling.window(Y,nprev,1,7,adaelasticnet7c$coef)
pols.adaelasticnet7p=pols.rolling.window(Y,nprev,2,7,adaelasticnet7p$coef)
pols.adaelasticnet8c=pols.rolling.window(Y,nprev,1,8,adaelasticnet8c$coef)
pols.adaelasticnet8p=pols.rolling.window(Y,nprev,2,8,adaelasticnet8p$coef)
pols.adaelasticnet9c=pols.rolling.window(Y,nprev,1,9,adaelasticnet9c$coef)
pols.adaelasticnet9p=pols.rolling.window(Y,nprev,2,9,adaelasticnet9p$coef)
pols.adaelasticnet10c=pols.rolling.window(Y,nprev,1,10,adaelasticnet10c$coef)
pols.adaelasticnet10p=pols.rolling.window(Y,nprev,2,10,adaelasticnet10p$coef)
pols.adaelasticnet11c=pols.rolling.window(Y,nprev,1,11,adaelasticnet11c$coef)
pols.adaelasticnet11p=pols.rolling.window(Y,nprev,2,11,adaelasticnet11p$coef)
pols.adaelasticnet12c=pols.rolling.window(Y,nprev,1,12,adaelasticnet12c$coef)
pols.adaelasticnet12p=pols.rolling.window(Y,nprev,2,12,adaelasticnet12p$coef)


### == juntando tudo ==  ###

cpi=cbind(adaelasticnet1c$pred,adaelasticnet2c$pred,adaelasticnet3c$pred,adaelasticnet4c$pred,
          adaelasticnet5c$pred,adaelasticnet6c$pred,adaelasticnet7c$pred,adaelasticnet8c$pred,
          adaelasticnet9c$pred,adaelasticnet10c$pred,adaelasticnet11c$pred,adaelasticnet12c$pred)

pce=cbind(adaelasticnet1p$pred,adaelasticnet2p$pred,adaelasticnet3p$pred,adaelasticnet4p$pred,
          adaelasticnet5p$pred,adaelasticnet6p$pred,adaelasticnet7p$pred,adaelasticnet8p$pred,
          adaelasticnet9p$pred,adaelasticnet10p$pred,adaelasticnet11p$pred,adaelasticnet12p$pred)


pols.cpi=cbind(pols.adaelasticnet1c$pred,pols.adaelasticnet2c$pred,pols.adaelasticnet3c$pred,pols.adaelasticnet4c$pred,
               pols.adaelasticnet5c$pred,pols.adaelasticnet6c$pred,pols.adaelasticnet7c$pred,pols.adaelasticnet8c$pred,
               pols.adaelasticnet9c$pred,pols.adaelasticnet10c$pred,pols.adaelasticnet11c$pred,pols.adaelasticnet12c$pred)

pols.pce=cbind(pols.adaelasticnet1p$pred,pols.adaelasticnet2p$pred,pols.adaelasticnet3p$pred,pols.adaelasticnet4p$pred,
               pols.adaelasticnet5p$pred,pols.adaelasticnet6p$pred,pols.adaelasticnet7p$pred,pols.adaelasticnet8p$pred,
               pols.adaelasticnet9p$pred,pols.adaelasticnet10p$pred,pols.adaelasticnet11p$pred,pols.adaelasticnet12p$pred)



##
write.table(cpi,"forecasts/passado2000/adaelasticnet-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/adaelasticnet-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

write.table(pols.cpi,"forecasts/passado2000/pols-adaelasticnet-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pols.pce,"forecasts/passado2000/pols-adaelasticnet-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
