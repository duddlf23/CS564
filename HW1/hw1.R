#1
x=c(1,2,3,4,5,2,4,3,5,1,2,3,4,5,1,2)
y=c("Red","Green","Blue","Magenta") 
y[x]
# it will be replaced with NA

#2 
A = matrix(c(1,2,3,0,1,4,5,2,4), nrow = 3, byrow = TRUE)
B = matrix(c(2,3,0,-1,2,5,3,9,2), nrow = 3, byrow = TRUE)
A
B
C = A %*% B
C

#3

#(1)
class(state.x77)
D = data.frame(state.x77)
class(D)

#(2)
sum(D$Income < 4000)

#(3)
rownames(D)[which.max(D$Income)]

