#!/bin/bash

# Prompt the user for the first number
echo -n "Enter first number: "
read num1

# Prompt the user for the second number
echo -n "Enter second number: "
read num2

# Perform addition
addition=$(echo "$num1 + $num2" | bc)

# Perform subtraction
subtraction=$(echo "$num1 - $num2" | bc)

# Perform multiplication
multiplication=$(echo "$num1 * $num2" | bc)

# Perform division, but check for division by zero first
if [ "$num2" == "0" ]; then
    division="Error: Cannot divide by zero"
else
    division=$(echo "scale=2; $num1 / $num2" | bc)
fi

# Display all results
echo ""
echo "Results:"
echo "$num1 + $num2 = $addition"
echo "$num1 - $num2 = $subtraction"
echo "$num1 x $num2 = $multiplication"
echo "$num1 / $num2 = $division"
