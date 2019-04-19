source("modelfunctions/functionsD/func-cm.R")
load("dados/rawdata.RData")
Y=dados

nprev=180


## == presente == ##

cm1c=cm.rolling.window(Y,nprev,1,1)
cm1p=cm.rolling.window(Y,nprev,2,1)
cm2c=cm.rolling.window(Y,nprev,1,2)
cm2p=cm.rolling.window(Y,nprev,2,2)
cm3c=cm.rolling.window(Y,nprev,1,3)
cm3p=cm.rolling.window(Y,nprev,2,3)
cm4c=cm.rolling.window(Y,nprev,1,4)
cm4p=cm.rolling.window(Y,nprev,2,4)
cm5c=cm.rolling.window(Y,nprev,1,5)
cm5p=cm.rolling.window(Y,nprev,2,5)
cm6c=cm.rolling.window(Y,nprev,1,6)
cm6p=cm.rolling.window(Y,nprev,2,6)
cm7c=cm.rolling.window(Y,nprev,1,7)
cm7p=cm.rolling.window(Y,nprev,2,7)
cm8c=cm.rolling.window(Y,nprev,1,8)
cm8p=cm.rolling.window(Y,nprev,2,8)
cm9c=cm.rolling.window(Y,nprev,1,9)
cm9p=cm.rolling.window(Y,nprev,2,9)
cm10c=cm.rolling.window(Y,nprev,1,10)
cm10p=cm.rolling.window(Y,nprev,2,10)
cm11c=cm.rolling.window(Y,nprev,1,11)
cm11p=cm.rolling.window(Y,nprev,2,11)
cm12c=cm.rolling.window(Y,nprev,1,12)
cm12p=cm.rolling.window(Y,nprev,2,12)


### == juntando tudo ==  ###

cpi=cbind(cm1c$pred,cm2c$pred,cm3c$pred,cm4c$pred,
          cm5c$pred,cm6c$pred,cm7c$pred,cm8c$pred,
          cm9c$pred,cm10c$pred,cm11c$pred,cm12c$pred)

pce=cbind(cm1p$pred,cm2p$pred,cm3p$pred,cm4p$pred,
          cm5p$pred,cm6p$pred,cm7p$pred,cm8p$pred,
          cm9p$pred,cm10p$pred,cm11p$pred,cm12p$pred)


##
write.table(cpi,"forecasts/passado2000/cm-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/cm-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

