# Sample Advertising dataset
advertising <- data.frame(
  Spend = c(50, 60, 70, 90, 100, 120, 140, 160, 180, 200),
  Sales = c(30, 35, 40, 50, 55, 65, 70, 75, 85, 90)
)

# View data
print(advertising)

# =========================
# 1. Build Regression Model
# =========================
model <- lm(Sales ~ Spend, data = advertising)

# Model summary
print("Model Summary:")
summary(model)

# =========================
# 2. Predict Sales
# =========================
# Predict for new Spend values
new_data <- data.frame(Spend = c(110, 150, 210))
predicted_sales <- predict(model, newdata = new_data)

print("Predicted Sales:")
print(data.frame(new_data, Predicted_Sales = predicted_sales))

# =========================
# 3. Plot Regression Line
# =========================
plot(advertising$Spend, advertising$Sales,
     main = "Sales vs Advertising Spend",
     xlab = "Spend",
     ylab = "Sales")

abline(model, lwd = 2)
