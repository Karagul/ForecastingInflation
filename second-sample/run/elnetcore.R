source("modelfunctions/func-lasso.R")
library(HDeconometrics)
load("dados/rawdata.RData")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))


nprev=180
alpha=0.5

## == presente == ##

elasticnet1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="lasso")
elasticnet2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="lasso")
elasticnet3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="lasso")
elasticnet4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="lasso")
elasticnet5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="lasso")
elasticnet6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="lasso")
elasticnet7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="lasso")
elasticnet8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="lasso")
elasticnet9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="lasso")
elasticnet10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="lasso")
elasticnet11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="lasso")
elasticnet12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="lasso")


### == juntando tudo ==  ###

corem=cbind(elasticnet1c$pred,elasticnet2c$pred,elasticnet3c$pred,elasticnet4c$pred,
          elasticnet5c$pred,elasticnet6c$pred,elasticnet7c$pred,elasticnet8c$pred,
          elasticnet9c$pred,elasticnet10c$pred,elasticnet11c$pred,elasticnet12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],180)

sqrt(colMeans((corem-tail(core$core,180))^2))

##
write.table(corem,"forecasts/presenteD/elasticnet-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)
