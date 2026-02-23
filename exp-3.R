three_d_array <- array(
  1:24,
  dim = c(3, 4, 2),
  dimnames = list(
    c("Row1", "Row2", "Row3"),           # Row names
    c("Col1", "Col2", "Col3", "Col4"),   # Column names
    c("Table1", "Table2")                 # Table names
  )
)
cat("3D ARRAY (3 Rows, 4 Columns, 2 Tables)\n")
cat("======================================\n\n")
cat("TABLE 1:\n")
print(three_d_array[,,1])
cat("\nTABLE 2:\n")
print(three_d_array[,,2])
cat("\nARRAY INFORMATION:\n")
cat("Dimensions:", dim(three_d_array), "(Rows, Columns, Tables)\n")
cat("Total elements:", length(three_d_array), "\n")
cat("Class:", class(three_d_array), "\n")
cat("\nFull array structure:\n")
print(three_d_array)
