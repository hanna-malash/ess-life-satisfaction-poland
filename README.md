# ESS: Determinants of Life Satisfaction in Poland (Logit)

This repository contains a reproducible research workflow for analyzing determinants of life satisfaction in Poland using European Social Survey (ESS) data.

## Research idea
- Outcome: life satisfaction (ESS variable: stflife, scale 0–10)
- Binary coding (current working approach):
  - 0–3: "not satisfied"
  - 7–10: "satisfied"
  - 4–6: excluded from the binary model
- Model: logistic regression (logit)

## Repository structure
- scripts/ – R scripts (data preparation, recoding, modeling)
- report/ – report files (to be added)
- outputs/ – tables and figures
- data/ – local-only data folder (ESS raw data NOT included)

## Data access
Download ESS data from the official ESS website and place it in the local data/ folder.

## Notes
This is a clean portfolio version of an academic research project.
