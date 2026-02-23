# First, let's create a sample CSV file if it doesn't exist
if(!file.exists("sample_data.csv")) {
  # Create sample data
  sample_data <- data.frame(
    ID = 1:10,
    Name = c("Alice", "Bob", "Charlie", "David", "Eva", 
             "Frank", "Grace", "Henry", "Ivy", "Jack"),
    Age = c(25, 32, 28, 45, 23, 38, 29, 41, 26, 35),
    Salary = c(50000, 65000, 55000, 80000, 48000, 
               72000, 58000, 90000, 51000, 68000),
    Department = c("HR", "IT", "IT", "Sales", "HR", 
                   "IT", "Sales", "Management", "HR", "IT"),
    stringsAsFactors = FALSE
  )
  
  # Write to CSV
  write.csv(sample_data, "sample_data.csv", row.names = FALSE)
  cat("Created sample_data.csv\n\n")
}

# PROGRAM TO READ AND DISPLAY CSV FILE
cat("R PROGRAM TO READ AND DISPLAY CSV FILE\n")
cat("======================================\n\n")

# Method 1: Basic read
cat("METHOD 1: Basic read.csv()\n")
cat("--------------------------\n")
data1 <- read.csv("sample_data.csv")
print(data1)

# Method 2: Read with options
cat("\n\nMETHOD 2: read.csv() with custom options\n")
cat("----------------------------------------\n")
data2 <- read.csv("sample_data.csv", 
                  header = TRUE,           # First row as header
                  stringsAsFactors = FALSE, # Don't convert strings to factors
                  na.strings = c("", "NA")) # Treat empty strings as NA
print(head(data2, 5))  # Show first 5 rows

# Method 3: Using read.table (more general)
cat("\n\nMETHOD 3: Using read.table()\n")
cat("-----------------------------\n")
data3 <- read.table("sample_data.csv", 
                    header = TRUE, 
                    sep = ",",           # Comma separator
                    stringsAsFactors = FALSE)
print(tail(data3, 3))  # Show last 3 rows

# DISPLAY DIFFERENT ASPECTS OF THE DATA
cat("\n\nDATA EXPLORATION\n")
cat("================\n")

# Display structure
cat("\n1. Data Structure:\n")
str(data1)

# Display summary
cat("\n2. Statistical Summary:\n")
summary(data1)

# Display column names
cat("\n3. Column Names:\n")
print(names(data1))

# Display number of rows and columns
cat("\n4. Dimensions:\n")
cat("Rows:", nrow(data1), "\n")
cat("Columns:", ncol(data1), "\n")

# Display first few rows
cat("\n5. First 3 rows:\n")
print(head(data1, 3))

# Display last few rows
cat("\n6. Last 2 rows:\n")
print(tail(data1, 2))

# Display specific columns
cat("\n7. Specific columns (Name and Department):\n")
print(data1[, c("Name", "Department")])

# Display data types of each column
cat("\n8. Data Types:\n")
for(col in names(data1)) {
  cat(col, ":", class(data1[[col]]), "\n")
}

# Check for missing values
cat("\n9. Missing Values:\n")
print(colSums(is.na(data1)))

# Basic statistics by group
cat("\n10. Average Salary by Department:\n")
aggregate(Salary ~ Department, data = data1, FUN = mean)

# HANDLE DIFFERENT CSV SCENARIOS
cat("\n\nHANDLING DIFFERENT CSV SCENARIOS\n")
cat("=================================\n")

# Scenario 1: File with no header
if(!file.exists("no_header.csv")) {
  write.table(data1, "no_header.csv", row.names = FALSE, 
              col.names = FALSE, sep = ",")
  cat("\nA. Reading CSV without header:\n")
  no_header <- read.csv("no_header.csv", header = FALSE)
  print(head(no_header, 3))
}

# Scenario 2: File with custom separator (semicolon)
if(!file.exists("semicolon_data.csv")) {
  write.table(data1, "semicolon_data.csv", row.names = FALSE, 
              sep = ";", quote = FALSE)
  cat("\nB. Reading semicolon-separated file:\n")
  semicolon_data <- read.csv2("semicolon_data.csv")  # read.csv2 for semicolon
  print(head(semicolon_data, 3))
}

# READ FROM URL (example - commented out)
cat("\nC. Reading from URL (commented out - requires internet):\n")
cat("# data_url <- read.csv('https://example.com/data.csv')\n")

# ERROR HANDLING
cat("\n\nERROR HANDLING\n")
cat("==============\n")

# Try to read a file that might not exist
safe_read_csv <- function(filename) {
  if(file.exists(filename)) {
    return(read.csv(filename))
  } else {
    cat("File", filename, "does not exist!\n")
    return(NULL)
  }
}

# Test with existing and non-existing files
cat("\nTesting with existing file:\n")
existing_data <- safe_read_csv("sample_data.csv")
if(!is.null(existing_data)) {
  cat("File loaded successfully!\n")
}

cat("\nTesting with non-existing file:\n")
non_existing <- safe_read_csv("nonexistent.csv")

# CLEAN UP (optional - remove created files)
cat("\n\nCLEAN UP\n")
cat("========\n")
# Uncomment below to remove created files
# file.remove("sample_data.csv", "no_header.csv", "semicolon_data.csv")
# cat("Temporary files removed.\n")
