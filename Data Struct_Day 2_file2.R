# data analysis using dplyr

install.packages(dplyr)
library(dplyr)
dplyr::filter(mtcars,mpg>25 & am==1)
filter(mtcars,mpg>25 & am==1)
?dplyr
mtcars %>% filter(mpg>25  & am==1) %>% arrange(wt)
mtcars %>% filter(mpg>25  & am==1) %>% arrange(wt) %>% summarise(n())
mtcars %>% filter(mpg>25  & am==1) %>% arrange(wt) %>% count()


mtcars %>% group_by(am) %>% summarise(mean(mpg))
mtcars %>% group_by(gear) %>% summarise(mean(wt))


filter(mtcars,cyl==8)
#mutate----
mutate(mtcars,displ_l=disp/61.0237)   #keeps other col
transmute(mtcars,displ_l=disp/61.0237)  #removes other cols
mutate(mtcars,cyl=NULL)        #removes cyl col


#slice-----
slice(mtcars, 1L)
slice(mtcars, n())
slice(mtcars, 5:n())
slice(mtcars, c(2,4,5,10))

(by_cyl <- group_by(mtcars, cyl)) # ???
slice(by_cyl, 1:2)

#structure----
tbl_df(mtcars) # convert to tbl class
glimpse(mtcars)  # dense summary of tbl data
View(mtcars) # spreasheet like form base pacakge
mtcars %>% group_by(am) 
#nothing - just separation

mtcars %>% group_by(am) %>% summarise(mean(mpg), max(wt))


#summarise----
summarise(mtcars, mean(disp))  
summarise(group_by(mtcars, cyl), mean(disp)) 
summarise(group_by(mtcars, cyl), m = mean(disp), sd = sd(disp))


#summarise_all
mtcars %>% group_by(am, gear) %>% summarise_all(mean)
mtcars %>% group_by(am, gear)%>% summarise_all(c("min", "max"))
mtcars %>% group_by(am, gear)%>% summarise_all(funs(med = median))


