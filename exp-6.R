# Create vectors
numeric_vec <- c(10, 20, 30, 40, 50)
char_vec <- c("apple", "banana", "cherry", "date")
logical_vec <- c(TRUE, FALSE, TRUE, TRUE)

# Create matrices
matrix_3x3 <- matrix(1:9, nrow = 3, ncol = 3, 
                     dimnames = list(c("R1", "R2", "R3"), c("C1", "C2", "C3")))
matrix_2x2 <- matrix(c(5, 10, 15, 20), nrow = 2, ncol = 2)

# Create functions
add_numbers <- function(x, y) {
  return(x + y)
}

multiply_numbers <- function(x, y) {
  return(x * y)
}

# Create list containing all elements
my_list <- list(
  "Vectors" = list(
    "Numeric" = numeric_vec,
    "Character" = char_vec,
    "Logical" = logical_vec
  ),
  "Matrices" = list(
    "3x3 Matrix" = matrix_3x3,
    "2x2 Matrix" = matrix_2x2
  ),
  "Functions" = list(
    "Addition" = add_numbers,
    "Multiplication" = multiply_numbers
  ),
  "Mixed" = c("This list contains", 100, TRUE, "multiple data types")
)

# Display list contents
cat("COMPLETE LIST STRUCTURE:\n")
cat("=======================\n\n")

# Display using str() for overview
cat("LIST OVERVIEW:\n")
str(my_list)

cat("\n\nDETAILED CONTENTS:\n")
cat("==================\n\n")

# Display each component in detail
cat("1. VECTORS SECTION:\n")
cat("-------------------\n")
cat("Numeric Vector:", my_list$Vectors$Numeric, "\n")
cat("Character Vector:", my_list$Vectors$Character, "\n")
cat("Logical Vector:", my_list$Vectors$Logical, "\n\n")

cat("2. MATRICES SECTION:\n")
cat("--------------------\n")
cat("3x3 Matrix:\n")
print(my_list$Matrices$`3x3 Matrix`)
cat("\n2x2 Matrix:\n")
print(my_list$Matrices$`2x2 Matrix`)

cat("\n\n3. FUNCTIONS SECTION:\n")
cat("----------------------\n")
cat("Addition Function:", "\n")
print(my_list$Functions$Addition)
cat("\nMultiplication Function:", "\n")
print(my_list$Functions$Multiplication)

cat("\n\n4. MIXED SECTION:\n")
cat("-----------------\n")
cat("Mixed content:", my_list$Mixed, "\n")
cat("Class of mixed content:", class(my_list$Mixed), "\n")

cat("\n\nLIST INFORMATION:\n")
cat("=================\n")
cat("Length of list:", length(my_list), "\n")
cat("Names of top-level elements:", names(my_list), "\n")
cat("Class of list:", class(my_list), "\n")

# Access elements in different ways
cat("\n\nACCESSING ELEMENTS:\n")
cat("===================\n")
cat("Using $ notation - First vector:", my_list$Vectors$Numeric[1], "\n")
cat("Using [[]] notation - 3x3 matrix:\n")
print(my_list[["Matrices"]][["3x3 Matrix"]])
cat("Using [] notation - First two elements:\n")
print(names(my_list[1:2]))

# Demonstrate function usage from list
cat("\n\nUSING FUNCTIONS FROM LIST:\n")
cat("==========================\n")
cat("Add 15 and 25:", my_list$Functions$Addition(15, 25), "\n")
cat("Multiply 8 and 7:", my_list$Functions$Multiplication(8, 7), "\n")
