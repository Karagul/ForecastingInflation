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
alpha=0

## == passado == ##

ridge1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="lasso")
ridge2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="lasso")
ridge3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="lasso")
ridge4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="lasso")
ridge5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="lasso")
ridge6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="lasso")
ridge7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="lasso")
ridge8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="lasso")
ridge9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="lasso")
ridge10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="lasso")
ridge11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="lasso")
ridge12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="lasso")

### == juntando tudo ==  ###

corem=cbind(ridge1c$pred,ridge2c$pred,ridge3c$pred,ridge4c$pred,
          ridge5c$pred,ridge6c$pred,ridge7c$pred,ridge8c$pred,
          ridge9c$pred,ridge10c$pred,ridge11c$pred,ridge12c$pred)
corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],132)

sqrt(colMeans((corem-tail(core$core,132))^2))

##
write.table(corem,"forecasts/passado2000/ridge-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)
