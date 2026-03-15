model_logit <- glm(
  life_bin ~
    hincfel +
    emplrel +
    eduyrs +
    health +
    dsbld +
    sclmeet +
    ppltrst +
    agea +
    gndr +
    rlgdgr,
  data = model_data,
  family = binomial(link = "logit")
names(model_data)

summary(model_logit)
results <- summary(model_logit)$coefficients
write.csv(results, "model_coefficients.csv")
odds_ratios <- exp(coef(model_logit))
write.csv(odds_ratios, "odds_ratios.csv")
model_info <- data.frame(
  N = nrow(model_data),
  AIC = AIC(model_logit),
  Null_deviance = model_logit$null.deviance,
  Residual_deviance = model_logit$deviance
)

write.csv(model_info, "model_info.csv")
summary_stats <- summary(model_data)
write.csv(summary_stats, "summary_statistics.csv")

life_dist <- table(model_data$life_bin)
life_percent <- prop.table(life_dist)

write.csv(life_dist, "life_distribution_counts.csv")
write.csv(life_percent, "life_distribution_percent.csv")

png("health_vs_life_satisfaction.png")

boxplot(health ~ life_bin,
        data = model_data,
        main = "Health and Life Satisfaction",
        xlab = "Life Satisfaction",
        ylab = "Self-rated Health")

dev.off()



odds_ratios <- exp(coef(model_logit))

write.csv(odds_ratios, "odds_ratios.csv")

model_table <- summary(model_logit)$coefficients

write.csv(model_table, "model_results_logit.csv")
nrow(model_data)
