vector1 <- c(10, 20, 30, 40, 50, 60, 70, 80)
vector2 <- c(2, 4, 6, 8, 10, 12, 14, 16)
array1 <- array(
  vector1,
  dim = c(2, 2, 2),
  dimnames = list(
    c("Row_A", "Row_B"),
    c("Col_X", "Col_Y"),
    c("Table_1", "Table_2")
  )
)
array2 <- array(
  vector2,
  dim = c(2, 4),
  dimnames = list(
    c("Row_1", "Row_2"),
    c("Col_A", "Col_B", "Col_C", "Col_D")
  )
)
cat("ARRAY 1 (2×2×2):\n")
print(array1)

cat("\nARRAY 2 (2×4):\n")
print(array2)

# Print specific elements
cat("\nSPECIFIC ELEMENTS:\n")
cat("===================\n")

# Elements from array1
cat("\nFrom Array1:\n")
cat("- Element at Row_A, Col_X, Table_1:", array1["Row_A", "Col_X", "Table_1"], "\n")
cat("- Element at Row_B, Col_Y, Table_2:", array1["Row_B", "Col_Y", "Table_2"], "\n")
cat("- Entire first table:\n")
print(array1[,,1])

# Elements from array2
cat("\nFrom Array2:\n")
cat("- Element at Row_1, Col_C:", array2["Row_1", "Col_C"], "\n")
cat("- Element at Row_2, Col_A:", array2["Row_2", "Col_A"], "\n")
cat("- First row only:", array2["Row_1",], "\n")
cat("- Second column only:\n")
print(array2[,"Col_B"])

# Access by index position
cat("\nACCESS BY INDEX:\n")
cat("================\n")
cat("Array1[1,2,1]:", array1[1,2,1], "(Row1, Col2, Table1)\n")
cat("Array2[2,3]:", array2[2,3], "(Row2, Col3)\n")