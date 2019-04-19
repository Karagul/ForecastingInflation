source("modelfunctions/func-scad.R")
library(HDeconometrics)
load("dados/rawdata2000.rda")
Y=dados

nprev=132


## == presente == ##

scad1c=scad.rolling.window(Y,nprev,1,1)
scad1p=scad.rolling.window(Y,nprev,2,1)
scad2c=scad.rolling.window(Y,nprev,1,2)
scad2p=scad.rolling.window(Y,nprev,2,2)
scad3c=scad.rolling.window(Y,nprev,1,3)
scad3p=scad.rolling.window(Y,nprev,2,3)
scad4c=scad.rolling.window(Y,nprev,1,4)
scad4p=scad.rolling.window(Y,nprev,2,4)
scad5c=scad.rolling.window(Y,nprev,1,5)
scad5p=scad.rolling.window(Y,nprev,2,5)
scad6c=scad.rolling.window(Y,nprev,1,6)
scad6p=scad.rolling.window(Y,nprev,2,6)
scad7c=scad.rolling.window(Y,nprev,1,7)
scad7p=scad.rolling.window(Y,nprev,2,7)
scad8c=scad.rolling.window(Y,nprev,1,8)
scad8p=scad.rolling.window(Y,nprev,2,8)
scad9c=scad.rolling.window(Y,nprev,1,9)
scad9p=scad.rolling.window(Y,nprev,2,9)
scad10c=scad.rolling.window(Y,nprev,1,10)
scad10p=scad.rolling.window(Y,nprev,2,10)
scad11c=scad.rolling.window(Y,nprev,1,11)
scad11p=scad.rolling.window(Y,nprev,2,11)
scad12c=scad.rolling.window(Y,nprev,1,12)
scad12p=scad.rolling.window(Y,nprev,2,12)


### == juntando tudo ==  ###

cpi=cbind(scad1c$pred,scad2c$pred,scad3c$pred,scad4c$pred,
          scad5c$pred,scad6c$pred,scad7c$pred,scad8c$pred,
          scad9c$pred,scad10c$pred,scad11c$pred,scad12c$pred)

pce=cbind(scad1p$pred,scad2p$pred,scad3p$pred,scad4p$pred,
          scad5p$pred,scad6p$pred,scad7p$pred,scad8p$pred,
          scad9p$pred,scad10p$pred,scad11p$pred,scad12p$pred)


##
write.table(cpi,"forecasts/passado2000/scad-cpi.csv",sep=";",row.names = FALSE, col.names = FALSE)
write.table(pce,"forecasts/passado2000/scad-pce.csv",sep=";",row.names = FALSE, col.names = FALSE)

