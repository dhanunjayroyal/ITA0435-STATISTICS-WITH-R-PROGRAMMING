# Load required libraries
library(reshape2)
library(dplyr)

# Load the airquality dataset
data("airquality")

# View the structure of the dataset
str(airquality)
head(airquality)

# Step 1: Melt the dataset
# Convert from wide to long format
melted_data <- melt(airquality, 
                    id.vars = c("Month", "Day"),  # Keep Month and Day as identifiers
                    measure.vars = c("Ozone", "Solar.R", "Wind", "Temp"),  # Variables to melt
                    variable.name = "Measurement",  # Name for the new variable column
                    value.name = "Value")  # Name for the new value column

# View the melted data
head(melted_data)
cat("\nStructure of melted data:\n")
print(str(melted_data))

# Step 2: Cast the data to compute monthly averages
# Using dcast to reshape and aggregate
monthly_averages <- dcast(melted_data, 
                          Month ~ Measurement,  # Rows = Month, Columns = Measurements
                          fun.aggregate = mean,  # Calculate mean
                          na.rm = TRUE)  # Remove NA values

# View the results
cat("\nMonthly Averages for Air Quality Measurements:\n")
print(monthly_averages)

# Step 3: Alternative approach using dplyr (for comparison)
monthly_avg_dplyr <- airquality %>%
  group_by(Month) %>%
  summarise(across(c(Ozone, Solar.R, Wind, Temp), 
                   ~mean(.x, na.rm = TRUE))) %>%
  rename_all(~gsub("_mean", "", .x))

cat("\nMonthly Averages using dplyr:\n")
print(monthly_avg_dplyr)

# Step 4: Add month names for better readability
month_names <- c("5" = "May", "6" = "June", "7" = "July", 
                 "8" = "August", "9" = "September")

monthly_averages$Month_Name <- month_names[as.character(monthly_averages$Month)]

# Reorder columns to put Month_Name first
monthly_averages <- monthly_averages[, c("Month", "Month_Name", "Ozone", "Solar.R", "Wind", "Temp")]

cat("\nMonthly Averages with Month Names:\n")
print(monthly_averages)

# Step 5: Create a more detailed cast with multiple aggregation functions
detailed_summary <- dcast(melted_data, 
                          Month ~ Measurement, 
                          fun.aggregate = function(x) c(Mean = mean(x, na.rm = TRUE),
                                                        SD = sd(x, na.rm = TRUE),
                                                        Max = max(x, na.rm = TRUE),
                                                        Min = min(x, na.rm = TRUE)))

cat("\nDetailed Monthly Summary (Mean, SD, Max, Min):\n")
print(detailed_summary)

# Step 6: Visualize the monthly averages
# Load ggplot2 for visualization
library(ggplot2)

# Reshape for plotting
monthly_long <- melt(monthly_averages, 
                     id.vars = c("Month", "Month_Name"),
                     measure.vars = c("Ozone", "Solar.R", "Wind", "Temp"),
                     variable.name = "Measurement",
                     value.name = "Average_Value")

# Create bar plot
ggplot(monthly_long, aes(x = Month_Name, y = Average_Value, fill = Measurement)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~Measurement, scales = "free_y") +
  theme_minimal() +
  labs(title = "Monthly Averages of Air Quality Measurements",
       x = "Month",
       y = "Average Value") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Step 7: Create a pivot table-like output
cat("\nPivot Table Format (Monthly Averages):\n")
cat("======================================\n")
for(i in 1:nrow(monthly_averages)) {
  cat(sprintf("\n%s (Month %d):\n", monthly_averages$Month_Name[i], monthly_averages$Month[i]))
  cat(sprintf("  Ozone:    %.2f ppb\n", monthly_averages$Ozone[i]))
  cat(sprintf("  Solar.R:  %.2f langley\n", monthly_averages$Solar.R[i]))
  cat(sprintf("  Wind:     %.2f mph\n", monthly_averages$Wind[i]))
  cat(sprintf("  Temp:     %.2f °F\n", monthly_averages$Temp[i]))
}
