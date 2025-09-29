#CF Yosemite Site Analysis
#Elizabeth Sanchez 


library(dplR)

# reads in raw ring-width file
cf_rwl <- read.rwl("CF.rwl")
head(cf_rwl)

# negative exponential detrending method
cf_negExp <- detrend(cf_rwl, method = "ModNegExp")

# preview detrended values
head(cf_negExp)


write.csv(cf_negExp, "CF_negExp.csv", row.names = TRUE)

# builds standardized site chronology
cf_std <- chron(cf_negExp, prefix = "CF_", biweight = TRUE)



#  original ring-widths
windows();plot.rwl(
  cf_rwl,
  plot.type = "spag",
  main = "YOSE CF — Original Ring-Widths",
  xlab = "Year",
  ylab = "Ring width (0.01 mm)"
)
grid()

# detrended series, spaghetti of individual cores
yrs <- as.numeric(rownames(cf_negExp))
windows();matplot(
  yrs,
  as.matrix(cf_negExp),
  type = "l",
  lty = 1,
  lwd = 0.8,
  xlab = "Year",
  ylab = "Ring-Width Index (RWI)",
  main = "YOSE CF — Detrended Series (ModNegExp)"
)
grid()

# site chronology  
windows();plot(
  cf_std,
  add.spline = TRUE,
  nyrs = 32,
  xlab = "Year",
  ylab = "Chronology (RWI)",
  main = "YOSE CF — Site Chronology (RWI + 32-yr spline)"
)
grid()

