
data <- read.csv("ESS country data - PL.csv")


data$life_bin <- NA
data$life_bin[data$stflife >= 7 & data$stflife <= 10] <- 1
data$life_bin[data$stflife >= 0 & data$stflife <= 3] <- 0


vars_model <- c(
  "life_bin",
  "agea",
  "gndr",
  "hincfel",
  "emplrel",
  "eduyrs",
  "health",
  "dsbld",
  "sclmeet",
  "ppltrst",
  "rlgdgr"
)


model_data <- data[, vars_model]


model_data <- na.omit(model_data)


dim(model_data)
summary(model_data)

write.csv(model_data, "model_data_clean.csv", row.names = FALSE)
