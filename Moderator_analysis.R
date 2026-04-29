library(readxl)
library(interactions)
library(jtools)
library(ggplot2)
library(dplyr)

# Load data
df <- read_excel("C:/Users/Admin/Documents/Thesis/Jhonson Neyman/data.xlsx")
df <- as.data.frame(df)

# Create composite variable
df$EXTSUP <- rowMeans(df[, c("EXTSUP1","EXTSUP2","EXTSUP3")], na.rm = TRUE)

# Rename for clarity
df$TRST <- df$Trust

# Mean-centering
df$TRST_c <- scale(df$TRST, center = TRUE, scale = FALSE)
df$EXTSUP_c <- scale(df$EXTSUP, center = TRUE, scale = FALSE)

# =========================
# EXTSUP MODERATOR
# =========================

# ACCPT model
model_accpt <- lm(ACCPT ~ TRST_c * EXTSUP_c, data = df)
summary(model_accpt)

# Plot (clean labels)
interact_plot(
  model_accpt,
  pred = TRST_c,
  modx = EXTSUP_c,
  x.label = "Trust",
  modx.label = "External Support",
  y.label = "Acceptance"
)

johnson_neyman(
  model_accpt,
  pred = TRST_c,
  modx = EXTSUP_c,
  plot = TRUE
)

# TSTNC model
model_tstnc <- lm(TSTNC ~ TRST_c * EXTSUP_c, data = df)
summary(model_tstnc)

interact_plot(
  model_tstnc,
  pred = TRST_c,
  modx = EXTSUP_c,
  x.label = "Trust",
  modx.label = "External Support",
  y.label = "Trusting Stance"
)

johnson_neyman(
  model_tstnc,
  pred = TRST_c,
  modx = EXTSUP_c,
  plot = TRUE
)

# =========================
# AGE MODERATOR
# =========================

df$Age_NUM <- recode(df$Age,
                     "20 and below" = 20,
                     "21 to 30" = 25,
                     "31 to 40" = 35,
                     "41 to 50" = 45,
                     "51 and above" = 55,
                     "Prefer not to say" = NA_real_
)

df$Age_c <- scale(df$Age_NUM, center = TRUE, scale = FALSE)

# ACCPT
model_age_accpt <- lm(ACCPT ~ TRST_c * Age_c, data = df)
summary(model_age_accpt)

interact_plot(
  model_age_accpt,
  pred = TRST_c,
  modx = Age_c,
  x.label = "Trust",
  modx.label = "Age",
  y.label = "Acceptance"
)

# TSTNC
model_age_tstnc <- lm(TSTNC ~ TRST_c * Age_c, data = df)
summary(model_age_tstnc)

interact_plot(
  model_age_tstnc,
  pred = TRST_c,
  modx = Age_c,
  x.label = "Trust",
  modx.label = "Age",
  y.label = "Trusting Stance"
)

johnson_neyman(
  model_age_accpt,
  pred = TRST_c,
  modx = Age_c,
  plot = TRUE
)

# =========================
# USER EXPERIENCE MODERATOR
# =========================

df$UEXP_NUM <- recode(df$UEXP,
                      "Not at all" = 1,
                      "Slightly" = 2,
                      "Moderately" = 3,
                      "Very" = 4,
                      "Extremely" = 5,
                      "I don’t know" = NA_real_
)

df$UEXP_c <- scale(df$UEXP_NUM, center = TRUE, scale = FALSE)

# ACCPT
model_userexp_accpt <- lm(ACCPT ~ TRST_c * UEXP_c, data = df)
summary(model_userexp_accpt)

interact_plot(
  model_userexp_accpt,
  pred = TRST_c,
  modx = UEXP_c,
  x.label = "Trust",
  modx.label = "User Experience",
  y.label = "Acceptance"
)

# TSTNC
model_userexp_tstnc <- lm(TSTNC ~ TRST_c * UEXP_c, data = df)
summary(model_userexp_tstnc)

interact_plot(
  model_userexp_tstnc,
  pred = TRST_c,
  modx = UEXP_c,
  x.label = "Trust",
  modx.label = "User Experience",
  y.label = "Trusting Stance"
)

johnson_neyman(
  model_userexp_accpt,
  pred = TRST_c,
  modx = UEXP_c,
  plot = TRUE
)

# =========================
# SIMPLE SLOPES (OPTIONAL)
# =========================

sim_slopes(model_accpt, pred = TRST_c, modx = EXTSUP_c)
sim_slopes(model_tstnc, pred = TRST_c, modx = EXTSUP_c)

sim_slopes(model_age_accpt, pred = TRST_c, modx = Age_c)
sim_slopes(model_userexp_accpt, pred = TRST_c, modx = UEXP_c)