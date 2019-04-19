source("modelfunctions/functionsD/func-lasso.R")
library(HDeconometrics)
load("dados/rawdata.RData")
Y=dados
dum=rep(0,nrow(Y))
dum[which.min(Y[,1])]=1
Y=cbind(Y,dum=dum)

nprev=180
alpha=1

## == presente == ##

fal1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="fal")
fal1p=lasso.rolling.window(Y,nprev,2,1,alpha,type="fal")
fal2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="fal")
fal2p=lasso.rolling.window(Y,nprev,2,2,alpha,type="fal")
fal3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="fal")
fal3p=lasso.rolling.window(Y,nprev,2,3,alpha,type="fal")
fal4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="fal")
fal4p=lasso.rolling.window(Y,nprev,2,4,alpha,type="fal")
fal5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="fal")
fal5p=lasso.rolling.window(Y,nprev,2,5,alpha,type="fal")
fal6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="fal")
fal6p=lasso.rolling.window(Y,nprev,2,6,alpha,type="fal")
fal7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="fal")
fal7p=lasso.rolling.window(Y,nprev,2,7,alpha,type="fal")
fal8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="fal")
fal8p=lasso.rolling.window(Y,nprev,2,8,alpha,type="fal")
fal9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="fal")
fal9p=lasso.rolling.window(Y,nprev,2,9,alpha,type="fal")
fal10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="fal")
fal10p=lasso.rolling.window(Y,nprev,2,10,alpha,type="fal")
fal11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="fal")
fal11p=lasso.rolling.window(Y,nprev,2,11,alpha,type="fal")
fal12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="fal")
fal12p=lasso.rolling.window(Y,nprev,2,12,alpha,type="fal")

# pols #
pols.fal1c=pols.rolling.window(Y,nprev,1,1,fal1c$coef)
pols.fal1p=pols.rolling.window(Y,nprev,2,1,fal1p$coef)
pols.fal2c=pols.rolling.window(Y,nprev,1,2,fal2c$coef)
pols.fal2p=pols.rolling.window(Y,nprev,2,2,fal2p$coef)
pols.fal3c=pols.rolling.window(Y,nprev,1,3,fal3c$coef)
pols.fal3p=pols.rolling.window(Y,nprev,2,3,fal3p$coef)
pols.fal4c=pols.rolling.window(Y,nprev,1,4,fal4c$coef)
pols.fal4p=pols.rolling.window(Y,nprev,2,4,fal4p$coef)
pols.fal5c=pols.rolling.window(Y,nprev,1,5,fal5c$coef)
pols.fal5p=pols.rolling.window(Y,nprev,2,5,fal5p$coef)
pols.fal6c=pols.rolling.window(Y,nprev,1,6,fal6c$coef)
pols.fal6p=pols.rolling.window(Y,nprev,2,6,fal6p$coef)
pols.fal7c=pols.rolling.window(Y,nprev,1,7,fal7c$coef)
pols.fal7p=pols.rolling.window(Y,nprev,2,7,fal7p$coef)
pols.fal8c=pols.rolling.window(Y,nprev,1,8,fal8c$coef)
pols.fal8p=pols.rolling.window(Y,nprev,2,8,fal8p$coef)
pols.fal9c=pols.rolling.window(Y,nprev,1,9,fal9c$coef)
pols.fal9p=pols.rolling.window(Y,nprev,2,9,fal9p$coef)
pols.fal10c=pols.rolling.window(Y,nprev,1,10,fal10c$coef)
pols.fal10p=pols.rolling.window(Y,nprev,2,10,fal10p$coef)
pols.fal11c=pols.rolling.window(Y,nprev,1,11,fal11c$coef)
pols.fal11p=pols.rolling.window(Y,nprev,2,11,fal11p$coef)
pols.fal12c=pols.rolling.window(Y,nprev,1,12,fal12c$coef)
pols.fal12p=pols.rolling.window(Y,nprev,2,12,fal12p$coef)


### == juntando tudo ==  ###

cpi=cbind(fal1c$pred,fal2c$pred,fal3c$pred,fal4c$pred,
          fal5c$pred,fal6c$pred,fal7c$pred,fal8c$pred,
          fal9c$pred,fal10c$pred,fal11c$pred,fal12c$pred)

pce=cbind(fal1p$pred,fal2p$pred,fal3p$pred,fal4p$pred,
          fal5p$pred,fal6p$pred,fal7p$pred,fal8p$pred,
          fal9p$pred,fal10p$pred,fal11p$pred,fal12p$pred)

pols.cpi=cbind(pols.fal1c,pols.fal2c,pols.fal3c,pols.fal4c,
               pols.fal5c,pols.fal6c,pols.fal7c,pols.fal8c,
               pols.fal9c,pols.fal10c,pols.fal11c,pols.fal12c)

pols.pce=cbind(pols.fal1p,pols.fal2p,pols.fal3p,pols.fal4p,
               pols.fal5p,pols.fal6p,pols.fal7p,pols.fal8p,
               pols.fal9p,pols.fal10p,pols.fal11p,pols.fal12p)


##
write.table(cpi,"forecasts/presenteD/fal-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/presenteD/fal-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

write.table(pols.cpi,"forecasts/presenteD/pols-fal-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pols.pce,"forecasts/presenteD/pols-fal-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

save.image("~/Dropbox/tese/inflacao jbes/workspaces/presenteD/fadalasso.RData")