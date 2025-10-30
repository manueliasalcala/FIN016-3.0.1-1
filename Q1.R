library(readxl)
library(plm)
data <- read_excel("DATAUSS.xlsx")
data <- pdata.frame(data, index = c("Fecha", "CORP"))

#To get the answer to the first point in the question, we can simply get the data frame's head and copy the results.
head(data)

#We use the plm function to run the model.
pool <- plm(Invest ~ Value + Capital, data = data, model = "pooling")
summary(pool)

#And save the residuals and get their histogram.
pool_resid <- residuals(pool)
hist(pool_resid, main = "Residuales de modelo POOL", col = heat.colors(15))

#We next plot the residual series.
ts.plot(pool_resid, main = "Residuales de modelo POOL", xlab = "Fecha-Valor", ylab = "Error Ajuste Inversión", col = "Blue")

#We run the fixed effects model.
within <- plm(Invest ~ Value + Capital, data = data, model = "within")

#And the Wallce-Hussein Model
wahu <- plm(Invest ~ Value + Capital, data = data, model = "random", random.method = "walhus")
summary(wahu)

#Amemiya method
amemiya <- plm(Invest ~ Value + Capital, data = data, model = "random", random.method = "amemiya")
summary(amemiya)