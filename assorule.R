getwd()
data<-read.csv("UniversalBank.csv")
str(data)
data<-data[,c(10:14)]
str(data)


#Converting the product to NA

data[data==0]=NA

# convert to factor

for (i in 1:ncol(data)) {
  data[,i]=as.factor(data[,i])
}

str(data)
View(data)


# Convert into transaction object
datatrans<-as(data,"transactions")
inspect(head(datatrans,6))

#Creating association rules
args(apriori)
rules<-apriori(datatrans,parameter = list(supp=0.01,conf=0.7,target="rules"))
inspect(head(rules,10))

# changing the rules to dataframe.
dfrules=as(rules,"data.frame")
View(dfrules)

#including Age, Experience ,Mortgage

data<-read.csv("UniversalBank.csv")
names(data)
data<-data[,c(2,3,9:14)]
View(data)
summary(data)


#Converting Mortgage to categorical
data$Mortgage<-ifelse(data$Mortgage==0,0,1)

#Binning for Age and Experience

#Age- using dicretize

data$Age2<-discretize(data$Age,method="frequency",breaks=4)

#Experience

data$Experience2<-discretize(data$Experience,method="frequency",breaks=5)

data[data==0]=NA

# convert to factor

for (i in 1:ncol(data)) {
  data[,i]=as.factor(data[,i])
}

str(data)
View(data)


# Convert into transaction object
datatrans<-as(data,"transactions")
inspect(head(datatrans,6))

#Creating association rules
args(apriori)
rules<-apriori(datatrans,parameter = list(supp=0.01,conf=0.7,target="rules"))
inspect(head(rules,10))

# changing the rules to dataframe.
dfrules=as(rules,"data.frame")
View(dfrules)
