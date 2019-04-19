source("modelfunctions/func-lasso.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
Y=dados

nprev=132
alpha=0

## == passado == ##

ridge1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="lasso")
ridge1p=lasso.rolling.window(Y,nprev,2,1,alpha,type="lasso")
ridge2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="lasso")
ridge2p=lasso.rolling.window(Y,nprev,2,2,alpha,type="lasso")
ridge3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="lasso")
ridge3p=lasso.rolling.window(Y,nprev,2,3,alpha,type="lasso")
ridge4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="lasso")
ridge4p=lasso.rolling.window(Y,nprev,2,4,alpha,type="lasso")
ridge5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="lasso")
ridge5p=lasso.rolling.window(Y,nprev,2,5,alpha,type="lasso")
ridge6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="lasso")
ridge6p=lasso.rolling.window(Y,nprev,2,6,alpha,type="lasso")
ridge7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="lasso")
ridge7p=lasso.rolling.window(Y,nprev,2,7,alpha,type="lasso")
ridge8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="lasso")
ridge8p=lasso.rolling.window(Y,nprev,2,8,alpha,type="lasso")
ridge9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="lasso")
ridge9p=lasso.rolling.window(Y,nprev,2,9,alpha,type="lasso")
ridge10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="lasso")
ridge10p=lasso.rolling.window(Y,nprev,2,10,alpha,type="lasso")
ridge11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="lasso")
ridge11p=lasso.rolling.window(Y,nprev,2,11,alpha,type="lasso")
ridge12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="lasso")
ridge12p=lasso.rolling.window(Y,nprev,2,12,alpha,type="lasso")

### == juntando tudo ==  ###

cpi=cbind(ridge1c$pred,ridge2c$pred,ridge3c$pred,ridge4c$pred,
          ridge5c$pred,ridge6c$pred,ridge7c$pred,ridge8c$pred,
          ridge9c$pred,ridge10c$pred,ridge11c$pred,ridge12c$pred)

pce=cbind(ridge1p$pred,ridge2p$pred,ridge3p$pred,ridge4p$pred,
          ridge5p$pred,ridge6p$pred,ridge7p$pred,ridge8p$pred,
          ridge9p$pred,ridge10p$pred,ridge11p$pred,ridge12p$pred)


##
write.table(cpi,"forecasts/passado2000/ridge-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/ridge-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
