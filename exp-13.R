# For multiple arrays in a list
array_list <- list(
  matrix(1:6, nrow = 2, ncol = 3),
  matrix(7:12, nrow = 2, ncol = 3),
  matrix(13:18, nrow = 2, ncol = 3),
  matrix(19:24, nrow = 2, ncol = 3)
)

# Combine all arrays in the list
combined_reduce <- Reduce(rbind, array_list)
print("Combined using Reduce():")
print(combined_reduce)
