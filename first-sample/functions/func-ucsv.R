
ucsv=function(y,display=FALSE){
  
  T = length(y);
  nloop = 4000;
  burnin = 1000;
  ## prior
  Vtau = 0.12; Vh = 0.12;
  atau = 10; ltau = 0.04*9;
  ah = 10; lh = 0.03*9;
  ## initialize the Markov chain
  omega2tau = ltau/(atau-1);
  omega2h = lh/(ah-1);
  h = as.numeric(log(var(y)*.8)) * matrix(rep(1,T));
  ####<Making a sparse matrix>####
  Sp=diag(T);                    #
  d=matrix(rep(0,T),1);          #
  sparse=rbind(d,Sp);            #
  sparse<-sparse[-(T+1),]        #
  ################################
  H = diag(T) - sparse;
  ## initialize for storage
  store_omega2tau = matrix(rep(0,(nloop-burnin)),,1);
  store_omega2h = matrix(rep(0,(nloop-burnin)),,1);
  store_tau = matrix(rep(0,(nloop-burnin)*T),,T);
  store_h = matrix(rep(0,(nloop-burnin)*T),,T);
  ## compute a few things
  newatau = (T-1)/2 + atau;
  newah = (T-1)/2 + ah;
  for (loop in 1:nloop){
    ## sample tau
    invOmegatau = diag(T)*c(1/Vtau, 1/omega2tau*rep(1,T-1));
    invSigy = diag(T)*c(exp(-h));
    Ktau = t(H) %*% invOmegatau %*% H + invSigy;
    Ctau = t(chol(Ktau));
    tauhat = solve(Ktau,(invSigy %*% y));
    tau = tauhat + solve(t(Ctau), matrix(rnorm(T),,1));
    ## sample h
    ystar = log((y-tau)^2 + .0001 );  
    result = SVRW(ystar,h,omega2h,Vh);
    h = result[[1]];
    ## sample omega2tau
    newltau = ltau + sum((tau[2:nrow(tau)]-tau[1:(nrow(tau)-1)])^2)/2;
    omega2tau = 1/gamrand(newatau, newltau);
    ## sample omega2h
    newlh = lh + sum((h[2:nrow(h)]-h[1:(nrow(h)-1)])^2)/2;
    omega2h = 1/gamrand(newah, newlh);
    if (loop>burnin){
      i = loop-burnin;
      store_tau[i,] = t(tau);
      store_h[i,] = t(h);
      store_omega2tau[i,] = omega2tau;
      store_omega2h[i,] = omega2h; 
    }
  }
  tauhat = matrix(rowMeans(t(store_tau)));
  hhat = matrix(colMeans(store_h));
  
  
  if(display==TRUE){
    plot(y,type="l")
    lines(tauhat,col="blue")
  }
  
  return(list("tauhat"=tauhat,"hhat"=hhat,"store_tau"=store_tau,"store_h"=store_h))
}


ucsv.rw=function(Y,npred,h=1:3){
  
  z=npred+length(h)-1
  save.p=rep(NA,z)
  for(i in z:1){
    m=ucsv(Y[(z-i+1):(length(Y)-i)],FALSE)
    save.p[z-i+1]=tail(m$tauhat,1)
    cat(z-i+1,"\n")
  }
  
  pr=matrix(NA,npred,length(h))
  for(i in 1:length(h)){
    pr[,i]=tail(save.p,npred)
    save.p=save.p[-length(save.p)]
  }
  return(pr)
}

# SVRW.r
SVRW<-function(ystar,h,omega2h,Vh){
  T = length(h);
  ## parameters for the Gaussian mixture
  pi = c(0.0073, .10556, .00002, .04395, .34001, .24566, .2575);
  mui = c(-10.12999, -3.97281, -8.56686, 2.77786, .61942, 1.79518,-1.08819) - 1.2704; 
  sig2i = c(5.79596, 2.61369, 5.17950, .16735, .64009, .34023, 1.26261);
  sigi = sqrt(sig2i);
  ## sample S from a 7-point distrete distribution
  temprand = matrix(runif(T));
  q = matrix(rep(pi,each=T),T) * dnorm(matrix(rep(ystar,each=7),byrow=TRUE,,7),matrix(rep(h,each=7),byrow=TRUE,,7)
                                       +matrix(rep(mui,each=T),T),matrix(rep(sigi,each=T),T));
  q = q/matrix(rep(rowSums(q),each=7),byrow=TRUE,,7);
  S = matrix(7 - rowSums(matrix(rep(temprand,each=7),byrow=TRUE,,7)<t(apply(q,1,cumsum)))+1);
  ## sample h
  ####<Making a sparse matrix>####
  Sp=diag(T);                    #
  d=matrix(rep(0,T),1);          #
  sparse=rbind(d,Sp);            #
  sparse<-sparse[-(T+1),]        #
  ################################
  H = diag(T) - sparse;
  invOmegah = diag(T)*c(1/Vh, 1/omega2h*rep(1,T-1));
  d = matrix(mui[S]); invSigystar = diag(T)*c(1/sig2i[S]);
  Kh = t(H) %*% invOmegah %*% H + invSigystar;
  Ch = t(chol(Kh));
  hhat = solve(Kh,(invSigystar %*% (ystar-d)));
  h = hhat + solve(t(Ch),matrix(rnorm(T)));
  result = list(h,S);
  return (result)
}

gamrand<-function(alpha,lambda){
  if (alpha>1)
  {
    d=alpha-1/3;
    c=1/sqrt(9*d); 
    flag=1;
    while (flag){
      Z=rnorm(1);
      if (Z>(-1/c)){
        V=(1+c*Z)^3;
        U=runif(1);
        flag=log(U)>(0.5*Z^2+d-d*V+d*log(V));  
      }
    }
    x=d*V/lambda;
  }
  else{
    x=gamrand(alpha+1,lambda);
    x=x*runif(1)^(1/alpha);
  }
};

