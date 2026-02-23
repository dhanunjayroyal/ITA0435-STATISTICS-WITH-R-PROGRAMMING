# Create the data frame exam_data
exam_data <- data.frame(
  name = c('Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'),
  score = c(12.5, 9, 16.5, 12, 9, 20, 14.5, 13.5, 8, 19),
  attempts = c(1, 3, 2, 3, 2, 3, 1, 1, 2, 1),
  qualify = c('yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes')
)

cat("ORIGINAL DATA FRAME:\n")
cat("===================\n")
print(exam_data)
cat("\nStructure:\n")
str(exam_data)
cat("\nSummary:\n")
summary(exam_data)

# 1. EXTRACT OPERATIONS
cat("\n\nEXTRACT OPERATIONS:\n")
cat("===================\n")

# Extract first 3 rows
cat("\na. First 3 rows:\n")
print(exam_data[1:3, ])

# Extract specific columns
cat("\nb. Name and Score columns:\n")
print(exam_data[, c("name", "score")])

# Extract rows where qualify is 'yes'
cat("\nc. Students who qualified:\n")
print(exam_data[exam_data$qualify == 'yes', ])

# Extract rows with score > 15
cat("\nd. Students with score > 15:\n")
print(exam_data[exam_data$score > 15, ])

# Extract specific cell (row 3, column 2)
cat("\ne. Value at row 3, column 2:", exam_data[3, 2], "\n")

# 2. ADD OPERATIONS
cat("\n\nADD OPERATIONS:\n")
cat("===============\n")

# Add a new row
new_student <- data.frame(name = 'Sarah', score = 17, attempts = 2, qualify = 'yes')
exam_data <- rbind(exam_data, new_student)
cat("\na. Added new student (Sarah):\n")
print(tail(exam_data, 1))

# Add a new column (grade based on score)
exam_data$grade <- ifelse(exam_data$score >= 15, 'A', 
                          ifelse(exam_data$score >= 10, 'B', 'C'))
cat("\nb. Added grade column:\n")
print(exam_data[, c("name", "score", "grade")])

# Add another new column (percentage)
exam_data$percentage <- (exam_data$score / 20) * 100
cat("\nc. Added percentage column:\n")
print(exam_data[, c("name", "score", "percentage")])

# 3. SORT OPERATIONS
cat("\n\nSORT OPERATIONS:\n")
cat("================\n")

# Sort by score (descending)
sorted_by_score <- exam_data[order(-exam_data$score), ]
cat("\na. Sorted by score (highest to lowest):\n")
print(sorted_by_score[, c("name", "score", "grade")])

# Sort by name (alphabetical)
sorted_by_name <- exam_data[order(exam_data$name), ]
cat("\nb. Sorted by name (A to Z):\n")
print(sorted_by_name[, c("name", "score", "grade")])

# Sort by qualify then score
sorted_by_qualify <- exam_data[order(exam_data$qualify, -exam_data$score), ]
cat("\nc. Sorted by qualify (yes first) then score:\n")
print(sorted_by_qualify[, c("name", "qualify", "score")])

# 4. SAVE TO FILE
cat("\n\nSAVE TO FILE OPERATIONS:\n")
cat("=======================\n")

# Save as CSV
write.csv(exam_data, "exam_data.csv", row.names = FALSE)
cat("a. Saved to 'exam_data.csv'\n")

# Save as TXT (space-separated)
write.table(exam_data, "exam_data.txt", row.names = FALSE, sep = "\t")
cat("b. Saved to 'exam_data.txt' (tab-separated)\n")

# Save as RDS (R native format)
saveRDS(exam_data, "exam_data.rds")
cat("c. Saved to 'exam_data.rds' (RDS format)\n")

# Verify file creation
cat("\nFiles created in current directory:\n")
cat("- exam_data.csv\n")
cat("- exam_data.txt\n")
cat("- exam_data.rds\n")

# Read back the CSV file to verify
cat("\n\nVERIFY CSV FILE CONTENT:\n")
cat("========================\n")
read_back <- read.csv("exam_data.csv")
print(head(read_back, 3))

# Additional operations
cat("\n\nADDITIONAL ANALYSIS:\n")
cat("===================\n")

# Count qualified students
qualified_count <- sum(exam_data$qualify == 'yes')
cat("Number of qualified students:", qualified_count, "\n")

# Average score by qualification status
avg_score_qualified <- mean(exam_data$score[exam_data$qualify == 'yes'])
avg_score_not <- mean(exam_data$score[exam_data$qualify == 'no'])
cat("Average score (qualified):", round(avg_score_qualified, 2), "\n")
cat("Average score (not qualified):", round(avg_score_not, 2), "\n")

# Students with multiple attempts
multiple_attempts <- exam_data[exam_data$attempts > 1, ]
cat("\nStudents with more than 1 attempt:\n")
print(multiple_attempts[, c("name", "attempts", "score")])

# Final data frame dimensions
cat("\nFinal data frame dimensions:", dim(exam_data)[1], "rows,", dim(exam_data)[2], "columns\n")
