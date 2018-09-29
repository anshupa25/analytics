# Data structuresin R

#Vectors----
x=1:10   #create seq of nos from 1 to 10
x
x1 <- 1:20
x1
(x1=1:10)
(x2=c(1,2,3,4,5))
class(x2)
(x3=letters[1:10])
letters[1:26]
(x3b=c('a',"Anshu","4"))
class(x3b)
(x4=c(T,FALSE,TRUE,T,F))
class(x4)
x5=c(3L,5L)
class(x5)
?c
(x5b=c(1, 'a',T, 4L))
class(x5b)
#access elements----
(x6 = seq(0,100,by=3))
?seq
x6[20]    #access 20th element
x6[3]
methods(class='numeric')
x6[c(2,4)]     #access 2nd and 4th element
length(x6)
x6[2,4]
x6[-1]
x6[-3]        #access all except 3rd element
x6
x6[c(2,-4)]   #error: can't mix positive and negativw subscripts
x6[c(2.4,3.54)]   #real numbers are tructaed to integers
x6[-c(1,5,20)]
x6[-length(x6)-1]
x6[-(length(x6)-1)]
x7=c(x6,x2)
x7
#modify
sort(x7)
rev(x7)
sort(x6,decreasing = T)
?T
seq(-3,10, by=.2)
(x=-3:2)
x[2] <- 0;     #modify 2nd element
x
x[x<0]=5;      #modify elements less than 0
x
x<0
x<1            #it checks whether the numbers are less than 1 or not and prints true and flase accordingly
x=x[1:4];
x
#delete vector
(x=seq(1,5,length.out=10))   #diving the range into 10 equal parts
x = NULL
x[4]

x=rnorm(100)      #wth mean of 0 and SD of 1
x
(v1=rnorm(1000,mean=50,sd=5))
plot(density(v1))
abline(v=mean(v1),h=0.04)
#Matrices----
1:12
(m1=matrix(1:12,nrow=4))
(m2=matrix(1:12,ncol=3,byrow=T))
x=101:124
x
length(x)
matrix(x,ncol=6)
class(m1)
attributes(m1)   #dimensions
dim(m1)

#access elements of matrix
m1[1,2:3]
m1[c(1,3),]     #access 1st and 3rd row and all the colums
paste("C","D",sep="-")
paste("C",1:100,sep="/")

(colnames(m1) = paste('C',1:3,sep=''))
m1
(rownames(m1) = paste('R',1:4,sep=''))
m1
#Vector to Matrix
(m3=1:24)
dim(m3) = c(6,4)
m3

m2[c(TRUE,F,F,F),c(2,3)]
m2[m2>5]

m1;m2
m1[1:2,1:2]
m1[c('R1'),]
m1[1:2,]
m1[c(T,T,F,F),]
m2
m2[2,2]=10
m2
(m2[m2>10]=99)
m2
rbind(m2,c(50,60,70))
colSums(m1); rowSums(m1);
colMeans(m1); rowMeans(m1);

t(m1)
m1
sweep(m1, MARGIN = 1,STATS=c(2,3,4,5),FUN="+")  #rowwise
sweep(m1, MARGIN = 2,STATS=c(2,3,4),FUN="*")    #colwise
#addmargins
m1
addmargins(m1,margin=1,sum)
addmargins(m1,1,sd)         # 1 signifies colwise function
addmargins(m1,2,mean)
addmargins(m1,c(1,2),mean)
addmargins(m1,c(1,2),list(list(mean,sum,max), list(var,sd))) #different fuctions row and col wise
#Arrays----
length(100:123)
4*3*2
#2 coys, 3 products, 4 locations sold qty
(a1 = array(100:123, dim=c(4,3,2)))
(loc = paste('loc', 1:4,sep='-'))
(product = paste('p', 1:3,sep='@'))
(coy = paste('coy', 1:2,sep='%'))
dimnames(a1) = list(loc, product, coy)
a1
apply(a1,1, sum) #locationwise
apply(a1,2, sum) #productwise
apply(a1,c(1,2), sum) #product-location wise
apply(a1,c(2,3), sum) #product-coy wise
apply(a1,c(1,3), sum) #coy-location
apply(a1,3, sum) #coywise
sum(a1) #total

#Data Frame----
#create vectors to be combines into DF
(rollno =1:30)
(sname=paste('student',1:30,sep=''))
(gender=sample(c('M','F'),size=30,replace=T,prob=c(.7,.3)))
(marks = floor(rnorm(30,mean= 50,sd=10)))
(marks2 = ceiling(rnorm(30,40,5)))
(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
rollno; sname; gender
marks ; marks2; course

#create DF
df1= data.frame(rollno, sname, gender, marks, marks2, course, stringsAsFactors = F)
str(df1) #structure of DF
head(df1) #top 6 rows
head(df1,n=3) #top 3 rows
tail(df1) #last 6 rows
class(df1) # DF
summary(df1) #summary
df1$gender = factor(df1$gender)  #gender converted to factor
df1$course = factor(df1$course)
str(df1)
summary(df1)

df1  #full data
df1$gender  # one column
df1[ , c(2,4)] #multiple columns
df1[1:10 ,] #select rows, all columns
#as per conditionis
df1[ marks > 50 & gender=='F', c('rollno', 'sname','gender', 'marks')]
df1[ marks > 50 & gender=='F', c(1,2)]
df1[ marks > 50 | gender=='F', ]

names(df1)  # names of columns
dim(df1)  #Dimensions

aggregate(df1$marks, by=list(df1$gender), FUN=max)
aggregate(marks ~ gender, data=df1, FUN=max)


(df2 = aggregate(cbind(marks,marks2) ~ gender + course, data=df1, FUN=mean))

#Lists----