
import java.util.Scanner;
class Search
{

	static int counter, num, item, array[], first, last, middle;
	static Scanner input = new Scanner(System.in);

	public void input(){
 	   
  	  System.out.println("Enter number of elements:");
        num = input.nextInt(); 
        array = new int[num];
        System.out.println("Enter " + num + " integers");
        for (counter = 0; counter < num; counter++)
        array[counter] = input.nextInt(); 
        System.out.println("Enter the search value:");
        
       item = input.nextInt();
       first = 0;
       last = num - 1;
       middle = (first + last)/2;        
    }
    
    public void bsearch(){
    	
    	  while( first <= last )
          {
             if ( array[middle] < item )
               first = middle + 1;
             else if ( array[middle] == item )
             {
               System.out.println(item + " found at location " + (middle + 1) + ".");
               break;
             }
             else
             {
                 last = middle - 1;
             }
             middle = (first + last)/2;
          }
          if ( first > last )
              System.out.println(item + " is not found.\n");
}

	public static void main(String args[]){
	
		Search sobj=new Search();
		sobj.input();
		sobj.bsearch();
	}
}

/*
OUTPUT:

Enter number of elements:
5
Enter 5 integers
6
5
4
7
3
Enter the search value:
7
7 found at location 4.
*/