#!/usr/bin/env python
"""
Your task is as follows:
- read the provided Excel file
- find and return the min, max and average values for the COAST region
- find and return the time value for the min and max entries
- the time values should be returned as Python tuples

Please see the test function for the expected return format
"""

import xlrd
import pprint
from zipfile import ZipFile
datafile = "2013_ERCOT_Hourly_Load_Data.xls"

def open_zip(datafile):

    with ZipFile('{0}.zip'.format(datafile), 'r') as myzip:
        myzip.extractall()

def parse_file(datafile):

    workbook = xlrd.open_workbook(datafile)
    sheet = workbook.sheet_by_index(0)
    
    
    coast_values = sheet.col_values(1, start_rowx=1, end_rowx=sheet.nrows)
    
    max_coast_value, min_coast_value = max(coast_values), min(coast_values)
    max_row_position, min_row_position = coast_values.index(max_coast_value)+1, coast_values.index(min_coast_value)+1 
    
    data = {
            'maxtime': xlrd.xldate_as_tuple(sheet.cell_value(max_row_position,0), 0),
            'maxvalue': max_coast_value,
            'mintime': xlrd.xldate_as_tuple(sheet.cell_value(min_row_position,0), 0),
            'minvalue': min_coast_value,
            'avgcoast': sum(coast_values)/float(len(coast_values))
    }
    return data


def test():
    open_zip(datafile)
    data = parse_file(datafile)
    pprint.pprint(data)
    assert data['maxtime'] == (2013, 8, 13, 17, 0, 0)
    assert round(data['maxvalue'], 10) == round(18779.02551, 10)


test()