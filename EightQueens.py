

def displayBoard(mat, n):
    print ("\n")
    for i in range(0,n):
        for j in range(0,n):
	    if mat[i][j] == 1:
		print " Q " ,
	    else :
		print " - " ,
        print("\n")
    

def isSafe(mat,n,row,col):
    #check LHS of this row
    i =0
    while i <=col:
        if mat[row][i] == 1:
            return False
        i+=1

    #check upper diagonal
    i =row
    j = col
    while i>=0 and j >=0:
        if mat[i][j] == 1:
            return False
        i-=1
        j-=1

    #check lower diagonal
    i= row
    j = col
    while i < n and j >=0:
        if mat[i][j] == 1:
            return False
        i+=1
        j-=1

    #otherwise
    return True

def solve(mat,n, col):
    if col >= n: #base case to stop recursion
        return True;

        
    for i in range(0,n): #consider col and try placing the queen in all rows
        if isSafe(mat,n, i, col):
            mat[i][col] = 1 #place the queen at mat[i][col]
                
            if solve(mat, n, col+1) == True: #recur to place rest of the queens
                return True
                    
            mat[i][col] = 0 #backtrack
            
        
    #queen cannot be placed in any row corresponding to this col
    return False;
    
 
def main(n):
    mat=[ [0 for i in range(n)] for j in range(n)]
    if solve(mat, n, 0) == False:
        print("SOLUTION DOESNT EXIST")
    else:
        displayBoard(mat,n)
  

if __name__ == "__main__":
    main(8)

