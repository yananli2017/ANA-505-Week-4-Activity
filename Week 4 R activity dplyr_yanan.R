#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))

df <- as.data.frame(Titanic)


#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(df,5)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")    # alternative installation of the %>%
#Sometimes the program asks if I want to download datasets coming together with dplyr, i answered "Yes"
#Yes
library("dplyr")  

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)

df %>% select(Survived, Sex)

#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
df_sub <- df %>% select(Survived, Sex)
#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

df_sub %>% select(-Sex)
#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'

df %>% select(Gender = Sex)
#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
df_gender <- df %>% select(Gender = Sex,Class,Age,Survived, Freq)

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'

df_gender %>% filter(Gender == 'Male')
df_male <- df_gender %>% filter(Gender == 'Male')
#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())

df_gender %>% arrange(Gender)
#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:_2201___

df %>% summarise(sum(Freq, na.rm = TRUE))
#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
df_gender %>% filter(Gender == 'Female')

df_female <- df_gender %>% filter(Gender == 'Female')

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

df_union <- union_all(df_female, df_male)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package

df %>%
  group_by(Sex) %>%
  select(Freq) %>%
  summarise(freq = sum(Freq, na.rm = TRUE))
  

