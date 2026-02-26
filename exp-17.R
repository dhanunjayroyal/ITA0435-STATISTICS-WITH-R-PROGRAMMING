# Load dataset (built-in)
data("Titanic")

# Convert to data frame for easier plotting
titanic_df <- as.data.frame(Titanic)

# 1. Bar chart of Survival vs Class
barplot(
  xtabs(Freq ~ Survived + Class, data = titanic_df),
  beside = TRUE,
  legend = TRUE,
  main = "Survival vs Passenger Class",
  xlab = "Survival",
  ylab = "Count"
)

# 2. Modified plot by Gender
barplot(
  xtabs(Freq ~ Survived + Class + Sex, data = titanic_df),
  beside = TRUE,
  legend = TRUE,
  main = "Survival vs Class by Gender",
  xlab = "Survival-Class-Sex",
  ylab = "Count"
)

# =========================
# Histogram of Age
# =========================

# Use Titanic dataset with individual records (from datasets package)
data("Titanic")
titanic_full <- as.data.frame(Titanic)

# Expand counts to individual rows
titanic_expanded <- titanic_full[rep(1:nrow(titanic_full), titanic_full$Freq), ]

# Age histogram
hist(
  as.numeric(titanic_expanded$Age),
  main = "Histogram of Age (Child vs Adult)",
  xlab = "Age Category"
)
