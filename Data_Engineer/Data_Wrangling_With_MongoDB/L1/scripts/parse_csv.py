'''
Your task is to read the input DATAFILE line by line, and for the first 10 lines (not including the header)
split each line on "," and then for each line, create a dictionary
where the key is the header title of the field, and the value is the value of that field in the row.
The function parse_file should return a list of dictionaries,
each data line in the file being a single list entry.
Field names and values should not contain extra whitespace, like spaces or newline characters.
You can use the Python string method strip() to remove the extra whitespace.
You have to parse only the first 10 data lines in this exercise,
so the returned list should have 10 entries!
'''

# Python string method strip() will come in handy to get rid of the extra whitespace (that includes newline character at the end of line)
# Remove spaces at the beginning and at the end of the string:

'''
Example : 
         txt = "     banana     "
        
         x = txt.strip()
            
         print("of all fruits", x, "is my favorite")

Output :
         of all fruits banana is my favorite
'''

import os
# import pprint

DATADIR = ""
DATAFILE = "beatles-discography.csv"

def parse_file(datafile):
    data = []
    line_counter = 0
    # keys = ['Title', 'Released', 'Label', 'UK Chart Position', 'US Chart Position', 'BPI Certification', 'RIAA Certification']

    with open(datafile, "r") as f:
        keys = f.readline().strip().split(",")
        # print("\nKeys : ", keys)
        # print()
        while line_counter < 27:
            row = f.readline().strip().split(",")
            row_dict = dict(zip(keys, row))
            data.append(row_dict)
            # print(data[line_counter])
            # print()
            line_counter += 1

    return data


def test():
    
    # a simple test of the parse file implementation
    
    datafile = os.path.join(DATADIR, DATAFILE)
    d = parse_file(datafile)
    firstline = {'Title': 'Please Please Me', 'UK Chart Position': '1', 'Label': 'Parlophone(UK)', 'Released': '22 March 1963', 'US Chart Position': '-', 'RIAA Certification': 'Platinum', 'BPI Certification': 'Gold'}
    tenthline = {'Title': '', 'UK Chart Position': '1', 'Label': 'Parlophone(UK)', 'Released': '10 July 1964', 'US Chart Position': '-', 'RIAA Certification': '', 'BPI Certification': 'Gold'}
    # pprint.pprint(d[13])
    assert d[0] == firstline
    assert d[9] == tenthline

    print("\nDone with parsing of the initial few rows\n")
    print("Not entire data can be parsed due to various formating issues\n")
    print("Formatting issues like quote characters in a name, comma in a description and likewise\n")
    print("Time to pitch in csv library!\n")
    print("csv module deals with CSV formats in a pretty complete way")
    
    
if __name__ == '__main__':
    test()