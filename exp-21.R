# Load dataset
data(iris)

# Convert Species to factor (already factor, but ensure)
iris$Species <- as.factor(iris$Species)

# =========================
# 1. Train-Test Split (80/20)
# =========================
set.seed(123)  # for reproducibility

sample_index <- sample(1:nrow(iris), 0.8 * nrow(iris))

train_data <- iris[sample_index, ]
test_data  <- iris[-sample_index, ]

# =========================
# 2. Logistic Regression Model
# (multinomial via nnet package)
# =========================
library(nnet)

model <- multinom(Species ~ Petal.Length + Petal.Width, data = train_data)

# =========================
# 3. Prediction
# =========================
predictions <- predict(model, newdata = test_data)

# =========================
# 4. Confusion Matrix
# =========================
conf_matrix <- table(
  Actual = test_data$Species,
  Predicted = predictions
)

print("Confusion Matrix:")
print(conf_matrix)

# Accuracy
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
print(paste("Accuracy:", accuracy))
