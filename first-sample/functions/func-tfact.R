
run.tfact=function(Y,indice,lag){
  
  y=Y[,indice]
  X=Y[,-indice]
  mat=cbind(embed(y,5),tail(X,nrow(X)-4))
  
  pretest=baggit(mat,pre.testing="individual",fixed.controls = 1:4)[-c(1:5)]
  pretest[pretest!=0]=1
  aux=rep(0,ncol(Y))
  aux[indice]=1
  aux[-indice]=pretest
  selected=which(pretest==1)
  
  Y2=Y[,selected]
  
  fmodel=runfact(Y2,indice,lag=lag)
  
  coef=fmodel$coef
  pred=fmodel$pred
  
  return(list("coef"=coef,"pred"=pred))
}


tfact.rolling.window=function(Y,nprev,indice=1,lag=1){
  
  save.coef=matrix(NA,nprev,21)
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    fact=run.tfact(Y.window,indice,lag)
    save.coef[(1+nprev-i),]=fact$coef
    save.pred[(1+nprev-i),]=fact$pred
    cat("iteration",(1+nprev-i),"\n")
  }
  
  real=Y[,indice]
  plot(real,type="l")
  lines(c(rep(NA,length(real)-nprev),save.pred),col="red")
  
  rmse=sqrt(mean((tail(real,nprev)-save.pred)^2))
  mae=mean(abs(tail(real,nprev)-save.pred))
  errors=c("rmse"=rmse,"mae"=mae)
  
  return(list("pred"=save.pred,"coef"=save.coef,"errors"=errors))
}

