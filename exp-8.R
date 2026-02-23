# Generate random numbers from normal distribution
set.seed(456)  # for reproducibility

# Generate 100 random numbers from normal distribution
# mean = 0, sd = 1 (standard normal)
normal_data <- rnorm(100, mean = 0, sd = 1)

# Display basic information
cat("RANDOM NUMBERS FROM NORMAL DISTRIBUTION\n")
cat("========================================\n")
cat("Generated 100 numbers from N(0,1)\n\n")

# Display first 20 numbers
cat("First 20 numbers:\n")
cat(round(normal_data[1:20], 3), "\n\n")

# Summary statistics
cat("SUMMARY STATISTICS:\n")
cat("Minimum:", round(min(normal_data), 3), "\n")
cat("Maximum:", round(max(normal_data), 3), "\n")
cat("Mean:", round(mean(normal_data), 3), "\n")
cat("Median:", round(median(normal_data), 3), "\n")
cat("Standard Deviation:", round(sd(normal_data), 3), "\n\n")

# COUNT OCCURRENCES IN DIFFERENT WAYS

# Method 1: Count by ranges (histogram bins)
cat("OCCURRENCE COUNTS BY RANGE:\n")
cat("===========================\n")

# Create ranges (bins)
breaks <- seq(-3, 3, by = 0.5)
ranges <- cut(normal_data, breaks = breaks)

# Count occurrences in each range
range_counts <- table(ranges)
print(range_counts)

# Method 2: Count positive and negative
cat("\nPOSITIVE VS NEGATIVE:\n")
cat("=====================\n")
positive_count <- sum(normal_data > 0)
negative_count <- sum(normal_data < 0)
zero_count <- sum(normal_data == 0)

cat("Positive numbers (>0):", positive_count, "\n")
cat("Negative numbers (<0):", negative_count, "\n")
cat("Zero:", zero_count, "\n\n")

# Method 3: Count within standard deviations
cat("COUNT BY STANDARD DEVIATIONS:\n")
cat("=============================\n")
within_1sd <- sum(abs(normal_data) <= 1)
within_2sd <- sum(abs(normal_data) <= 2)
outside_2sd <- sum(abs(normal_data) > 2)

cat("Within 1 SD (±1):", within_1sd, "\n")
cat("Within 2 SD (±2):", within_2sd, "\n")
cat("Outside 2 SD:", outside_2sd, "\n\n")

# Method 4: Count by specific value ranges
cat("COUNT BY SPECIFIC VALUE RANGES:\n")
cat("===============================\n")
below_minus1 <- sum(normal_data < -1)
between_minus1_0 <- sum(normal_data >= -1 & normal_data < 0)
between_0_1 <- sum(normal_data >= 0 & normal_data < 1)
above_1 <- sum(normal_data >= 1)

cat("Below -1:", below_minus1, "\n")
cat("-1 to 0:", between_minus1_0, "\n")
cat("0 to 1:", between_0_1, "\n")
cat("Above 1:", above_1, "\n\n")

# Method 5: Create a frequency table with custom rounding
cat("FREQUENCY TABLE (rounded to 1 decimal):\n")
cat("=======================================\n")
rounded_data <- round(normal_data, 1)
freq_table <- sort(table(rounded_data), decreasing = TRUE)
print(head(freq_table, 10))  # Show top 10 most frequent values

# Visual representation using histogram
cat("\nSIMPLE HISTOGRAM:\n")
cat("================\n")
hist_counts <- hist(normal_data, breaks = 10, plot = FALSE)
for(i in 1:length(hist_counts$counts)) {
  bar <- paste(rep("*", hist_counts$counts[i]), collapse = "")
  cat(sprintf("[%5.2f to %5.2f]: %s (%d)\n", 
              hist_counts$breaks[i], 
              hist_counts$breaks[i+1], 
              bar, 
              hist_counts$counts[i]))
}
