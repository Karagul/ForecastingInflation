source("modelfunctions/func-bag.R")
library(HDeconometrics)
load("dados/rawdata2000.rda")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
core=core[1:nrow(dados),]
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))
nprev=132



## == passado == ##

bagg1c=bagg.rolling.window(Y,nprev,1,1)
bagg2c=bagg.rolling.window(Y,nprev,1,2)
bagg3c=bagg.rolling.window(Y,nprev,1,3)
bagg4c=bagg.rolling.window(Y,nprev,1,4)
bagg5c=bagg.rolling.window(Y,nprev,1,5)
bagg6c=bagg.rolling.window(Y,nprev,1,6)
bagg7c=bagg.rolling.window(Y,nprev,1,7)
bagg8c=bagg.rolling.window(Y,nprev,1,8)
bagg9c=bagg.rolling.window(Y,nprev,1,9)
bagg10c=bagg.rolling.window(Y,nprev,1,10)
bagg11c=bagg.rolling.window(Y,nprev,1,11)
bagg12c=bagg.rolling.window(Y,nprev,1,12)


### == juntando tudo ==  ###

corem=cbind(bagg1c$pred,bagg2c$pred,bagg3c$pred,bagg4c$pred,
          bagg5c$pred,bagg6c$pred,bagg7c$pred,bagg8c$pred,
          bagg9c$pred,bagg10c$pred,bagg11c$pred,bagg12c$pred)
corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],132)

sqrt(colMeans((corem-tail(core$core,132))^2))

##
write.table(corem,"forecasts/passado2000/bagg-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)

