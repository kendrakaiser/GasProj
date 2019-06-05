#analyze and create figures for N2O paper

setwd("~/Documents/GitRepos/GasProj/")

data<- read.csv("Data/GHG_data.csv")
rounds<- read.csv("Data/SamplingRounds.csv")#, stringsAsFactors=FALSE)

#------------ Clean Data -------------------------------
data$r.date = as.character(data$date) 
data$r.date = as.Date(data$date,format = "%m/%d/%y" )
rounds$r.start = as.Date(rounds$start,format = "%m/%d/%y")
rounds$r.end = as.Date(rounds$end,format = "%m/%d/%y" )

data$N2O_fluxNug=data$N2O_fluxmg*1000*((14.007*2)/((14.007*2)+15.99))

#subset to 2013
data13 <- data[ which(data$year==2013), ]
#create a column that uses the rounds.csv to classify measurements by sampling round
for (i in 1:559){
  for(j in 1:14){
    if (data13$r.date[i]>=rounds$r.start[j] & data13$r.date[i]<=rounds$r.end[j]) 
      data13$smplrnd[i]<-rounds$Round[j]
    if(data13$r.date[i]<rounds$r.start[1])
      data13$smplrnd[i]<-0
  }}
# use subset function remove sites without trace gases
subdata <- subset(data13, code < 7)
subdata <-subset(subdata, !is.na(N2O_fluxNug))

uplands<-subset(subdata, category == 'upland')
riparian<-subset(subdata, category == 'riparian')
transition<-subset(subdata, category == 'transition')


par(mfrow=c(3,1))
boxplot(N2O_fluxNug~smplrnd,data=uplands, main="Uplands",
        xlab="Sampling Round", ylab="N2O Flux ug m2/hr", names=rounds$r.start)
  abline(h=0)
boxplot(N2O_fluxNug~smplrnd,data=transition, main="Transition",
        xlab="Sampling Round", ylab="N2O Flux ug m2/hr", names=rounds$r.start)
  abline(h=0)
boxplot(N2O_fluxNug~smplrnd,data=riparian, main="Riparian",
        xlab="Sampling Round", ylab="N2O Flux ug m2/hr", names=rounds$r.start)
  abline(h=0)

