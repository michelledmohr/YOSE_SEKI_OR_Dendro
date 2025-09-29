#GF SEKI Site Analysis
#Elizabeth Sanchez 


library(dplR)

# reads in raw ring-width file
gf_rwl <- read.rwl("gf.rwl")
head(gf_rwl)

# negative exponential detrending method
gf_negExp <- detrend(gf_rwl, method = "ModNegExp")

# preview detrended values
head(gf_negExp)


write.csv(gf_negExp, "GF_negExp.csv", row.names = TRUE)

# builds standardized site chronology
gf_std <- chron(gf_negExp, prefix = "GF_", biweight = TRUE)



#  original ring-widths
windows();plot.rwl(
  gf_rwl,
  plot.type = "spag",
  main = "SEKI GF — Original Ring-Widths",
  xlab = "Year",
  ylab = "Ring width (0.01 mm)"
)
grid()


# site chronology  
windows();plot(
  gf_std,
  add.spline = TRUE,
  nyrs = 32,
  xlab = "Year",
  ylab = "Chronology (RWI)",
  main = "SEKI GF — Site Chronology (RWI + 32-yr spline)"
)
grid()

