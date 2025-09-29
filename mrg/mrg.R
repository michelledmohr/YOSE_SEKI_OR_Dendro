#mrg Sequoia Site Analysis
#Elizabeth Sanchez

library(dplR)

seki_mrg <- read.rwl("mrg.rwl")
head(seki_mrg)

#Negative exponential detrending
seki_negExp <- detrend(seki_mrg, method = "ModNegExp")

#yose_spline <- detrend(yose_CF, method = "Spline", nyrs = 32)

#detrended series using 1st method
head(seki_negExp)

write.csv(seki_negExp, "Seki_mrg_negExp", row.names = TRUE)
#write.csv(yose_spline, "Yose_Cf_Spline", row.names = TRUE)

#standardize, site chronology
mrg_std <- chron(seki_negExp, prefix = "MRG_", biweight = TRUE)



windows();plot.rwl(
  seki_mrg,
  plot.type = "spag",
  main = "SEKI MRG — Original Ring-Widths",
  xlab = "Year",
  ylab = "Ring width (0.01 mm)"
)
grid()



##  Site chronology (mean index + optional spline)
# plot.chron is dispatched by plot() for chron objects
windows();plot(
  mrg_std,
  add.spline = TRUE,        # adds   smoothing spline over the mean chronology
  nyrs = 32,                  
  xlab = "Year",
  ylab = "Chronology (RWI)",
  main = "SEKI MRG — Site Chronology (RWI + 32-yr spline)"
)
grid()

