xNum <- c(1, 3, 5, 7)
xLog <- c(TRUE, T, F, T)
xChar <- c("a","b","c","d")
df <-data.frame(xNum, xLog, xChar)
df
str(df)
df$Name <- c("Kim","Park","Tom","Joe")
df
df<- transform(df, Age=c(10,20,30,40))
df
