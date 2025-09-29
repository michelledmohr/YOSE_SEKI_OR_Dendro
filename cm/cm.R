#CM SEKI Site Analysis
#Elizabeth Sanchez 


library(dplR)

# reads in raw ring-width file
cm_rwl <- read.rwl("cm.rwl")
head(cm_rwl)

# negative exponential detrending method
cm_negExp <- detrend(cm_rwl, method = "ModNegExp")

# preview detrended values
head(cm_negExp)


write.csv(cm_negExp, "cm_negExp.csv", row.names = TRUE)

# builds standardized site chronology
cm_std <- chron(cm_negExp, prefix = "CM_", biweight = TRUE)



#  original ring-widths
windows();plot.rwl(
  cm_rwl,
  plot.type = "spag",
  main = "SEKI CM — Original Ring-Widths",
  xlab = "Year",
  ylab = "Ring width (0.01 mm)"
)
grid()


# site chronology  
windows();plot(
  cm_std,
  add.spline = TRUE,
  nyrs = 32,
  xlab = "Year",
  ylab = "Chronology (RWI)",
  main = "SEKI CM — Site Chronology (RWI + 32-yr spline)"
)
grid()

