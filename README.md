# TrAAIT Thesis Dataset and R Code

This repository contains the datasets and R scripts used in the study:

**"AI-Powered Leukocoria Detection Tool: A TrAAIT-Based Analysis of User Acceptance and Trust"**

---

## 📂 Repository Contents

### 📊 Datasets
- `pilot_dataset.xlsx`  
  Dataset collected during the pilot testing phase used for instrument validation and reliability assessment.

- `final_dataset.xlsx`  
  Final dataset (n = 125) used for hypothesis testing and main statistical analysis.

---

### 💻 R Scripts

- `Data_cleaning.R`  
  Script for data import, missing data analysis, outlier detection, and dataset filtering.

- `Moderator_analysis.R`  
  Script for moderation analysis using linear regression, interaction effects, visualization, and Johnson-Neyman technique.

---

## ⚙️ Data Cleaning Overview

The data cleaning process includes:

- Importing raw survey data from Excel  
- Selecting numeric variables for analysis  
- Assessing missing data patterns (MD pattern, MCAR test)  
- Computing missing value proportions per variable  
- Filtering cases based on missing data threshold (20%)  
- Detecting outliers using z-score standardization (|z| > 3)  

This ensures that the dataset meets the assumptions required for subsequent statistical analysis under the TrAAIT framework.

---

## 📈 Analysis Workflow

The full analysis follows this sequence:

1. **Data Cleaning (`Data_cleaning.R`)**
   - Missing data assessment and filtering  
   - Outlier detection  
   - Preparation of cleaned dataset  

2. **Moderation Analysis (`Moderator_analysis.R`)**
   - Mean-centering of variables  
   - Construction of interaction terms  
   - Linear regression modeling  
   - Interaction plotting  
   - Johnson-Neyman significance probing  

---

## 🔁 Reproducibility Instructions

To reproduce the analysis:

1. Download all files in this repository  
2. Open RStudio  
3. Set working directory to the project folder  
4. Install required packages:

```r
install.packages(c("mice", "naniar", "readxl", "dplyr", "ggplot2", "interactions", "jtools"))
