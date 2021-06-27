DATA EXTRACTION FUNDAMENTALS:
----------------------------

This section is about review of the **fundamentals of tabular**
**data (CSV, Excel) and JSON format**


* Data scientists spend about 70% of their time in data wrangling

* **DATA WRANGLING** : *process of gathering (extracting,pulling), cleaning and storing data*

* Only after a proper data wrangling procedure in place, can we perform meaningful analysis on it

* A proper data wrangling procedure therefore ensures that data is in good shape

* Data that has gone through a proper data wrangling procedure and is in good shape and is available for analysis is called prepared data

* We will focus on lots of different types of data namely : music, energy, wikipedia, twitter, etc

* Data formats covered : JSON, HTML, XML, CSV, Excel, legacy text formats

* The last part will focus on how to store data in MongoDB and use it to support analysis

* MongoDB is increasingly important for data scientists as it is powerful and scalable

* Generally, we should not trust any data that we get. Check for authenticity, reliability and business contextual relevance of the data.

* The first step in data wrangling is to assess the source of data on below parameters in order to assess the assumptions about the data :
	* data values present in entire data
	* data types for those data values present in entire data
	* shape of entire data
	* identify errors or outliers in entire data - there are in fact severals ways to check for errors and also for checking whether data is within or outside range of expected values
	* find missing values in the data
	* finally, we need to ensure that the data will support the kind of queries that we need to make - the idea here is to eliminate surprises here to avoid leading to bad analysis later
	
* TABULAR DATA: Source - MS OFFICE, Excel, Calc from Apache OpenOffice, Google Spreadsheets
	* Each row here represents a data item - call it observation, record etc
	* Each column represent a field - call it an attribute for an observation
	* Each value is the data entry in the cell corresponding to the value of the field for a given observation

* Reasons for choice of CSV:
	* Lightweight
	* Each line of text is a single row
	* Fields are separated by a delimiter, usually a comma
	* TSV - an alternative of CSV, where the delimiter is tab character
	* CSV files store just the data itself or better said - just the data and the delimiters
	* The benefit of above is that files are as small as they reasonably can be
	* They don't need special purpose software for interaction or usage
	* Above is true as we can see csv files not only using MS Excel but also through command line, any text editor
	* Though we don't need an app for csv files, most spreadsheet apps like MS Excel can read and write in csv files
	

'''
* Python string method **strip()** will come in handy to get rid of the extra whitespace (that includes newline character at the end of line)
* strip() : Removes spaces at the beginning and at the end of the string:

Example : 
         txt = "     banana     "
        
         x = txt.strip()
            
         print("of all fruits", x, "is my favorite")

Output :
         of all fruits banana is my favorite
'''
	
	

	
	

