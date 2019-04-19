
runcsr=function(Y,indice,lag){
  
  dum=Y[,ncol(Y)]
  Y=Y[,-ncol(Y)]
  
  comp=princomp(scale(Y,scale=FALSE))
  Y2=cbind(Y,comp$scores[,1:4])
  aux=embed(Y2,4+lag)
  y=aux[,indice]
  X=aux[,-c(1:(ncol(Y2)*lag))]  
  
  f.seq=seq(indice,ncol(X),ncol(Y2))
  
  if(lag==1){
    X.out=tail(aux,1)[1:ncol(X)]  
  }else{
    X.out=aux[,-c(1:(ncol(Y2)*(lag-1)))]
    X.out=tail(X.out,1)[1:ncol(X)]
  }
  
  dum=tail(dum,length(y))
  
  X2=cbind(X,dum)
  
  
  model=csr(y,X2,fixed.controls =c(f.seq,ncol(X2)))
  pred=predict.HDeconometrics(model,c(X.out,0))
  
  return(list("model"=model,"pred"=pred))
}


csr.rolling.window=function(Y,nprev,indice=1,lag=1){
  
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    cs=runcsr(Y.window,indice,lag)
    save.pred[(1+nprev-i),]=cs$pred
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
