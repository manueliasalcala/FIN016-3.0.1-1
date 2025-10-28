install.packages("plm")
library(readxl)
library(plm)
data <- read_excel("DATAUSS.xlsx")
data <- pdata.frame(data, index = c("Fecha", "CORP"))

#To get the answer to the first point in the question, we can simply get the data frame's head and copy the results.
head(data)

pool <- plm(Invest ~ Value + Capital, data = data, model = "pooling")