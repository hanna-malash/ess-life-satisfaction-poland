# ==========================================
# 02_prepare_model_data.R
# Przygotowanie danych do modelu logit
# ==========================================

# 1. Wczytanie danych
data <- read.csv("ESS country data - PL.csv")

# 2. Tworzenie zmiennej zależnej (life satisfaction - binary)
data$life_bin <- NA
data$life_bin[data$stflife >= 7 & data$stflife <= 10] <- 1
data$life_bin[data$stflife >= 0 & data$stflife <= 3] <- 0

# 3. Lista wybranych zmiennych niezależnych
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

# 4. Tworzenie zbioru do modelu
model_data <- data[, vars_model]

# 5. Usuwamy obserwacje z brakami
model_data <- na.omit(model_data)

# 6. Podstawowe informacje
dim(model_data)
summary(model_data)

# 7. Zapis przygotowanego zbioru
write.csv(model_data, "model_data_clean.csv", row.names = FALSE)