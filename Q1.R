install.packages("plm")
library(readxl)
library(plm)
data <- read_excel("DATAUSS.xlsx")
data <- pdata.frame(data, index = c("Fecha", "CORP"))

