# Load dataset
data("ChickWeight")

# Convert Diet to factor (categorical predictor)
ChickWeight$Diet <- as.factor(ChickWeight$Diet)

# =========================
# 1. Build Multiple Regression Model
# =========================
model <- lm(weight ~ Time + Diet, data = ChickWeight)

# Model summary
print("Model Summary:")
summary(model)

# =========================
# 2. Predict Weight
# =========================
predicted_weight <- predict(model, newdata = ChickWeight)

# Add predictions to dataset
ChickWeight$Predicted_Weight <- predicted_weight

print("First few predictions:")
head(ChickWeight)

# =========================
# 3. Compute Model Error
# =========================
# Residuals
residuals <- ChickWeight$weight - ChickWeight$Predicted_Weight

# Mean Squared Error (MSE)
MSE <- mean(residuals^2)

# Root Mean Squared Error (RMSE)
RMSE <- sqrt(MSE)

print(paste("Mean Squared Error:", MSE))
print(paste("Root Mean Squared Error:", RMSE))
