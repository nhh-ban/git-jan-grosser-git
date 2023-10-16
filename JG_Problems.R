# Packages to load
library(tidyverse)

# Problem 2

# I am not sure about how to link to the data file. As long as they are in the 
# same folder, it should be fine, right?
# If the working directory is set to the github-folder it should work.


# I decided to skip reading in the first 14 lines of description in the text file and exclude the header row.
# Instead, I copied and included them per hand, this step might be easier done, if I were to load them seperately 
# and combine the two, but for this task, I think it is sufficient.
# Since, the rest of the table is well formatted, I can just specify the seperator and read the data.

tidy_df <- as_tibble(
  read.delim(file = "suites_dw_Table1.txt", 
             header = F,
             skip = 14,
             col.names = c("name", "a_26", "m_b", "log_lk", "log_m26", 
                           "log_mhi", "vlg", "ti1" ,"md" ,"D","delta_vlg","count"),
             sep = "|"
             )
  )


# Problem 3
# "There are, however, some signs that the smaller objects are 
# under-represented in the sample. Can you make a plot that reveals 
# this tendency and a likely explanation?"
# The size of the galaxies should be presented in the variables 
# "a_26" (linear diameter of the galaxy in kpc) and 
# "m_b" (absolute magnitude of the galaxy)


ggplot(tidy_df,aes(x=a_26,y= m_b))+
  geom_point()


# Based on the plot, the there is some truth to the claim. Especially for the 
# absolute magnitude of the galaxies, sizes accumulate around a mean value of 
print(paste0("Mean value of 'm_b': ", round(mean(tidy_df$m_b,na.rm = T),4)))

# Maybe this imbalance is due to measurement issues. We lack the technology to 
# detect smaller objects.


