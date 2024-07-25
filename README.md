# Modified Jarque-Bera Test Function

This repository contains an implementation of the modified Jarque-Bera test for normality.

## Example Usage

```r
# Load the function
source("modified_jarque_bera_test.R")

# Generate some sample data
set.seed(123)
x <- rnorm(1000)

# Perform the test
result <- modified.jarque.bera.test(x)
print(result)
