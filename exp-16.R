# Load dataset (built-in)
data("USArrests")

# 1. Summary statistics
print("Summary Statistics:")
summary(USArrests)

# 2. State with largest Rape arrests
max_rape_state <- rownames(USArrests)[which.max(USArrests$Rape)]
print(paste("State with highest Rape arrests:", max_rape_state))

# 3. Max and Min Murder rates
max_murder <- max(USArrests$Murder)
min_murder <- min(USArrests$Murder)

max_murder_state <- rownames(USArrests)[which.max(USArrests$Murder)]
min_murder_state <- rownames(USArrests)[which.min(USArrests$Murder)]

print(paste("Max Murder Rate:", max_murder, "State:", max_murder_state))
print(paste("Min Murder Rate:", min_murder, "State:", min_murder_state))

# 4. Correlation among features
print("Correlation Matrix:")
cor_matrix <- cor(USArrests)
print(cor_matrix)

# 5. States above median Assault arrests
median_assault <- median(USArrests$Assault)
above_median_assault <- rownames(USArrests)[USArrests$Assault > median_assault]
print("States above median Assault:")
print(above_median_assault)

# 6. Bottom 25% states for Murder
quantile_murder <- quantile(USArrests$Murder, 0.25)
bottom_25_murder <- rownames(USArrests)[USArrests$Murder <= quantile_murder]
print("Bottom 25% states for Murder:")
print(bottom_25_murder)

# =========================
# VISUALIZATIONS
# =========================

# Histogram for Murder
hist(USArrests$Murder,
     main="Histogram of Murder Rate",
     xlab="Murder Rate")

# Density plot for Assault
plot(density(USArrests$Assault),
     main="Density Plot of Assault",
     xlab="Assault")

# Scatterplot: Murder vs Assault
plot(USArrests$Murder, USArrests$Assault,
     main="Murder vs Assault",
     xlab="Murder",
     ylab="Assault")

# Bar graph: Rape by State
barplot(USArrests$Rape,
        names.arg=rownames(USArrests),
        las=2,
        main="Rape Arrests by State",
        ylab="Rape Rate")
