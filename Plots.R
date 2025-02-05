library(readxl)
library(dplyr)
library(plotrix)  # For drawing ellipses

# Load the data
path <- "Waiting-time-steady-800-param2-n.xlsx"
data <- read_excel(path)

# Set Persian locale
Sys.setlocale(locale = "Persian")
data[[1]] <- as.numeric(data[[1]])
data[[2]] <- as.numeric(data[[2]])
data[[3]] <- as.numeric(data[[3]])
data[[4]] <- as.numeric(data[[4]])
data[[5]] <- as.numeric(data[[5]])
data[[6]] <- as.numeric(data[[6]])
data[[7]] <- as.numeric(data[[7]])

# Set custom font for Persian labels
windowsFonts(A = windowsFont("B Zar"))

# Set graphical parameters
op <- par(family = "A", font.lab = 1, font.axis = 1, font.main = 2)

# Plot Mean with Upper and Lower Bound as shaded area
plot_multiple_lines <- function(data, title, y_columns = c(2, 3)) {
  # Extract the columns
  x <- data[[1]]  # X values
  y1 <- data[[y_columns[1]]]  # First Y column
  y2 <- data[[y_columns[2]]] # Second Y column
  
  # Adjust plot margins
  par(mar = c(6, 6, 4, 2) + 0.1)  # Increase bottom and left margins
  
  # Set up the plot
  plot(x, y1, type = "n", 
       xlab = "شماره قاب‌های زمانی",
       ylab = "مدت زمان انتظار",
       cex.axis = 1.1, # Smaller axis labels
       cex.lab = 1.3, # Larger axis titles
       main = title, 
       las = 1,  # Rotate Y-axis labels
       ylim = range(c(y1, y2)))  # Set y-axis limits to include both y1 and y2
  
  axis(1, cex.axis = 1.1, las = 1)  # X-axis with spaced labels
  axis(2, cex.axis = 1.1, las = 1)  # Y-axis with horizontal labels
  
  # Add the lines
  lines(x, y1, col = "darkgray", lwd = 2)  # First Y column
  lines(x, y2, col = "red", lwd = 3)    # Second Y column
  
  # Add an arrow to the x-axis
  arrows(x0 = 500, y0 = 1900, # mabda
         x1 = 500, y1 = 2250, # maghsad
         length = 0.1, col = "blue", lwd = 2)
}

# Call the function
plot_multiple_lines(data, "مدت زمان انتظار بیماران عادی در صف پیش از جراحی سیستم ۲")