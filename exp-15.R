# Load dataset (built-in)
data(iris)

# 1. Dimensions
dim_iris <- dim(iris)
print("Dimensions (rows, columns):")
print(dim_iris)

# 2. Summary statistics
print("Summary:")
summary(iris)

# 3. Standard deviation (numeric columns only)
print("Standard Deviation:")
sd_values <- sapply(iris[, 1:4], sd)
print(sd_values)

# 4. Quantiles
print("Quantiles:")
quantiles <- sapply(iris[, 1:4], quantile)
print(quantiles)

# 5. Grouping by Species (mean of each feature)
print("Grouped Mean by Species:")
group_species <- aggregate(. ~ Species, data = iris, FUN = mean)
print(group_species)

# 6. Pivot table (mean Sepal.Length by Species)
print("Pivot Table (Mean Sepal.Length by Species):")
pivot_table <- with(iris, tapply(Sepal.Length, Species, mean))
print(pivot_table)

# 7. Categorical grouping with Sepal.Length categories
# Create categories
iris$SepalCat <- cut(
  iris$Sepal.Length,
  breaks = c(4, 5, 6, 7, 8),
  labels = c("Short", "Medium", "Long", "Very Long"),
  include.lowest = TRUE
)

print("Counts by Sepal Length Category:")
table(iris$SepalCat)

print("Category vs Species:")
table(iris$SepalCat, iris$Species)
