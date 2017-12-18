# accelerometers_analysis
cleaning data collected from the accelerometers from the Samsung Galaxy S smartphone

## run_analysis function

the aim of this function is to make tidy data from different files

### arguments

the arguments of the function are all the .txt file:

1. **X_test**: measurements of the test part
2. **y_test**: type of activity for each observation in test
3. **subject_test**: list of subjects in test
4. **X_train**: measurements of the train part
5. **y_train**: type of activity for each observation in train
6. **subject_train**: list of subjects in train
7. **features**: list of features (variables of Xs files)
8. **activity_labels**: name for each activity

### 1- Merging train and test datasets

1. merging of test files (y and subject became 2 new variables in X)
2. merging of train files
3. merging of two datasets obtained by **1** and **2**

###2- Assign appropriate labels to each variable

1. get features names from file
2. add to features names the two variables added before: **subject** and **activity**
3. give features names to the dataset

###3- Extract mean and standard deviation

in this part we want to have the variables relted to mean and standard deviation.
There are many way in which it can be solved; in this case I search for every variable that contain **mean** and **std** in the name.
So, for example, instead of only **mean()** and **std()** variables, we have also **meanFreq()** and **angle(X,gravityMean)**

1. before we have to make an exception: the first two variables: **subject** and **activity
2. extract only variables containing mean of std in the name
3. adding the exception to the result

###4- Transform numeric values of activity in descriptive values

in this case we have to change the numbers of the **activity** variables and assign for each value, the labels of **activity_labels**

1. load the labels
2. apply a for loop to assign them

## Result data

As a final step, we need to create a second dataset with the average of each variable for each **subject** and **activity**.
Given the fact that this dataset should be independent, this process is outside the script
In this case I created a wide dataset with **activity** values as variables