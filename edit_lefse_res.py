"""
Create on July 16, 2020
Author: Jiali
This is the script to edit the lefse res file. Make the taxonomy levels separate by '|'. 
Usage: python edit_lefse_res <input res file> <output file name>
"""
#Making new text file 
touch edit_lefse_res
chmod +x edit_lefse_res
nano edit_lefse_res #copy txt into new file

# text to put into the file
import sys
import re

file_in = sys.argv[1]
file_out = sys.argv[2]

with open(file_in,"r") as f, open(file_out,"w") as out:
    for line in f:
        # first we remove the level before Bacteria
        remove_D0 = line.strip("D_0__")
        # next we replace the D_x__ by pipe
        edit_ID = re.sub(r'D_\d__', '|', remove_D0)
        # then remove all leftover _
        new_ID = edit_ID.replace('_','')
        out.write(new_ID)

        #once you make this code into a text file, run the following command with file of interest
        python edit_lefse_res.py your_result_file.res new_file.res
      #example:  python edit_lefse_res collapse.frequency.table.with.meta.txt new.collapse.frequency.table.with.meta.txt
