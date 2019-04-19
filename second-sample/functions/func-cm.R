runcm=function(Y,indice,lag){
  
  aux=embed(Y[,indice],4+lag)
  X=aux[,-c(1:lag)]
  y=X[,1]
  
  pred=mean(tail(y,5))
  
  return("pred"=pred)
}


cm.rolling.window=function(Y,nprev,indice=1,lag=1){
  
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    lasso=runcm(Y.window,indice,lag)
    save.pred[(1+nprev-i),]=lasso
    cat("iteration",(1+nprev-i),"\n")
  }
  
  real=Y[,indice]
  plot(real,type="l")
  lines(c(rep(NA,length(real)-nprev),save.pred),col="red")
  
  rmse=sqrt(mean((tail(real,nprev)-save.pred)^2))
  mae=mean(abs(tail(real,nprev)-save.pred))
  errors=c("rmse"=rmse,"mae"=mae)
  
  return(list("pred"=save.pred,"errors"=errors))
}

