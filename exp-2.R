matrix_5x4_row <- matrix(1:20, nrow = 5, ncol = 4, byrow = TRUE,
                         dimnames = list(
                           c("Row1", "Row2", "Row3", "Row4", "Row5"),
                           c("Col1", "Col2", "Col3", "Col4")
                         ))
cat("5×4 Matrix (Filled by Row):\n")
print(matrix_5x4_row)
cat("\n")
matrix_3x3_col <- matrix(1:9, nrow = 3, ncol = 3, byrow = FALSE,
                         dimnames = list(
                           c("A", "B", "C"),
                           c("X", "Y", "Z")
                         ))
cat("3×3 Matrix (Filled by Column):\n")
print(matrix_3x3_col)
cat("\n")
matrix_2x2_row <- matrix(c(10, 20, 30, 40), nrow = 2, ncol = 2, byrow = TRUE,
                         dimnames = list(
                           c("First", "Second"),
                           c("Left", "Right")
                         ))
cat("2×2 Matrix (Filled by Row):\n")
print(matrix_2x2_row)