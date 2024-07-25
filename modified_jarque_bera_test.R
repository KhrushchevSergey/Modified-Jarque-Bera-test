modified.jarque.bera.test <- function (x, mean = NA, sd = NA) 
{
  if ((NCOL(x) > 1) || is.data.frame(x)) 
    stop("x is not a vector or univariate time series")
  if (any(is.na(x))) 
    stop("NAs in x")
  DNAME <- deparse(substitute(x))
  n <- length(x)
  
  if (is.na(mean) & is.na(sd)) {
    m1 <- sum(x) / n
    m2 <- sum((x - m1) ^ 2) / n
    m3 <- sum((x - m1) ^ 3) / n
    m4 <- sum((x - m1) ^ 4) / n
    b1 <- (m3 / m2 ^ (3 / 2)) ^ 2
    b2 <- (m4 / m2 ^ 2)
    STATISTIC <- n * (b1 / 6 + (b2 - 3) ^ 2 / 24)
  }
  
  if (!is.na(mean) & is.na(sd)){
    m1 <- mean
    m2 <- sum((x - m1)^2)/n
    m3 <- sum((x - m1)^3)/n
    m4 <- sum((x - m1)^4)/n
    b1 <- (m3/m2^(3/2))^2
    b2 <- (m4/m2^2)
    STATISTIC <- n * (b1/15 + (b2 - 3)^2/24)
  }
  
  if (is.na(mean) & !is.na(sd)){
    m1 <- mean(x)
    m2 <- sd^2
    m3 <- sum((x - m1)^3)/n
    m4 <- sum((x - m1)^4)/n
    b1 <- (m3/m2^(3/2))^2
    b2 <- (m4/m2^2)
    STATISTIC <- n * (b1/6 + (b2 - 3)^2/96)
  }
  
  if (!is.na(mean) & !is.na(sd)){
    m1 <- mean
    m2 <- sd^2
    m3 <- sum((x - m1)^3)/n
    m4 <- sum((x - m1)^4)/n
    b1 <- (m3/m2^(3/2))^2
    b2 <- (m4/m2^2)
    STATISTIC <- n * (b1/15 + (b2 - 3)^2/96)
  }

  PVAL <- 1 - pchisq(STATISTIC, df = 2)
  PARAMETER <- 2
  METHOD <- "Modified Jarque Bera Test"
  names(STATISTIC) <- "X-squared"
  names(PARAMETER) <- "df"
  structure(list(statistic = STATISTIC, parameter = PARAMETER, 
                 p.value = PVAL, method = METHOD, data.name = DNAME), 
            class = "htest")
}