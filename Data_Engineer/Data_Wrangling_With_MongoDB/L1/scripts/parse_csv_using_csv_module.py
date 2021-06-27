'''
Your task is to read the input DATAFILE line by line, and then for each 
line, create a dictionary where the key is the header title of the field,
and the value is the value of that field in the row. The function 
parse_file should return a list of dictionaries, each data line in the 
file being a single list entry. Field names and values should not 
contain extra whitespace, like spaces or newline characters. 
'''

import os
import csv
import pprint

DATADIR = ""
DATAFILE = "beatles-discography.csv"

def parse_file(complete_csv_data_file_path):
    
    data = []
    
    with open(complete_csv_data_file_path, "r") as csv_file:
        dict_rows = csv.DictReader(csv_file)
		
        for dict_row in dict_rows:
            data.append(dict_row)
            
    return data


def test():
    
    # a simple test of the parse file implementation
    
    datafile = os.path.join(DATADIR, DATAFILE)
    d = parse_file(datafile)
    firstline = {'Title': 'Please Please Me', 'UK Chart Position': '1', 'Label': 'Parlophone(UK)', 'Released': '22 March 1963', 'US Chart Position': '-', 'RIAA Certification': 'Platinum', 'BPI Certification': 'Gold'}
    tenthline = {'Title': '', 'UK Chart Position': '1', 'Label': 'Parlophone(UK)', 'Released': '10 July 1964', 'US Chart Position': '-', 'RIAA Certification': '', 'BPI Certification': 'Gold'}
    
    # pprint.pprint(d[13])
    # pprint.pprint(d)
    
    assert d[0] == firstline
    assert d[9] == tenthline
    
if __name__ == '__main__':
    test()