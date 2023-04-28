---
title: "Getting and Cleaning Data Course project"
author: "Doc OmSa"
date: "`r Sys.Date()`"
output: html_document


# The course project was quite tough. I am thankful to the course coordinators, my peers and internet at large 
# making it possible for me to understand these things.

#Took me three days to complete it.

# There were two datasets - Test and Train.

# The packages needed were tidyverse, data.table and reshape2

# First i read table into R by using list files, fread and lapply functions.

# then I used r_bind for both datasets to make one single file for all the 9 files included in each datasets

# then I merged test and train data

# after this i extracted column indices for mean and std dev.

# then I turned activities and subjects into factors

# then I used melt and decast functions to fin out mean and SD

