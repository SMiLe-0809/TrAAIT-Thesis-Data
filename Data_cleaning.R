library(mice)
library(naniar)
library(readxl)

data <- read_xlsx("data.xlsx")
data_clean <- data[sapply(data, is.numeric)]

md.pattern(data_clean)
colSums(is.na(data_clean))
colMeans(is.na(data_clean)) * 100

mcar_test(data_clean)

threshold <- 0.2
data_filtered <- data_clean[rowMeans(is.na(data_clean)) < threshold, ]


z_scores <- scale(data_clean)
which(abs(z_scores) > 3, arr.ind = TRUE)
