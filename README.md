# Modified Jarque-Bera Test Function

This repository contains an implementation of the modified Jarque-Bera test for normality, which allow for testing hypotheses that
the considered sample comes from: a normal distribution with known mean (variance unknown);
a normal distribution with known variance (mean unknown); a normal distribution with known
mean and variance.

## Example Usage

```r
# Load the function
source("modified_jarque_bera_test.R")

# Generate some sample data
set.seed(123)
x <- rnorm(1000)

# Perform the test
result <- modified.jarque.bera.test(x, mean = 0)
print(result)
