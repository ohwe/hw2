My code

(1) reads column names for dataset from file "features.txt"
(2) reads labels for activities from file "activity_labels.txt"
(3) reads data and binds tables generated from different input files (for test and train separately)
(4) binds test and train data
(5) selects only 66 columns that are useful (list of those columns generated by fgrep 'mean(' and fgrep 'std(' in console)
(6) produces activity names by merging table from (2) and actual dataset
(7) finally I use genaralisation of 'tapply' function for data.frames - i.e. 'by' function
(8) output is generated by mere 'sink' (redirect all R output to file) and 'print', not as recommended in instructions
