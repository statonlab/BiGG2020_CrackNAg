setwd("~/Desktop/Jiali/UTK/2020 Summer/BiGG2020_CrackNAg/") # change path to working directory

# load ggplot2 package
library(ggplot2)

# Read data files, 1. shannon values and metadata table
Shannon <- read.table("WA_TN Shannon Vector.tsv", sep = "\t", header = T)
sample_table <- read.csv("../nifa_meta.csv", header = T, skip = 1)

# add sample feature to data
Shannon_sample <- merge(Shannon, sample_table[,c(1,4,5,6,7)], by = "X", all.x = T)
# the basic box plot
ggplot(Shannon_sample, aes(x=Treat, y=shannon)) + 
  geom_boxplot()

# add box colors and edit x, y-axis, turn into white background
ggplot(Shannon_sample, aes(x=Treat, y=shannon, color=Compartment)) + # indicate what data, and which columns to use
  geom_boxplot()+ # plot type
  labs(title = "Shannon diveristy", x="Treatment",y="Shannon index")+ # edit labels
  theme(axis.text.x=element_text(angle=45, hjust=1), # rotate x-axis labels
        panel.background = element_blank(), # remove background and grids
        panel.border = element_rect(fill = NA, color = "black")) # add border
