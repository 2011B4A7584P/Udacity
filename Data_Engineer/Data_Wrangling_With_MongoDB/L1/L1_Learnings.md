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

* Reasons for choice of CSV data format:
	* Lightweight
	* Each line of text is a single row
	* Fields are separated by a delimiter, usually a comma
	* TSV - an alternative of CSV, where the delimiter is tab character
	* CSV files store just the data itself or better said - just the data and the delimiters
	* The benefit of above is that files are as small as they reasonably can be
	* They don't need special purpose software for interaction or usage
	* Above is true as we can see csv files not only using MS Excel but also through command line, any text editor
	* Though we don't need an app for csv files, most spreadsheet apps like MS Excel can read and write in csv files
	

* csv module [documentation](https://docs.python.org/2/library/csv.html)
* Python string method [strip()](https://python-reference.readthedocs.io/en/latest/docs/str/strip.html) will come in handy to get rid of the extra whitespace (that includes newline character at the end of line)
* strip() : Removes spaces at the beginning and at the end of the string:


Example : 
		 
		 
		txt = "     banana     "
				
		x = txt.strip()
					
		print("of all fruits", x, "is my favorite")
		 
		 
Output :
         
		of all fruits banana is my favorite
		 
	
* The [pprint](https://docs.python.org/3/library/pprint.html) module provides a capability to *pretty-print* arbitrary Python data structures in a form which can be used as input to the interpreter. If the formatted structures include objects which are not fundamental Python types, the representation may not be loadable. This may be the case if objects such as files, sockets or classes are included, as well as many other objects which are not representable as Python literals

* Working with Excel documents with [xlrd](https://pypi.org/project/xlrd/)

* **xlrd** module is compatible with both .xls and .xlsx formats

* [xlwt](https://pypi.org/project/xlwt/) module is used for create spreadsheet files compatible with MS Excel 97/2000/XP/2003 XLS files, on any platform, with Python 2.6, 2.7, 3.3+

* JSON came out of need for representing data that outgrew beyond limitations of tabular data
* JSON - JavaScript Object Notation is a lightweight data-interchange format
	* It is easy for humans to read and write 
	* It is easy for machines to parse and generate
	* It is a text format that is completely language independent
	* It uses conventions that are familiar to programmers of the C-family of languages, including C, C++, C#, Java, JavaScript, Perl, Python, and many others
	* These properties make JSON an ideal data-interchange language
	* JSON standard has emerged for modeling data and as a means of transmitting data between systems
	* JSON is built on two structures:
	
		* A collection of name/value pairs - in various languages, this is realized as an object, record, struct, dictionary, hash table, keyed list, or an associative array
		* An ordered list of values - in most languages, this is realized as an array, vector, list, or sequence
		* These are universal data structures - virtually all modern programming languages support them in one form or another
		* It makes sense that a data format that is interchangeable with programming languages also be based on these structures
	* We implement observations as JSON objects (synonymous to python dictionaries)	
	* JSON objects are in fact mostly dictionaries (JSON objects are dictionaries in python and in many other langugages)
	* There is a data type in most programming languages that is analogous to JSON object
	* Many other languages have dictionaries or map like data types that are very similar to JSON objects
		


