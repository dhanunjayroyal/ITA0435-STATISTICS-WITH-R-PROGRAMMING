# Sample data
x <- c(10, 20, 15, 30, 25, 18, 22)
y <- c(5, 15, 10, 20, 18, 12, 17)
categories <- c("A", "B", "C", "D")
values <- c(12, 25, 18, 30)

# ======================
# 1. Boxplot
# ======================
boxplot(x,
        main = "Boxplot Example",
        ylab = "Values")

# ======================
# 2. Histogram
# ======================
hist(x,
     main = "Histogram Example",
     xlab = "Values")

# ======================
# 3. Bar Plot
# ======================
barplot(values,
        names.arg = categories,
        main = "Bar Plot Example",
        ylab = "Values")

# ======================
# 4. Line Chart
# ======================
plot(x, type = "l",
     main = "Line Chart Example",
     xlab = "Index",
     ylab = "Values")

# ======================
# 5. Scatter Plot
# ======================
plot(x, y,
     main = "Scatter Plot Example",
     xlab = "X Values",
     ylab = "Y Values")
