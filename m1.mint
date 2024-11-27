:R $%$ ;   

:A " 0 < ( -1 * /E ) ;   

:N % % > ( ' /E $ ' ) ; 

:M 0 i!  
  m (  
    i i * 1 + 2 * 55 - 0 N a!  
    i 1 - 2 * 55 + 0 N b!  
    15 * 35 * 45 - a A a!  
    a 15 * 35 * 45 + 45 - A b!  
    a b & c!  
    45 - A c! ) ;

:Q % % 20 * + a! a 0 > ( x /E . ) /N ;  
	
:P 20 ( /i p! 20 ( /j q! M i + p R q - c! c Q ) /N ) ;

P

//////////////////

:R  
  $ % $ ;  // ROT function: Rotates the top three values on the stack. 
           // This is necessary to rearrange values efficiently for later operations.

:A  
  " 0 < ( -1 * /E ) ;  // Absolute value function: Ensures all values are positive. 
                       // This is required because negative values affect Mandelbrot calculations.

:N  
  % % > ( ' /E $ ' ) ;  // Max function: Selects the larger of two values. 
                        // Used to keep calculations stable by preventing overflow.

:M  
  0 i!  // Initialize the iteration counter to 0 for each Mandelbrot point.
  m (  
    i i * 1 + 2 * 55 - 0 N a!  // Calculate a value based on the iteration count and store it in 'a'. 
                               // This simulates the real part of the complex number in the Mandelbrot set.

    i 1 - 2 * 55 + 0 N b!  // Calculate b value based on the iteration count and store it in 'b'. 
                           // This represents the imaginary part of the complex number.

    15 * 35 * 45 - a A a!  // Adjust 'a' using scaling factors and apply absolute value. 
                           // Scaling ensures the values fit within display limits.

    a 15 * 35 * 45 + 45 - A b!  // Adjust 'b' similarly to ensure stability in calculations.

    a b & c!  // Perform bitwise AND on 'a' and 'b' and store in 'c'. 
              // This operation helps detect if the point remains stable (within the Mandelbrot set).

    45 - A c!  // Calculate abs(45 - c) to determine how far the point is from diverging.
               // This value is later used to decide what character to print.
  ) ;  

:Q  
  % % 20 * + a!  // Map the (i, j) 2D coordinates to a 1D index. 
                 // This helps in storing and accessing the grid points efficiently.

  a 0 > ( x /E . )  // If the value at 'a' is positive, print 'x' to mark divergence.
                    // If not, print '.' indicating the point is stable.

  /N ;  // Print a new line after plotting each row to format the grid properly.

:P  
  20 (  // Outer loop to iterate over the 20 rows of the grid.
    /i p!  // Store the current row index in 'p'.
    20 (  // Inner loop to iterate over the 20 columns.
      /j q!  // Store the current column index in 'q'.

      M  // Call the Mandelbrot iteration function to compute the value for (i, j).

      i + p R q - c!  // Use ROT and arithmetic operations to manipulate the coordinates
                      // and compute the value to be stored in 'c'.

      c Q  // Plot the value for the current (i, j) point.
    )  
    /N  // Print a new line after completing each row.
  ) ;

/////////////////////////
