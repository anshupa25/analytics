(grades = sample(c('A','B','C','D'), size=30, replace=T, prob=c(.4,.3,.2,.1)))
summary(grades)
(gradesF=factor(grades))
summary(gradesF)
table(grades)
table(gradesF)
class(gradesF)
(gradesF0=factor(grades,ordered=T))
(gradesF01=factor(grades,ordered=T,level=c('B','C','A','D')))
summary(gradesF01)


(marks= ceiling(rnorm(30,mean=60,sd=5)))
(student1=data.frame(marks,gradesF01))
boxplot(marks~gradesF01,data=student1)

boxplot(gradesF01~marks,data=student1)
quantile(marks)
