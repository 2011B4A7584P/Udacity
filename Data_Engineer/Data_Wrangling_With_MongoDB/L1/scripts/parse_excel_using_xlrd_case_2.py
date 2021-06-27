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
from zipfile import ZipFile
datafile = "2013_ERCOT_Hourly_Load_Data.xls"

def open_zip(datafile):

    with ZipFile('{0}.zip'.format(datafile), 'r') as myzip:
        myzip.extractall()

def parse_file(datafile):

    workbook = xlrd.open_workbook(datafile)
    sheet = workbook.sheet_by_index(0)
    
    max_exceltime = [sheet.cell_value(r,0) for r in range(sheet.nrows) if sheet.cell_value(r,1) == max(sheet.col_values(1, start_rowx=1, end_rowx=sheet.nrows))]
    min_exceltime = [sheet.cell_value(r,0) for r in range(sheet.nrows) if sheet.cell_value(r,1) == min(sheet.col_values(1, start_rowx=1, end_rowx=sheet.nrows))]
    
    data = {
            'maxtime': xlrd.xldate_as_tuple(max_exceltime[0], 0),
            'maxvalue': max(sheet.col_values(1, start_rowx=1, end_rowx=sheet.nrows)),
            'mintime': xlrd.xldate_as_tuple(min_exceltime[0], 0),
            'minvalue': min(sheet.col_values(1, start_rowx=1, end_rowx=sheet.nrows)),
            'avgcoast': sum(sheet.col_values(1, start_rowx=1, end_rowx=sheet.nrows))/sheet.nrows
    }
    return data


def test():
    open_zip(datafile)
    data = parse_file(datafile)
    print(data)
    assert data['maxtime'] == (2013, 8, 13, 17, 0, 0)
    assert round(data['maxvalue'], 10) == round(18779.02551, 10)


test()