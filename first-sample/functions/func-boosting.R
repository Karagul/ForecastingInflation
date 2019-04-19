
runboost=function(Y,indice,lag){
  comp=princomp(scale(Y,scale=FALSE))
  Y2=cbind(Y[,indice],comp$scores[,1:8])
  aux=embed(Y2,4+lag)
  y=aux[,1]
  X=aux[,-c(1:(ncol(Y2)*lag))]  
  
  if(lag==1){
    X.out=tail(aux,1)[1:ncol(X)]  
  }else{
    X.out=aux[,-c(1:(ncol(Y2)*(lag-1)))]
    X.out=tail(X.out,1)[1:ncol(X)]
  }
  
  
  model=boosting(y,X,v=0.2,display=FALSE)
  coef=model$coef
  
  pred=predict.HDeconometrics(model,X.out)
  
  return(list("model"=model,"pred"=pred))
}


boosting.rolling.window=function(Y,nprev,indice=1,lag=1){
  
  save.coef=matrix(NA,nprev,36)
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    bo=runboost(Y.window,indice,lag)
    save.coef[(1+nprev-i),]=bo$model$coef
    save.pred[(1+nprev-i),]=bo$pred
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
