## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    ## matrix caching function
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) m <<- inverse
    getInverse <- function() m
    
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


cacheSolve <- function(x) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse() 
    ## Check if inverse in cache
    if(!is.null(m)) {
        message("getting cache data")
        return(m)
    }
    data <- x$get()  
    m <- solve(data) 
    x$setInverse(m)  
    m                
}
