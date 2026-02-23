# Set up plotting area for multiple plots
par(mfrow = c(2, 2))  # 2x2 grid of plots

# Plot 1: Empty plot with basic limits
plot(NA, 
     xlim = c(0, 10), 
     ylim = c(0, 20),
     xlab = "X Axis (0 to 10)", 
     ylab = "Y Axis (0 to 20)",
     main = "Empty Plot 1: Basic Limits",
     col = "blue")

# Plot 2: Empty plot with custom axis labels and grid
plot(NA, 
     xlim = c(-5, 5), 
     ylim = c(-10, 10),
     xlab = "X Axis (-5 to 5)", 
     ylab = "Y Axis (-10 to 10)",
     main = "Empty Plot 2: With Grid",
     col = "red",
     las = 1)  # horizontal axis labels
grid()  # add grid lines

# Plot 3: Empty plot with extended limits and logarithmic suggestion
plot(NA, 
     xlim = c(1, 100), 
     ylim = c(0.01, 100),
     xlab = "X Axis (1 to 100, log scale suggested)", 
     ylab = "Y Axis (0.01 to 100, log scale)",
     main = "Empty Plot 3: Wide Range",
     log = "xy")  # both axes on log scale

# Plot 4: Empty plot with customized appearance
plot(NA, 
     xlim = c(0, 50), 
     ylim = c(0, 50),
     xlab = "X Axis", 
     ylab = "Y Axis",
     main = "Empty Plot 4: Custom Box Style",
     axes = FALSE,  # remove default axes
     frame.plot = TRUE)  # keep frame

# Add custom axes
axis(1, at = seq(0, 50, by = 10), labels = seq(0, 50, by = 10))
axis(2, at = seq(0, 50, by = 10), labels = seq(0, 50, by = 10), las = 1)
box()

# Reset plotting parameters
par(mfrow = c(1, 1))

# Additional single empty plot with detailed specifications
cat("\nCREATING ADDITIONAL EMPTY PLOT WITH SPECIFICATIONS:\n")
cat("==================================================\n\n")

# Create a new empty plot with detailed axis limits
plot(NA, 
     xlim = c(-20, 20), 
     ylim = c(-15, 15),
     xlab = "X Values (from -20 to 20)", 
     ylab = "Y Values (from -15 to 15)",
     main = "Empty Plot with Quadrants",
     sub = "Ready for data points",
     col.main = "darkblue",
     col.lab = "darkgreen",
     cex.main = 1.5,
     cex.lab = 1.2,
     las = 1)

# Add reference lines
abline(h = 0, v = 0, col = "gray", lty = 2)  # axes at zero
abline(h = seq(-15, 15, by = 5), v = seq(-20, 20, by = 5), 
       col = "lightgray", lty = 3)  # grid lines

# Add quadrant labels
text(10, 10, "Quadrant I", col = "darkgreen", cex = 0.8)
text(-10, 10, "Quadrant II", col = "darkgreen", cex = 0.8)
text(-10, -10, "Quadrant III", col = "darkgreen", cex = 0.8)
text(10, -10, "Quadrant IV", col = "darkgreen", cex = 0.8)

# Add axis limits as text
text(0, 14, "Y-max = 15", col = "red", cex = 0.7)
text(18, 0, "X-max = 20", col = "red", cex = 0.7)

# Display axis limit information
cat("Axis Limits Summary:\n")
cat("- X-axis range: from -20 to 20\n")
cat("- Y-axis range: from -15 to 15\n")
cat("- Quadrants divided at x=0, y=0\n")
cat("- Grid lines at intervals of 5\n")
