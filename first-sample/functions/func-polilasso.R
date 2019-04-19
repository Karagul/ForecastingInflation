runlasso=function(Y,indice,lag,alpha=1,type="lasso"){
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
  
  v = 1
  z = ncol(X)/4
  comb1 = matrix(NA,nrow(X),(z^2)*4)
  comb1out = rep(NA,(z^2)*4)
  for(u in 1:4){
    comb0 = X[,(u*126-125):(u*126)]
    comb0out = X.out[(u*126-125):(u*126)]
    for(i in 1:ncol(comb0)){
      for(j in 1:ncol(comb0)){
        comb1[,v] = comb0[,i]*comb0[,j]
        comb1out[v] = comb0out[i]*comb0out[j]
        v = v+1
      }
    }
  }
  
  
  
  model=ic.glmnet(comb1,y,alpha = alpha)
  coef=model$coef
  if(type=="adalasso"){
    penalty=(abs(coef[-1])+1/sqrt(length(y)))^(-1)
    model=ic.glmnet(comb1,y,penalty.factor = penalty,alpha=alpha)
  }
  
  pred=predict(model,comb1out)
  
  return(list("model"=model,"pred"=pred))
}


lasso.rolling.window=function(Y,nprev,indice=1,lag=1,alpha=1,type="lasso"){
  
  save.coef=matrix(NA,nprev,1+(20+ncol(Y[,-1])*4)*126)
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    lasso=runlasso(Y.window,indice,lag,alpha,type)
    save.coef[(1+nprev-i),]=lasso$model$coef
    save.pred[(1+nprev-i),]=lasso$pred
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

