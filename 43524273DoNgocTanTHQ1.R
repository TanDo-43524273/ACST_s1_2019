# Question 1: Bond pricing with continuous compounding
# Input: C as the coupon payment every 6 months until majurity
# Input: F as face value of the bond at maturity
# Input: y as the vector of discount interest rates for each period from the present until the time the coupon payment is made expressed in decimals such that
# the length of y corresponds to the number of coupon payments until maturity
# create the pricing function 

bond_prc=function(C,F,y,n=length(y)){
  cf=c(rep(C,n-1),C+F) # the cash flows vector
  cf=data.frame(cf)
  cf$n=as.numeric(rownames(cf)) # number of cash flows
  cf$pv_factor=1/exp(y*cf$n) # discount factors
  cf$pv=cf$cf*cf$pv_factor # discounted cash flows
  sum(cf$pv)
}

# Question 3
# 3a. The data file is saved under: ....\S1 2019\ACST890 Data Analytics for Finance and Insurance\Assessments\THQ1.
# The working directory of R is direcetd to this folder so that R knows where to search for the data
setwd("D:/Study/Master of Acturial Practice Macquarie University/S1 2019/ACST890 Data Analytics for Finance and Insurance/Assessments/THQ1")
dataset=read.csv("singapore.economy.csv") # Read the dataset into R and name it dataset

# 3b. Exlude all rows which contain missing observations -> apply to the entire table.
dataset=na.omit(dataset)

# 3c. Plot Singapore GDP againts time
attach(dataset)
png('Q3c_GDPtimeseies.png',width=1170,height=778) # save the plot as an image in the directory for assigment writing
plot(time,gdp,type="b",main="Singapore GDP Growth",xlab="Time",ylab="GDP (%)",col="red")
dev.off()

# 3d. Create a stat.table that contains mean and std of gdp by period
stat.table=data.frame(tapply(gdp,period,mean),tapply(gdp,period,sd))
colnames(stat.table)=c("Mean_GDP", "Std_GDP")

# 3e. Scatter plot for every pair of the variables, except for time and period
png('Q3e_CorrMatrix.png',width=1170,height=778) # save the plot as an image in the directory for assigment writing
lmfit <- function(x, y, ...) {
  points(x,y, ...)
  abline(lm(y~x))
  }# made to draw regression line instead of lowess line
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...) {
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r <- cor(x, y)
    txt <- format(c(r, 0.123456789), digits = digits)[1]
    txt <- paste0(prefix, txt)
    text(0.5, 0.5, txt, cex = 1.5, font = 10)
    }
pairs(dataset[!names(dataset) %in% c("time","period")], upper.panel=panel.cor,cex=1.5,pch=19,col=adjustcolor(4, .4),
      cex.labels = 2, font.labels = 2, lower.panel = lmfit)
dev.off()

# 3f. Regress dgp on exp
slm.fit=lm(gdp~exp) # fit a linear regression model with gdp as the response and exp as the predictor
summary(slm.fit) # print the model output in detail

# 3g. Regress dgp on exp, epg, hpr, oil, gdpus, crd
mlm.fit=lm(gdp~exp+epg+hpr+oil+gdpus+crd) # fit a linear regression model with gdp as the response and other 6 variables as the predictors
summary(mlm.fit) # print the model output in detail

# 3h. Logistic regression model
state=rep("Normal",nrow(dataset)) # Economy state classification: Crisis as gdp < 5% quantile, Normal otherwise
state[gdp<quantile(gdp,probs=0.05)]="Crisis"
state=as.factor(state)
dataset=data.frame(dataset,state)
lgm.fit=glm(state~bci,family=binomial,subset=time<2008) # fit a logistic regression model to state on bci with training dataset, obs upto 2007
summary(lgm.fit)
# Compute the confusion matrix using training dataset
lgm.probs.training=predict(lgm.fit,dataset[time<2008,],type="response")
lgm.pred.training=rep("Crisis",nrow(dataset[time<2008,])) # dummy variable with 1 for Normal state
lgm.pred.training[lgm.probs.training>.5]="Normal"
table(lgm.pred.training,state[time<2008])
mean(lgm.pred.training==state[time<2008])

# Compute the confusion matrix using test dataset
lgm.probs.test=predict(lgm.fit,dataset[!(time<2008),],type="response")
lgm.pred.test=rep("Crisis",nrow(dataset[!(time<2008),])) # dummy variable with 1 for Normal state
lgm.pred.test[lgm.probs.test>.5]="Normal"
table(lgm.pred.test,state[!(time<2008)])
mean(lgm.pred.test==state[!(time<2008)])

# End of the script
