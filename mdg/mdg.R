#mdg SEKI Site Analysis
#Elizabeth Sanchez 


library(dplR)

# reads in raw ring-width file
mdg_rwl <- read.rwl("mdg.rwl")
head(mdg_rwl)

# negative exponential detrending method
mdg_negExp <- detrend(mdg_rwl, method = "ModNegExp")

# preview detrended values
head(mdg_negExp)


write.csv(mdg_negExp, "mdg_negExp.csv", row.names = TRUE)

# builds standardized site chronology
mdg_std <- chron(mdg_negExp, prefix = "mdg_", biweight = TRUE)



#  original ring-widths
windows();plot.rwl(
  mdg_rwl,
  plot.type = "spag",
  main = "SEKI mdg — Original Ring-Widths",
  xlab = "Year",
  ylab = "Ring width (0.01 mm)"
)
grid()


# site chronology  
windows();plot(
  mdg_std,
  add.spline = TRUE,
  nyrs = 32,
  xlab = "Year",
  ylab = "Chronology (RWI)",
  main = "SEKI mdg — Site Chronology (RWI + 32-yr spline)"
)
grid()

