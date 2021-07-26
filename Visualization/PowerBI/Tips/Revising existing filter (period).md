## Revising existing filter (period)

- If you are trying to select filter, and still keep the record of period **t-n**:

> Pre-requisite
>
> - Given that there is a date table `A` , a copy of it `AA` should be created with inactive relationship
>
> - For the purpose of data in period **t-n**, field should be applied from table `AA`

> DAX formula
>
> - Full formula
>
> 	 ```dax
> 	Sales 10-week = 
> 	var ReferenceDate = max(A[Date])
> 	var previousDate = 
> 	    DATESINPERIOD(
> 	        AA[Date],
>     	      ReferenceDate,
>             	  -70,
> 	         DAY
>     	  )
> 	
> 	var result = 
>     	calculate(
>     	      [Sales],
>             	  REMOVEFILTERS(A),
>                 	KEEPFILTERS(previousDate),
>                 	USERELATIONSHIP(A[Date], AA[Date])
>         	)
> 	
> 	return result
> 	```
> 	
> - Logic:
>
>    ```dax
>    var ReferenceDate = max(A[Date])
>    
>    // Retrieve selected slicer value ('Calendar'[Date]) and assign variable
>    ```
>
>    ```dax
>    var previousDate = 
>        DATESINPERIOD(
>            AA[Date],
>      	      ReferenceDate,
>          	  -70,
>             DAY
>      	  )
>      	  
>    // Create new filter from the reference table AA, for 10 weeks (-70 days)
>    ```
>
>    ```dax
>    var result = 
>    	calculate(
>      	      [Sales],
>          	  REMOVEFILTERS(A),
>            	KEEPFILTERS(previousDate),
>            	USERELATIONSHIP(A[Date], AA[Date])
>        	)
>    
>    // Calculate, removing filters from A, and applying new filter from AA, using inactive relationship
>    ```

