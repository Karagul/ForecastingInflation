source("modelfunctions/func-lasso.R")
library(HDeconometricsBeta)
load("dados/rawdata2000.rda")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
core=core[1:nrow(dados),]
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))


nprev=132
alpha=0.5

## == passado == ##

adaelasticnet1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="adalasso")
adaelasticnet2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="adalasso")
adaelasticnet3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="adalasso")
adaelasticnet4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="adalasso")
adaelasticnet5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="adalasso")
adaelasticnet6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="adalasso")
adaelasticnet7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="adalasso")
adaelasticnet8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="adalasso")
adaelasticnet9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="adalasso")
adaelasticnet10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="adalasso")
adaelasticnet11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="adalasso")
adaelasticnet12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="adalasso")


### == juntando tudo ==  ###

corem=cbind(adaelasticnet1c$pred,adaelasticnet2c$pred,adaelasticnet3c$pred,adaelasticnet4c$pred,
           adaelasticnet5c$pred,adaelasticnet6c$pred,adaelasticnet7c$pred,adaelasticnet8c$pred,
           adaelasticnet9c$pred,adaelasticnet10c$pred,adaelasticnet11c$pred,adaelasticnet12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],132)

sqrt(colMeans((corem-tail(core$core,132))^2))


##
write.table(corem,"forecasts/passado2000/adaelasticnet-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)
