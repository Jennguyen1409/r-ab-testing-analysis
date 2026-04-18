# Load data
df <- read.csv("ab_test_data.csv")

# Calculate control group
control_converted <- sum(df$group == "control" & df$converted == 1)
control_total <- sum(df$group == "control")
control_rate <- control_converted / control_total

# Calculate treatment group
treatment_converted <- sum(df$group == "treatment" & df$converted == 1)
treatment_total <- sum(df$group == "treatment")
treatment_rate <- treatment_converted / treatment_total

# Run statistical test
test_result <- prop.test(x = c(control_converted, treatment_converted),
                         n = c(control_total, treatment_total),
                         correct = FALSE)
p_value <- test_result$p.value

# Print results to console
cat("========================================\n")
cat("A/B TEST RESULTS\n")
cat("========================================\n")
cat(paste("Control conversion rate:", round(control_rate * 100, 2), "%\n"))
cat(paste("Treatment conversion rate:", round(treatment_rate * 100, 2), "%\n"))
cat(paste("P-value:", round(p_value, 4), "\n"))
cat(paste("Conclusion:", ifelse(p_value < 0.05, "Significant difference", "No significant difference"), "\n"))
cat("========================================\n")

# Create bar chart
bar_heights <- c(control_rate, treatment_rate)
bar_names <- c("Control", "Treatment")
bar_colors <- c("steelblue", "coral")

# Draw the chart
barplot(bar_heights, 
        names.arg = bar_names,
        col = bar_colors,
        main = "A/B Test: Landing Page Conversion Rates",
        sub = paste("P-value =", round(p_value, 4)),
        ylab = "Conversion Rate",
        ylim = c(0, 0.15))

# Add percentage labels on top of bars
text(x = c(0.7, 1.9), 
     y = bar_heights + 0.005, 
     labels = paste0(round(bar_heights * 100, 2), "%"))

# Save the chart as a PNG file
png("ab_test_chart.png", width = 800, height = 600)

bar_heights <- c(control_rate, treatment_rate)
bar_names <- c("Control", "Treatment")

barplot(bar_heights, 
        names.arg = bar_names,
        col = c("steelblue", "coral"),
        main = "A/B Test: Landing Page Conversion Rates",
        sub = paste("P-value =", round(p_value, 4)),
        ylab = "Conversion Rate",
        ylim = c(0, 0.15))

text(x = c(0.7, 1.9), 
     y = bar_heights + 0.01, 
     labels = paste0(round(bar_heights * 100, 2), "%"))

dev.off()

# Confirm the file was created
list.files()

# Save the chart as a PNG file
png("ab_test_chart.png", width = 800, height = 600)

bar_heights <- c(control_rate, treatment_rate)
bar_names <- c("Control", "Treatment")

barplot(bar_heights, 
        names.arg = bar_names,
        col = c("steelblue", "coral"),
        main = "A/B Test: Landing Page Conversion Rates",
        sub = paste("P-value =", round(p_value, 4)),
        ylab = "Conversion Rate",
        ylim = c(0, 0.15))

text(x = c(0.7, 1.9), 
     y = bar_heights + 0.01, 
     labels = paste0(round(bar_heights * 100, 2), "%"))

dev.off()

# Confirm the file was created
list.files()
