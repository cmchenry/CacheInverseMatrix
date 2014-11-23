## The following functions provide a way to cache a square, invertible
## matrix "a" and compute and cache it's inverse "b".

## This function will cache matrix "a" with the "set" function and return the cache with the "get"
## function.  Additionally, the inverse matrix "b" can be calculated with the "setinverse" 
## function and the cached value can be accessed with "getinverse".
makeCacheMatrix <- function(a = matrix()) {
  b <- NULL
  set <- function(ain) {
    a <<- ain
    b <<- NULL
  }
  get <- function() a
  setinverse <- function(bin) b <<- bin
  getinverse <- function() b
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## This function returns the inverse of a square, invertible matrix.
## If the inputMatrix has already been inverted, the function simply
## returns the cached matrix "b", otherwise, the inverted matrix is
## computed, cached in the inputMatrix function and returned.
cacheSolve <- function(inputMatrix, ...) {
  ## Return a matrix that is the inverse of 'a'
  inverseMatrix <- inputMatrix$getinverse()
  if(!is.null(inverseMatrix)) {
    message("Getting cached inverse matrix:")
    return(inverseMatrix)
  }
  tmpInputMatrix <- inputMatrix$get()
  inverseMatrix <- solve(tmpInputMatrix)
  inputMatrix$setinverse(inverseMatrix)
  inverseMatrix
}
