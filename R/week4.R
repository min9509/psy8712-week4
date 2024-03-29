# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim(file = "../data/week4.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(import_tbl) # The correct answer is the glimpse function rather than the summary function
wide_tbl <- separate(import_tbl, col = "qs", into = c("q1", "q2", "q3", "q4", "q5"))
wide_tbl[,5:9] <- sapply(wide_tbl[,5:9], as.integer) # It is not a best practice. 
wide_tbl$datadate <- as.POSIXct(wide_tbl$datadate, format = "%b %d %Y, %H:%M:%S") # %b and %B (month names)
wide_tbl[,5:9][wide_tbl[,5:9] == 0] <- NA # Checking alternative ways.
wide_tbl <- drop_na(wide_tbl, q2) # naming consistency is important! 
long_tbl <- pivot_longer(wide_tbl, cols = q1:q5, names_to = "question", values_to = "response")