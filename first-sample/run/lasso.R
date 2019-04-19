source("modelfunctions/func-lasso.R")
library(HDeconometrics)
load("dados/rawdata2000.rda")
Y=dados

nprev=132
alpha=1

## == passado == ##

lasso1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="lasso")
lasso1p=lasso.rolling.window(Y,nprev,2,1,alpha,type="lasso")
lasso2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="lasso")
lasso2p=lasso.rolling.window(Y,nprev,2,2,alpha,type="lasso")
lasso3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="lasso")
lasso3p=lasso.rolling.window(Y,nprev,2,3,alpha,type="lasso")
lasso4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="lasso")
lasso4p=lasso.rolling.window(Y,nprev,2,4,alpha,type="lasso")
lasso5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="lasso")
lasso5p=lasso.rolling.window(Y,nprev,2,5,alpha,type="lasso")
lasso6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="lasso")
lasso6p=lasso.rolling.window(Y,nprev,2,6,alpha,type="lasso")
lasso7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="lasso")
lasso7p=lasso.rolling.window(Y,nprev,2,7,alpha,type="lasso")
lasso8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="lasso")
lasso8p=lasso.rolling.window(Y,nprev,2,8,alpha,type="lasso")
lasso9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="lasso")
lasso9p=lasso.rolling.window(Y,nprev,2,9,alpha,type="lasso")
lasso10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="lasso")
lasso10p=lasso.rolling.window(Y,nprev,2,10,alpha,type="lasso")
lasso11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="lasso")
lasso11p=lasso.rolling.window(Y,nprev,2,11,alpha,type="lasso")
lasso12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="lasso")
lasso12p=lasso.rolling.window(Y,nprev,2,12,alpha,type="lasso")

# pols #
pols.lasso1c=pols.rolling.window(Y,nprev,1,1,lasso1c$coef)
pols.lasso1p=pols.rolling.window(Y,nprev,2,1,lasso1p$coef)
pols.lasso2c=pols.rolling.window(Y,nprev,1,2,lasso2c$coef)
pols.lasso2p=pols.rolling.window(Y,nprev,2,2,lasso2p$coef)
pols.lasso3c=pols.rolling.window(Y,nprev,1,3,lasso3c$coef)
pols.lasso3p=pols.rolling.window(Y,nprev,2,3,lasso3p$coef)
pols.lasso4c=pols.rolling.window(Y,nprev,1,4,lasso4c$coef)
pols.lasso4p=pols.rolling.window(Y,nprev,2,4,lasso4p$coef)
pols.lasso5c=pols.rolling.window(Y,nprev,1,5,lasso5c$coef)
pols.lasso5p=pols.rolling.window(Y,nprev,2,5,lasso5p$coef)
pols.lasso6c=pols.rolling.window(Y,nprev,1,6,lasso6c$coef)
pols.lasso6p=pols.rolling.window(Y,nprev,2,6,lasso6p$coef)
pols.lasso7c=pols.rolling.window(Y,nprev,1,7,lasso7c$coef)
pols.lasso7p=pols.rolling.window(Y,nprev,2,7,lasso7p$coef)
pols.lasso8c=pols.rolling.window(Y,nprev,1,8,lasso8c$coef)
pols.lasso8p=pols.rolling.window(Y,nprev,2,8,lasso8p$coef)
pols.lasso9c=pols.rolling.window(Y,nprev,1,9,lasso9c$coef)
pols.lasso9p=pols.rolling.window(Y,nprev,2,9,lasso9p$coef)
pols.lasso10c=pols.rolling.window(Y,nprev,1,10,lasso10c$coef)
pols.lasso10p=pols.rolling.window(Y,nprev,2,10,lasso10p$coef)
pols.lasso11c=pols.rolling.window(Y,nprev,1,11,lasso11c$coef)
pols.lasso11p=pols.rolling.window(Y,nprev,2,11,lasso11p$coef)
pols.lasso12c=pols.rolling.window(Y,nprev,1,12,lasso12c$coef)
pols.lasso12p=pols.rolling.window(Y,nprev,2,12,lasso12p$coef)


### == juntando tudo ==  ###

cpi=cbind(lasso1c$pred,lasso2c$pred,lasso3c$pred,lasso4c$pred,
          lasso5c$pred,lasso6c$pred,lasso7c$pred,lasso8c$pred,
          lasso9c$pred,lasso10c$pred,lasso11c$pred,lasso12c$pred)

pce=cbind(lasso1p$pred,lasso2p$pred,lasso3p$pred,lasso4p$pred,
          lasso5p$pred,lasso6p$pred,lasso7p$pred,lasso8p$pred,
          lasso9p$pred,lasso10p$pred,lasso11p$pred,lasso12p$pred)


pols.cpi=cbind(pols.lasso1c$pred,pols.lasso2c$pred,pols.lasso3c$pred,pols.lasso4c$pred,
               pols.lasso5c$pred,pols.lasso6c$pred,pols.lasso7c$pred,pols.lasso8c$pred,
               pols.lasso9c$pred,pols.lasso10c$pred,pols.lasso11c$pred,pols.lasso12c$pred)

pols.pce=cbind(pols.lasso1p$pred,pols.lasso2p$pred,pols.lasso3p$pred,pols.lasso4p$pred,
               pols.lasso5p$pred,pols.lasso6p$pred,pols.lasso7p$pred,pols.lasso8p$pred,
               pols.lasso9p$pred,pols.lasso10p$pred,pols.lasso11p$pred,pols.lasso12p$pred)



##
write.table(cpi,"forecasts/passado2000/lasso-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/lasso-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

write.table(pols.cpi,"forecasts/passado2000/pols-lasso-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pols.pce,"forecasts/passado2000/pols-lasso-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)
