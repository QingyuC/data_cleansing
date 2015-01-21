1. run_anlysis.R aims to cleanse files, including merging files, extracting 
required components, and creating a cleansed version of a file

2. the drawback of the code is that it relies on local copy of the files
due to limited time. In the future the codes for dynamic downloading online
will be integrated

3. the codes have detailed comments to follow

4. basically it loads the necessary files and merges them
as request. It also extracts mean and std labels from activity
file and then extracts mean and std from corresponding merged file
Also, from number of activties, it assigns name and code for
each entry of the merged file. After that it combines files
by columns and uses aggregate function for the final summary
Finally it outputs the cleansed version using read.table

5. it uses View function for users to read or check entries from
loaded, merged or manipulated files.
