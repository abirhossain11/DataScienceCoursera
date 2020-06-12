## Put comments here that give an overall description of what your
## functions do

#This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){ x <<- y 
  inv <<- NULL
  }
  get <- function(){x}
  setinv <- function(inverse){inv <<- inverse}
  getinv <- function(){inv}
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
       inv <- x$getinv()
       if(!is.null(inv)){
         message("getting cached data")
       return(inv)
}
data <- x$get()
inv <- inverse(data,...)
x$setinv(inv)
inv
}







