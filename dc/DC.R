#dc Sequoia Site Analysis
#Elizabeth Sanchez

library(dplR)

seki_dc <- read.rwl("dc.rwl")
head(seki_dc)

#Negative exponential detrending
seki_negExp <- detrend(seki_dc, method = "ModNegExp")

#yose_spline <- detrend(yose_CF, method = "Spline", nyrs = 32)

#detrended series using 1st method
head(seki_negExp)

write.csv(seki_negExp, "Seki_dc_negExp", row.names = TRUE)
#write.csv(yose_spline, "Yose_Cf_Spline", row.names = TRUE)

#standardize, site chronology
dc_std <- chron(seki_negExp, prefix = "DC_", biweight = TRUE)



windows();plot.rwl(
  seki_dc,
  plot.type = "spag",
  main = "SEKI DC — Original Ring-Widths",
  xlab = "Year",
  ylab = "Ring width (0.01 mm)"
)
grid()



##  Site chronology (mean index + optional spline)
# plot.chron is dispatched by plot() for chron objects
windows();plot(
  dc_std,
  add.spline = TRUE,        # adds   smoothing spline over the mean chronology
  nyrs = 32,                  
  xlab = "Year",
  ylab = "Chronology (RWI)",
  main = "SEKI DC — Site Chronology (RWI + 32-yr spline)"
)
grid()

