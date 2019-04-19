source("modelfunctions/func-lasso.R")
library(HDeconometrics)
load("dados/rawdata2000.rda")
core=openxlsx::read.xlsx("dados/core.xlsx")
core$core=c(NA,diff(log(core$CPILFENS)))
core=core%>%filter(DATE>="1960-02-01")
core=core[1:nrow(dados),]
a=core$core[-c(1:12)]-core$core[-c((length(core$core)-11):length(core$core))]
Y=cbind(core=a,tail(dados,length(a)))

nprev=132
alpha=1

## == passado == ##

adalasso1c=lasso.rolling.window(Y,nprev,1,1,alpha,type="adalasso")
adalasso2c=lasso.rolling.window(Y,nprev,1,2,alpha,type="adalasso")
adalasso3c=lasso.rolling.window(Y,nprev,1,3,alpha,type="adalasso")
adalasso4c=lasso.rolling.window(Y,nprev,1,4,alpha,type="adalasso")
adalasso5c=lasso.rolling.window(Y,nprev,1,5,alpha,type="adalasso")
adalasso6c=lasso.rolling.window(Y,nprev,1,6,alpha,type="adalasso")
adalasso7c=lasso.rolling.window(Y,nprev,1,7,alpha,type="adalasso")
adalasso8c=lasso.rolling.window(Y,nprev,1,8,alpha,type="adalasso")
adalasso9c=lasso.rolling.window(Y,nprev,1,9,alpha,type="adalasso")
adalasso10c=lasso.rolling.window(Y,nprev,1,10,alpha,type="adalasso")
adalasso11c=lasso.rolling.window(Y,nprev,1,11,alpha,type="adalasso")
adalasso12c=lasso.rolling.window(Y,nprev,1,12,alpha,type="adalasso")

# pols #

### == juntando tudo ==  ###

corem=cbind(adalasso1c$pred,adalasso2c$pred,adalasso3c$pred,adalasso4c$pred,
           adalasso5c$pred,adalasso6c$pred,adalasso7c$pred,adalasso8c$pred,
           adalasso9c$pred,adalasso10c$pred,adalasso11c$pred,adalasso12c$pred)

corem=corem+tail(core$core[-c((length(core$core)-11):length(core$core))],132)

sqrt(colMeans((corem-tail(core$core,132))^2))


##
write.table(corem,"forecasts/passado2000/adalasso-core1.csv",sep=";",row.names = FALSE, col.names = FALSE)
