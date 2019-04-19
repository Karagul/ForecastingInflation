source("modelfunctions/func-lasso.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
Y=dados

nprev=132
alpha=1

## == passado == ##

adalasso1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="adalasso")
adalasso1p=lasso.rolling.window(Y,nprev,2,1,alpha,type="adalasso")
adalasso2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="adalasso")
adalasso2p=lasso.rolling.window(Y,nprev,2,2,alpha,type="adalasso")
adalasso3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="adalasso")
adalasso3p=lasso.rolling.window(Y,nprev,2,3,alpha,type="adalasso")
adalasso4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="adalasso")
adalasso4p=lasso.rolling.window(Y,nprev,2,4,alpha,type="adalasso")
adalasso5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="adalasso")
adalasso5p=lasso.rolling.window(Y,nprev,2,5,alpha,type="adalasso")
adalasso6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="adalasso")
adalasso6p=lasso.rolling.window(Y,nprev,2,6,alpha,type="adalasso")
adalasso7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="adalasso")
adalasso7p=lasso.rolling.window(Y,nprev,2,7,alpha,type="adalasso")
adalasso8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="adalasso")
adalasso8p=lasso.rolling.window(Y,nprev,2,8,alpha,type="adalasso")
adalasso9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="adalasso")
adalasso9p=lasso.rolling.window(Y,nprev,2,9,alpha,type="adalasso")
adalasso10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="adalasso")
adalasso10p=lasso.rolling.window(Y,nprev,2,10,alpha,type="adalasso")
adalasso11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="adalasso")
adalasso11p=lasso.rolling.window(Y,nprev,2,11,alpha,type="adalasso")
adalasso12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="adalasso")
adalasso12p=lasso.rolling.window(Y,nprev,2,12,alpha,type="adalasso")

# pols #
pols.adalasso1c=pols.rolling.window(Y,nprev,1,1,adalasso1c$coef)
pols.adalasso1p=pols.rolling.window(Y,nprev,2,1,adalasso1p$coef)
pols.adalasso2c=pols.rolling.window(Y,nprev,1,2,adalasso2c$coef)
pols.adalasso2p=pols.rolling.window(Y,nprev,2,2,adalasso2p$coef)
pols.adalasso3c=pols.rolling.window(Y,nprev,1,3,adalasso3c$coef)
pols.adalasso3p=pols.rolling.window(Y,nprev,2,3,adalasso3p$coef)
pols.adalasso4c=pols.rolling.window(Y,nprev,1,4,adalasso4c$coef)
pols.adalasso4p=pols.rolling.window(Y,nprev,2,4,adalasso4p$coef)
pols.adalasso5c=pols.rolling.window(Y,nprev,1,5,adalasso5c$coef)
pols.adalasso5p=pols.rolling.window(Y,nprev,2,5,adalasso5p$coef)
pols.adalasso6c=pols.rolling.window(Y,nprev,1,6,adalasso6c$coef)
pols.adalasso6p=pols.rolling.window(Y,nprev,2,6,adalasso6p$coef)
pols.adalasso7c=pols.rolling.window(Y,nprev,1,7,adalasso7c$coef)
pols.adalasso7p=pols.rolling.window(Y,nprev,2,7,adalasso7p$coef)
pols.adalasso8c=pols.rolling.window(Y,nprev,1,8,adalasso8c$coef)
pols.adalasso8p=pols.rolling.window(Y,nprev,2,8,adalasso8p$coef)
pols.adalasso9c=pols.rolling.window(Y,nprev,1,9,adalasso9c$coef)
pols.adalasso9p=pols.rolling.window(Y,nprev,2,9,adalasso9p$coef)
pols.adalasso10c=pols.rolling.window(Y,nprev,1,10,adalasso10c$coef)
pols.adalasso10p=pols.rolling.window(Y,nprev,2,10,adalasso10p$coef)
pols.adalasso11c=pols.rolling.window(Y,nprev,1,11,adalasso11c$coef)
pols.adalasso11p=pols.rolling.window(Y,nprev,2,11,adalasso11p$coef)
pols.adalasso12c=pols.rolling.window(Y,nprev,1,12,adalasso12c$coef)
pols.adalasso12p=pols.rolling.window(Y,nprev,2,12,adalasso12p$coef)


### == juntando tudo ==  ###

cpi=cbind(adalasso1c$pred,adalasso2c$pred,adalasso3c$pred,adalasso4c$pred,
          adalasso5c$pred,adalasso6c$pred,adalasso7c$pred,adalasso8c$pred,
          adalasso9c$pred,adalasso10c$pred,adalasso11c$pred,adalasso12c$pred)

pce=cbind(adalasso1p$pred,adalasso2p$pred,adalasso3p$pred,adalasso4p$pred,
          adalasso5p$pred,adalasso6p$pred,adalasso7p$pred,adalasso8p$pred,
          adalasso9p$pred,adalasso10p$pred,adalasso11p$pred,adalasso12p$pred)


pols.cpi=cbind(pols.adalasso1c$pred,pols.adalasso2c$pred,pols.adalasso3c$pred,pols.adalasso4c$pred,
          pols.adalasso5c$pred,pols.adalasso6c$pred,pols.adalasso7c$pred,pols.adalasso8c$pred,
          pols.adalasso9c$pred,pols.adalasso10c$pred,pols.adalasso11c$pred,pols.adalasso12c$pred)

pols.pce=cbind(pols.adalasso1p$pred,pols.adalasso2p$pred,pols.adalasso3p$pred,pols.adalasso4p$pred,
          pols.adalasso5p$pred,pols.adalasso6p$pred,pols.adalasso7p$pred,pols.adalasso8p$pred,
          pols.adalasso9p$pred,pols.adalasso10p$pred,pols.adalasso11p$pred,pols.adalasso12p$pred)



##
write.table(cpi,"forecasts/passado2000/adalasso-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/adalasso-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

write.table(pols.cpi,"forecasts/passado2000/pols-adalasso-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pols.pce,"forecasts/passado2000/pols-adalasso-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
