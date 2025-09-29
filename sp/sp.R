#sp Sequoia Site Analysis
#Elizabeth Sanchez

library(dplR)

seki_sp <- read.rwl("sp.rwl")
head(seki_sp)

#Negative exponential detrending
seki_negExp <- detrend(seki_sp, method = "ModNegExp")

#yose_spline <- detrend(yose_CF, method = "Spline", nyrs = 32)

#detrended series using 1st method
head(seki_negExp)

write.csv(seki_negExp, "Seki_sp_negExp", row.names = TRUE)
#write.csv(yose_spline, "Yose_Cf_Spline", row.names = TRUE)

#standardize, site chronology
sp_std <- chron(seki_negExp, prefix = "sp_", biweight = TRUE)



windows();plot.rwl(
  seki_sp,
  plot.type = "spag",
  main = "SEKI sp — Original Ring-Widths",
  xlab = "Year",
  ylab = "Ring width (0.01 mm)"
)
grid()



##  Site chronology (mean index + optional spline)
# plot.chron is dispatched by plot() for chron objects
windows();plot(
  sp_std,
  add.spline = TRUE,        # adds   smoothing spline over the mean chronology
  nyrs = 32,                  
  xlab = "Year",
  ylab = "Chronology (RWI)",
  main = "SEKI sp — Site Chronology (RWI + 32-yr spline)"
)
grid()

