# clean workspace
rm(list=ls())

#===================
# Greenpeas example 01
# Install required package

if(!require(TeachingDemos)){
	install.packages("TeachingDemos")
	library(TeachingDemos)
}

# load data (single vector)
sample<-scan("../data files/greenpeas.txt")

# Mean of normal distribution, variance known
z.test(as.numeric(sample),
       mu=500,
       stdev=10)

# Mean of normal distribution, variance unknown, one-sided test
t.test(sample,
       alternative = "less",
       mu = 500,
       conf.level = 0.99)

# Mean of normal distribution, variance unknown, two-sided test
t.test(sample,
       mu = 500,
       conf.level = 0.99)

# Power analysis
s<-sd(sample)

# Power for the 10-observation sample
power.t.test(n=10, 
             delta=5, 
             sd=s, 
             sig.level=0.01, 
             type = "one.sample", 
             alternative = "one.sided")

# Minimal sample size for power = 0.85
power.t.test(power=0.85, 
             delta=5, 
             sd=s, 
             sig.level=0.01, 
             type = "one.sample", 
             alternative = "one.sided")


# Validation of the normality assumption
# QQ plot

# pdf("../figs/GraphNorm.pdf",
#     width=5,
#     height=5) # comment to open plot in R
library(car)
qqPlot(sample,
       pch=16,
       cex=1.5,
       las=1)

# dev.off() # comment this if you commented the pdf command.

# Shapiro-Wilk test of normality
shapiro.test(sample)

# Durbin-Watson test of independence (serial autocorrelations)
library(lmtest)
dwtest(sample~1)