# PROGRAM 1: Factors of a number
cat("PROGRAM 1: FACTORS OF A NUMBER\n")
cat("==============================\n")

# Function to find factors
find_factors <- function(n) {
  factors <- c()
  for(i in 1:n) {
    if(n %% i == 0) {
      factors <- c(factors, i)
    }
  }
  return(factors)
}

# Test with different numbers
num1 <- 36
num2 <- 48

cat("Factors of", num1, ":", find_factors(num1), "\n")
cat("Factors of", num2, ":", find_factors(num2), "\n\n")

# PROGRAM 2: Generate vector of 10 random integers between -50 and 50
cat("PROGRAM 2: RANDOM INTEGERS VECTOR\n")
cat("=================================\n")

set.seed(123)  # for reproducibility
random_vector <- sample(-50:50, 10, replace = FALSE)
cat("10 random integers between -50 and 50:\n")
cat(random_vector, "\n")
cat("Minimum:", min(random_vector), "\n")
cat("Maximum:", max(random_vector), "\n")
cat("Mean:", mean(random_vector), "\n")
cat("Sum:", sum(random_vector), "\n\n")

# PROGRAM 3: Print numbers 1-100 with FizzBuzz logic
cat("PROGRAM 3: FIZZBUZZ (1 to 100)\n")
cat("==============================\n")

fizzbuzz <- function(n) {
  if(n %% 3 == 0 && n %% 5 == 0) {
    return("FizzBuzz")
  } else if(n %% 3 == 0) {
    return("Fizz")
  } else if(n %% 5 == 0) {
    return("Buzz")
  } else {
    return(n)
  }
}

# Print FizzBuzz for numbers 1 to 100
for(i in 1:100) {
  result <- fizzbuzz(i)
  cat(result)
  
  # Add comma for better formatting, new line every 10 numbers
  if(i < 100) cat(", ")
  if(i %% 10 == 0) cat("\n")
}

# Alternative: Store results in a vector
cat("\n\nAs a vector (first 20 elements):\n")
fizzbuzz_vector <- sapply(1:100, fizzbuzz)
print(fizzbuzz_vector[1:20])
cat("...\n")

# Count Fizz, Buzz, FizzBuzz occurrences
cat("\nFIZZBUZZ STATISTICS:\n")
cat("Fizz occurrences:", sum(fizzbuzz_vector == "Fizz"), "\n")
cat("Buzz occurrences:", sum(fizzbuzz_vector == "Buzz"), "\n")
cat("FizzBuzz occurrences:", sum(fizzbuzz_vector == "FizzBuzz"), "\n")
cat("Numbers:", sum(sapply(fizzbuzz_vector, is.numeric)), "\n")
