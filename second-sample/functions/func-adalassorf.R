runlasso=function(Y,indice,lag,alpha=1,type="lasso"){
  
  dum=Y[,ncol(Y)]
  Y=Y[,-ncol(Y)]
  comp=princomp(scale(Y,scale=FALSE))
  Y2=cbind(Y,comp$scores[,1:4])
  aux=embed(Y2,4+lag)
  y=aux[,indice]
  X=aux[,-c(1:(ncol(Y2)*lag))]  
  
  if(lag==1){
    X.out=tail(aux,1)[1:ncol(X)]  
  }else{
    X.out=aux[,-c(1:(ncol(Y2)*(lag-1)))]
    X.out=tail(X.out,1)[1:ncol(X)]
  }
  dum=tail(dum,length(y))
  if(type=="quant" || type=="quantadalasso"){
    model=model=bicqlasso(cbind(X,dum),y,alpha = alpha)
    coef=model$coef
    pred=c(1,X.out,0)%*%coef
    if(type=="quantadalasso"){
      penalty=(abs(coef[-1])+1/sqrt(length(y)))^(-1)
      model=bicqlasso(cbind(X,dum),y,penalty.factor = penalty,alpha=alpha)
      coef=model$coef
      pred=c(1,X.out,0)%*%coef
    }
    
    return(list("pred"=pred,"model"=list("coef"=coef)))
  }
  
  
  model=ic.glmnet(cbind(X,dum),y,alpha = alpha)
  coef=model$coef
  if(type=="adalasso"){
    penalty=(abs(coef[-1])+1/sqrt(length(y)))^(-1)
    model=ic.glmnet(cbind(X,dum),y,penalty.factor = penalty,alpha=alpha)
  }
  
  selected=which(model$coef[-1]!=0)
  modelrf=randomForest(cbind(X,dum)[,selected],y)
  pred=predict(modelrf,c(X.out,0)[selected])
  
  return(list("pred"=pred))
}
lasso.rolling.window=function(Y,nprev,indice=1,lag=1,alpha=1,type="lasso"){
  
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    lasso=runlasso(Y.window,indice,lag,alpha,type)
    save.pred[(1+nprev-i),]=lasso$pred
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
