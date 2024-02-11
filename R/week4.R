# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim(file = "../data/week4.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
summary(import_tbl) # str? glimpse??
wide_tbl <- separate(import_tbl, col = "qs", into = c("q1", "q2", "q3", "q4", "q5"))
wide_tbl[,5:9] <- sapply(wide_tbl[,5:9], as.integer)
wide_tbl$datadate <- as.POSIXct(wide_tbl$datadate, format = "%Y %m %d, %H:%M:%S") 
wide_tbl[,5:9][wide_tbl[,5:9] == 0] <- NA
wide_tbl <- drop_na(wide_tbl, q2)
wide_tbl
?drop_na
?mutate()
