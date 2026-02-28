# ESS: Determinants of Life Satisfaction in Poland (Logit)

This repository contains a reproducible research workflow for analyzing determinants of life satisfaction in Poland using European Social Survey (ESS) data.

## Research idea
- Outcome: life satisfaction (ESS variable: `stflife`, scale 0–10)
- Binary coding (current working approach):
  - 0–3: "not satisfied"
  - 7–10: "satisfied"
  - 4–6: excluded from the binary model
- Model: logistic regression (logit)

## Repository structure
- `scripts/` – R scripts (data preparation, recoding, modeling)
- `report/` – report files (to be added)
- `outputs/` – generated tables and figures (optional)
- `data/` – local-only data folder (ESS raw data NOT included)

## Data access
This repository does not contain the raw ESS dataset.
Download ESS data from the official ESS website and place it in the local `data/` folder.

## How to run (basic)
Run scripts in order:
1. `scripts/01_check_variables.R`
2. `scripts/02_prepare_model_data.R`
3. `scripts/03_logit_model.R`
4. `scripts/04_results_tables.R`

## Notes
This is a clean portfolio version of an academic research project.

