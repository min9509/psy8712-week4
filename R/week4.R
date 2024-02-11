# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim(file = "../data/week4.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
str(import_tbl) # summary? glimpse??
wide_tbl <- separate(import_tbl, col = "qs", into = c("q1", "q2", "q3", "q4", "q5"))
wide_tbl
?separate
