README.md

The script run_analysis.R does the following:

1. Sets the working directory
2. Loads dplyr package for use later in the script
3. Downloads the given file and save it as dataset.zip
4. Unzips the file
5. Resets the working directory to one of the folders in the newly unzipped file
6. Creates tables from eight of the files in the working directory
7. Converts to vector the values in variable V2 of the table with the measurement labls and assign to feature_labels. 
8. Assigns feature_labels vector as the variable names of the training and test datasets
9. Subsets training and test datasets to variables containing mean() or std().
10. Assigns "Activity" and "Subject" to the variable names in vectors for the type of activity being performed and the subject performing the activity
11. Combines the training activity, training subject, and training datasets
12. Combines the test activity, test subject and test datasets
13. Combines the new training and test datasets
14. Reassigns the numbers indicating the activity with a text descriptor of the activity
15. Expands the shorthand variable names to be more descriptive.
16. Creates a new dataset that finds the average value for each variable for each activity performed by each subject
17. Saves the new dataset as a text file