# 01_check_variables.R

getwd()

data <- read.csv("ESS country data - PL.csv")

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

check_tbl <- data.frame(
  variable = vars_needed,
  present_in_data = vars_needed %in% names(data),
  stringsAsFactors = FALSE
)

print(check_tbl)

dir.create("outputs", showWarnings = FALSE)
write.csv(check_tbl, "outputs/variable_presence_check.csv", row.names = FALSE)


missing_vars <- vars_needed[!(vars_needed %in% names(data))]
if (length(missing_vars) > 0) {
  cat("\nMISSING VARIABLES:\n")
  print(missing_vars)
  cat("\nHint: You can search for similar names like this:\n")
  cat("grep('part_of_name', names(data), value = TRUE)\n")
} else {
  cat("\nOK: All variables were found in the data..\n")
}

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
