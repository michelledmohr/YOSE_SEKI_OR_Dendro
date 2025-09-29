#tg Site Analysis
#Elizabeth Sanchez 


library(dplR)

# reads in raw ring-width file
tg_rwl <- read.rwl("tg.rwl")
head(tg_rwl)

# negative exponential detrending method
tg_negExp <- detrend(tg_rwl, method = "ModNegExp")

# preview detrended values
head(tg_negExp)


write.csv(tg_negExp, "tg_negExp.csv", row.names = TRUE)

# builds standardized site chronology
tg_std <- chron(tg_negExp, prefix = "TG_", biweight = TRUE)



#  original ring-widths
windows();plot.rwl(
  tg_rwl,
  plot.type = "spag",
  main = "SEKI tg — Original Ring-Widths",
  xlab = "Year",
  ylab = "Ring width (0.01 mm)"
)
grid()


# site chronology  
windows();plot(
  tg_std,
  add.spline = TRUE,
  nyrs = 32,
  xlab = "Year",
  ylab = "Chronology (RWI)",
  main = "YOSE TG — Site Chronology (RWI + 32-yr spline)"
)
grid()

