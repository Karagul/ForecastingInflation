
runscad=function(Y,indice,lag,alpha=1){
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
  
  model=ic.ncvreg(X,y,penalty = "SCAD")
  coef=model$coef
  
  pred=predict(model,X.out)
  
  return(list("model"=model,"pred"=pred))
}


scad.rolling.window=function(Y,nprev,indice=1,lag=1){
  
  save.coef=matrix(NA,nprev,21+ncol(Y[,-1])*4)
  save.pred=matrix(NA,nprev,1)
  for(i in nprev:1){
    Y.window=Y[(1+nprev-i):(nrow(Y)-i),]
    lasso=runscad(Y.window,indice,lag)
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



ic.ncvreg = function (x, y, crit=c("bic","aic","aicc","hqc"),...)
{
  if (is.matrix(x) == FALSE) {
    x = as.matrix(x)
  }
  if (is.vector(y) == FALSE) {
    y = as.vector(y)
  }
  crit=match.arg(crit)
  n=length(y)
  model = ncvreg(X = x, y = y, ...)
  coef = coef(model)
  lambda = model$lambda
  df = apply(coef,2,function(x)length(which(x!=0)))-1
  
  yhat=cbind(1,x)%*%coef
  residuals = (y- yhat)
  mse = colMeans(residuals^2)
  sse = colSums(residuals^2)
  
  nvar = df + 1
  bic = n*log(mse)+nvar*log(n)
  aic = n*log(mse)+2*nvar
  aicc = aic+(2*nvar*(nvar+1))/(n-nvar-1)
  hqc = n*log(mse)+2*nvar*log(log(n))
  
  sst = (n-1)*var(y)
  r2 = 1 - (sse/sst)
  adjr2 = (1 - (1 - r2) * (n - 1)/(nrow(x) - nvar - 1))
  
  crit=switch(crit,bic=bic,aic=aic,aicc=aicc,hqc=hqc)
  
  selected=best.model = which(crit == min(crit))[1]
  
  ic=c(bic=bic[selected],aic=aic[selected],aicc=aicc[selected],hqc=hqc[selected])
  
  result=list(coefficients=coef[,selected],ic=ic,lambda = lambda[selected], nvar=nvar[selected],
              glmnet=model,residuals=residuals[,selected],fitted.values=yhat[,selected],ic.range=crit, call = match.call())
  
  class(result)="ic.glmnet"
  return(result)
}
