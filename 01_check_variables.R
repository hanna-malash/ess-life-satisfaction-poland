# 01_check_variables.R
# Проверяем, что выбранные переменные есть в ESS (PL) и сохраняем отчёт

# --- A) Проверяем, где мы находимся (папка проекта) ---
getwd()

# --- B) Загружаем данные ---
# ВАЖНО: файл "ESS country data - PL.csv" должен лежать в папке проекта ESS_dyplom
data <- read.csv("ESS country data - PL.csv")

# --- C) Список переменных, которые хотим использовать (Y + ~10 X) ---
vars_needed <- c(
  # Zmienna zależna (Y)
  "stflife",
  # Demograficzne
  "agea", "gndr",
  # Socjo-ekonomiczne
  "hincfel", "emplrel", "eduyrs",
  # Zdrowie
  "health", "dsbld",
  # Społeczne
  "marital", "sclmeet", "ppltrst"
)

# --- D) Проверяем, есть ли они в данных ---
check_tbl <- data.frame(
  variable = vars_needed,
  present_in_data = vars_needed %in% names(data),
  stringsAsFactors = FALSE
)

print(check_tbl)

# --- E) Создаём папку outputs и сохраняем результат ---
dir.create("outputs", showWarnings = FALSE)
write.csv(check_tbl, "outputs/variable_presence_check.csv", row.names = FALSE)

# --- F) Если чего-то нет — печатаем список отсутствующих ---
missing_vars <- vars_needed[!(vars_needed %in% names(data))]
if (length(missing_vars) > 0) {
  cat("\nMISSING VARIABLES:\n")
  print(missing_vars)
  cat("\nПодсказка: можно искать похожие названия так:\n")
  cat("grep('часть_имени', names(data), value = TRUE)\n")
} else {
  cat("\nOK: Все переменные найдены в данных.\n")
}

# --- G) Профиль пропусков (сколько NA) по найденным переменным ---
vars_exist <- vars_needed[vars_needed %in% names(data)]
missing_profile <- data.frame(
  variable = vars_exist,
  n_total = nrow(data),
  n_missing = sapply(vars_exist, function(v) sum(is.na(data[[v]]))),
  share_missing = sapply(vars_exist, function(v) mean(is.na(data[[v]]))),
  stringsAsFactors = FALSE
)

print(missing_profile)
write.csv(missing_profile, "outputs/missingness_profile.csv", row.names = FALSE)
