# Create factor from women's heights dataset
data(women)
height_factor <- factor(women$height, 
                        levels = women$height,
                        labels = paste(women$height, "cm"))
cat("WOMEN'S HEIGHTS FACTOR:\n")
cat("=======================\n")
print(height_factor)
cat("\nClass:", class(height_factor), "\n")
cat("Levels:", levels(height_factor), "\n")
cat("Number of levels:", nlevels(height_factor), "\n\n")

# Create factor from random LETTERS sample
set.seed(123)  # for reproducibility
letters_sample <- sample(LETTERS[1:10], 20, replace = TRUE)
letters_factor <- factor(letters_sample, 
                         levels = LETTERS[1:10],
                         labels = paste("Letter", LETTERS[1:10]))

cat("RANDOM LETTERS FACTOR:\n")
cat("======================\n")
print(letters_factor)
cat("\nClass:", class(letters_factor), "\n")
cat("Levels:", levels(letters_factor), "\n")
cat("Number of levels:", nlevels(letters_factor), "\n\n")

# Manipulate factors
cat("FACTOR MANIPULATION:\n")
cat("====================\n")

# Frequency tables
cat("\nFrequency of each height:\n")
print(table(height_factor))

cat("\nFrequency of each letter:\n")
print(table(letters_factor))

# Subset factors
cat("\nFirst 5 heights:\n")
print(height_factor[1:5])

cat("\nLetters that are vowels (A, E, I):\n")
vowels <- letters_factor[letters_factor %in% c("Letter A", "Letter E", "Letter I")]
print(vowels[!is.na(vowels)])

# Convert to numeric
cat("\nConvert factor to numeric codes:\n")
cat("Height factor as numeric:", as.numeric(height_factor[1:5]), "\n")
cat("Letter factor as numeric:", as.numeric(letters_factor[1:5]), "\n")

# Add new level and modify
cat("\nAdding new level to letters factor:\n")
levels(letters_factor) <- c(levels(letters_factor), "Letter K")
cat("New levels:", paste(levels(letters_factor), collapse=", "), "\n")

# Combine factors
cat("\nCombine first 5 and last 5 of letters factor:\n")
combined <- factor(c(letters_factor[1:5], letters_factor[16:20]))
print(combined)

# Display structure
cat("\nFACTOR STRUCTURE:\n")
cat("=================\n")
str(height_factor)
str(letters_factor)
