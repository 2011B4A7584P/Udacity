*	Python is case-sensitive
*	Spacing matters in python, hence, be mindful of indentation
*	Use error messages to help yourself learn

**Data Types and Operators**


*	Data Types: Integers, Floats, Booleans, Strings

*	Operators: Arithmetic, Assignment, Comparison, Logical

	*	Arithmetic operators

		*	`+` Addition
		*	`-` Subtraction
		*	`*` Multiplication
		*	`/` Division
		*	`%` Mod (the remainder after dividing)
		*	`//` Integer Division (floor division to nearest integer left on number line)
		*	`**` Exponentiation

	*	Exponentiation (note that *^* does not do this operation, as you might have seen in other languages)
	*	`//` Integer division : Divides and rounds down to the nearest integer

*	Bitwise operators are special operators in Python
*	[Link to Bitwise operators](https://wiki.python.org/moin/BitwiseOperators)


*	Besides writing variable names that are descriptive, there are a few things to watch out for when naming variables in Python

	1. Only use ordinary letters, numbers and underscores in your variable names. They can’t have spaces, and need to start with a letter or underscore.

	2. We can’t use Python's reserved words, or **keywords** as variable names. There are reserved words in every programming language that have important purposes.
	
	3. Creating names that are descriptive of the values often will help us avoid using any of these keywords.

* Keywords:

	* The following identifiers are used as reserved words, or keywords of the language, and cannot be used as ordinary identifiers. 
	* They must be spelled exactly as written here:
	```
	False      await      else       import     pass
	None       break      except     in         raise
	True       class      finally    is         return
	and        continue   for        lambda     try
	as         def        from       nonlocal   while
	assert     del        global     not        with
	async      elif       if         or         yield
	```

	* The pythonic way to name variables is to use all lowercase letters and use underscores to separate words.
		```
		YES
		my_height = 58
		my_lat = 40
		my_long = 105
		
		NO
		my height = 58
		MYLONG = 40
		MyLat = 105
		```
*	Though the last two of these would work in python, they are not pythonic ways to name variables. The way we name variables is called snake case, because we tend to connect the words with underscores.


*	Assignment Operators:
```
	SYMBOL		 	EXAMPLE		  	  EQUIVALENT
	   =			x   =  2		  x =      2
	  +=			x  +=  2		  x = x +  2
	  -=			x  -=  2		  x = x -  2
	  *=			x  *=  2		  x = x *  2
	  /=			x  /=  2		  x = x /  2
	 **=			x **=  2		  x = x ** 2 (exponentiation)
	 //=			x //=  2		  x = x // 2 (floor division to nearest integer left on number line)
	  %=			x  %=  2		  x = x  % 2 (remainder)
```

*	4.445e8 is equal to 4.445 `*` 10 `**` 8 which is equal to 444500000.0

*	You can check the type of a variable by using the *type()* function
	```
		type(x)
	```

*	*Note* : Because the float, or approximation, for 0.1 is actually slightly more than 0.1, when we add several of them together we can see the difference between the mathematically correct answer and the one that Python creates.
*	Example:	
	```
		print(.1 + .1 + .1 == .3)
	```
*	Output:
	```
		False
	```
		

*	In general, there are two types of errors to look out for

	*	Exceptions
	*	Syntax

*	**An Exception is a problem that occurs when the code is running, but a Syntax Error is a problem detected when Python checks the code before it runs it.**

*	Strings : 
	*	`+` operator concatenates the strings whereas `*` repeats the string
	*	**Unlike the other data types you have seen so far, you can also index into strings**
	*	Example:
		```
			first_word = 'Hello'
			first_word[0]
		```
	*   Output:
		```
			H
		```

	* **len()** function
		* len() is a built-in Python function that returns the length of an object, like a string. The length of a string is the number of characters in the string. This will always be an integer.
		* What does the len function return when we give it the integer 835 instead of a string? An Error!
		* Nice! The error message generated reads: TypeError: object of type 'int' has no len(), which alludes to the fact that len() only works on a *sequence (such as a string, bytes, tuple, list, or range) or a collection (such as a dictionary, set, or frozen set)* as per the Python documentation.
		

* 	Methods are functions that belong to an object of specific type
	
* 	Methods are like some of the functions you have already seen:
		```
			len("this")
			type(12)
			print("Hello world")
		```	
* 	**These three above are functions - notice they use parentheses, and accept one or more arguments**
	
* 	A method in Python behaves similarly to a function 
*	Methods actually are functions that are called using dot notation 
*   For example, lower() is a string method that can be used like this, on a string called "sample string": sample_string.lower()

*	Methods are specific to the data type for a particular variable. 
*   So there are some built-in methods that are available for all strings, different methods that are available for all integers, etc. 
*   One important string method: format()

*	Example 1:

	```
		print("Mohammed has {} balloons".format(27))
	```	

*	Output 1:

	```
		Mohammed has 27 balloons
	```

*	Example 2:

	```
		animal = "dog"
		action = "bite"
		print("Does your {} {}?".format(animal, action))
	```

*	Output 2:

	```
		Does your dog bite?
	```	
	
*	Example 3:

	```
		maria_string = "Maria loves {} and {}"
		print(maria_string.format("math", "statistics"))
	```

*	Output 3:

	```
		Maria loves math and statistics
	```		

*	Example 4:
	
	```
		name = "Ashish"
		print(f"My name is {name}")
	```

*	Outcome 4:
	
	```
		My name is Ashish
	```

*	Another important string method: split()
*	split() returns a data container called a list that contains the words from the input string
*   The split method has two additional arguments (sep and maxsplit)
*   The sep argument stands for "separator"
*	It can be used to identify how the string should be split up (e.g., whitespace characters like space, tab, return, newline; specific punctuation (e.g., comma, dashes))
*	If the sep argument is not provided, the default separator is whitespace
*	True to its name, the maxsplit argument provides the maximum number of splits
*	The argument gives maxsplit + 1 number of elements in the new list, with the remaining string being returned as the last element in the list

* Understanding Common Error Messages

	* ZeroDivisionError: division by zero
	* SyntaxError: unexpected EOF while parsing
	* Example:
		```
			greeting = "hello"
			print(greeting.upper
		```
	* Output:
		```
			SyntaxError: unexpected EOF while parsing
		```
	* This message is often produced when you have accidentally left out something, like a parenthesis. 
	* The message is saying it has unexpectedly reached the end of file ("EOF") and it still didn't find that right parenthesis. 
	* This can easily happen with code syntax involving pairs, like beginning and ending quotes also
	* TypeError: len() takes exactly one argument (0 given)
	* This kind of message could be given for many functions, like len in this case, if I accidentally do not include the required number of arguments when I'm calling a function, as below
	* This message tells me how many arguments the function requires (one in this case), compared with how many I gave it (0). I meant to use len(chars) to count the number of characters in this long word, but I forgot the argument.
	* Example :
		```
			chars = "supercalifragilisticexpialidocious"
			len()
		```	
	* Output :
		```
			TypeError: len() takes exactly one argument (0 given)
		```
	* Search for Your Error Message
	
		* Software developers like to share their problems and solutions with each other on the web, so use Google search, or search in StackOverflow
		* Use Print Statements to Help Debugging
		* Adding print statements temporarily into your code can help you see which code lines have been executed before the error occurs, and see the values of any variables that might be important 
		* This approach to debugging can also be helpful even if you're not receiving an error message, but things just aren't working the way you want

DATA STRUCTURES:
---------------
*	Types of Data Structures: 

	*	**Lists - Mutable and Ordered** 
	*	**Tuples - Immutable and Ordered** 
	*	**Sets - Mutable and UnOrdered - contains a unique unordered collection of elements** 
	*   **Dictionaries - Mutable and UnOrdered - Keys are immutable but the dictionary is mutable** 
	*   **Compound Data Structures - subjected to case under consideration**

*	Operators: 
	*	**Membership - IN, NOT IN**
	*	**Identity - IS, IS NOT**
	
*	Built-In Functions or Methods

+	**MUTABILITY : WHETHER AN OBJECT CAN CHANGE ITS VALUES AFTER IT HAS BEEN CREATED**
+	**ORDER : WHETHER THE ORDER OF ELEMENTS IN AN OBJECT MATTERS (AND WHETHER THIS CAN BE USED TO ACCESS ELEMENTS)**

LIST: 
----
+	**A data structure in python that is mutable ordered sequence of elements**
+	Lists are ordered i.e. we can look up for specific element by their index
+	We can pull more than one value from a list at a time by using slicing
+	When using slicing, it is important to remember that the **lower index is inclusive and the upper index is exclusive**
+	We can use IN and NOT IN to return a bool of whether an element exists within our list, or if one string is a substring of another  
+	**Strings are sequences of letters where as lists can be sequence of any types of
	object (string, int, float, etc)**
+	**Lists can be modified but strings cannot**
+	**Strings are immutable where lists are mutable**
+	**Both strings and lists are ordered which is why indexing works for both**
  

Useful Functions for Lists: I

+	len() returns how many elements are in a list
	
+	max() returns the greatest element of the list. How the greatest element is 
	determined depends on what type objects are in the list. The maximum element
	in a list of numbers is the largest number. **The maximum elements in a list of
	strings is element that would occur last if the list were sorted alphabetically.**
	This works because the the max function is defined in terms of the greater 
	than comparison operator. **The max function is undefined for lists that contain 
	elements from different, incomparable types.**

+	min() returns the smallest element in a list. min is the opposite of max, which 
	returns the largest element in a list 
	
+	**sorted() returns a copy of a list in order from smallest to largest, leaving the list unchanged**

+	**join() is a string method that takes a list of strings as an argument, and returns
	a string consisting of the list elements joined by a separator string**

+	Example :
	
	```
		new_str = "\n".join(["fore", "aft", "starboard", "port"])
		print(new_str)
	```

+	Output :	
	```
		fore
		aft
		starboard
		port
	```

+	**It is important to remember to separate each of the items in the list you are joining with a comma , 
	forgetting to do so will not trigger an error, but will also give you unexpected results.**

+	Example :
	
	```
		new_str = "\n".join(["fore" "aft" "starboard" "port"])
		print(new_str)
	```
+	Output :	
	```
		foreaftstarboardport
	```
+	**append() method adds an element to the end of a list**

+	**NOTE : All data structures are data types but not vice-versa**

TUPLE:
-----
+	**A data type for immutable ordered sequences of elements**
+ 	**Tuples are used to store related pieces of information**
+ 	Tuples are immutable - we cannot add, remove or sort items in a tuple**
+ 	Elements of a tuple can be accessed by their indices just like in a list
+ 	**Tuples are mostly used when we have to keep closely related information together
	For example : location has (latitude, longitude) parameters**
+ 	**Tuples can be used to assign value to multiple variables in a compact way**
+ 	() are optional while forming tuples, so 1,2,3 is same as (1,2,3)
+ 	**Tuple unpacking is used to perform multiple assignment in a single line**
+ 	**Tuples are similar to lists in that they store an ordered collection of objects 
	which can be accessed by their indices. Unlike lists, however, tuples are 
	immutable - you can't add and remove items from tuples, or sort them in place**
+ 	The parentheses are optional when defining tuples but it's a good practice to include them for readability
+	The above optional feature of defining tuples is not useful when trying to use value of tuple in many other places like if a tuple is in a dictionary
+	In such a case, we would need to use () for accessing dictionary values corresponding to the tuple key

SET:
---
+	**A data type for mutable unordered collections of unique elements**
+	**One application of a set is to quickly remove duplicates from a list**
+	Example:
	```
		numbers = [1, 2, 6, 3, 1, 1, 6]
		unique_nums = set(numbers)
		print(unique_nums)
	```	
+	Output:
	```
		{1, 2, 3, 6}
	```

+	Sets support the IN, NOT IN operators as lists, tuples do
+	**We can add elements to sets using the add() method**
+	Remove elements using the pop() method, but pop() here does not take arguments
+   **Note:The same pop() method on a list object takes an OPTIONAL argument of the index position 
	but returns the last element in the list by default but not in sets as sets are unordered**
+	When we pop an element from a set, a random element is removed
+	**Remember that sets, unlike lists, are unordered so there is no last element**
+	Other operations you can perform with sets include those of mathematical sets
+	Methods like union, intersection, and difference are easy to perform with sets, 
	and are much faster than such operators with other containers
  
DICTIONARY:
----------
+	**A dictionary is a mutable, unordered data structure that contains mappings of keys 
	to values. Because these keys are used to index values, they must be unique and 
	immutable. For example, a string or tuple can be used as the key of a dictionary, 
	but if you try to use a list as a key of a dictionary, you will get an error.**
+	**A data type for mutable objects thats store mappings of unique keys to values**
+ 	Dictionary stores pairs of elements : keys and values
+ 	**The keys in a dictionary can be of any immutable type**
+ 	**It is not necessary for every key to be of same type**
+ 	**We can look up values or insert new values in the dictionary 
	using [] that enclose the key**
+ 	**Dictionaries are not sortable as they are not ordered**
+   Example:
	```
		elements = {'Helium':2, 'Oxygen':2, 'Neon':1}
		print(elements)
		print(elements["Helium"])  # print the value mapped to "Helium"
		elements["Lithium"] = 3  # insert "Lithium" with a value of 3 into the dictionary
		print(elements)
	```	
+	Output:
	```
		{'Helium': 2, 'Oxygen': 2, 'Neon': 1}
		2
		{'Helium': 2, 'Oxygen': 2, 'Neon': 1, 'Lithium': 3}
	```	
+	We can check *whether a key is in a dictionary* the same way we check whether a 
	value is in a list or set with the IN keyword 
+	**Note : We cannot check whether a value is in a dictionary. It will always return False.**
+	**Dicts have a related method that's also useful - get()**
	+	**get() looks up for a key in a dictionary, but unlike square brackets**
	+	**get() returns None (or a default value of your choice) if the key isn't found**
	+	**get() performs only single key look up**
	+	Example:
		```
			elements = {'Helium':2, 'Oxygen':2, 'Neon':1, "Carbon":4}
			print("Carbon" in elements)
			print(elements.get("Dilithium"))
		```
	+	Output:
		```
			True # Carbon is in the dictionary, so True is printed 
			None # Dilithium isn’t in our dictionary so None is returned by get() and printed
		```	
    +	**If you expect lookups to sometimes fail, get() might be a better tool than normal 
		square bracket lookups because errors(KeyError in case of key not found in a dictionary) can crash your program**
  
IDENTITY OPERATORS  VS COMPARISON OPERATORS:
------------------------------------------- 

*	IDENTITY OPERATORS
	```
	Keyword				Operator

	is  				evaluates if both sides have different identities
	is not				evaluates if both sides have different identities
	
	```
*	You can check if a key returned None with the IS operator
*	You can check for the opposite using IS NOT
*	Example:
	```
		elements = {'Helium':2, 'Oxygen':2, 'Neon':1, "Carbon":4}
		n = elements.get("Dilithium")
		print(n is None)
		print(n is not None)
	```
*	Output:
	```
		True
		False  
	```

*	Example:
	```
		a = [1, 2, 3]
		b = a
		c = [1, 2, 3]
		print(a == b) 
		print(a is b) 
		print(a == c) 
		print(a is c) 
	```
*	Output:
	```	
		True
		True
		True
		False
	```
*	Interpretations:
	*	List a and list b are equal and identical
	*	List c is equal(but not identical as identity also means same reference location in the memory) to a (and b for that matter) since they have the same contents 
	*	But a and c (and b for that matter, again) point to two different objects
	*   (a,c) doesn't contain identical objects in the tuple. Likewise for (b,c)
	*	That is the difference between checking for equality vs. identity

*	**Note:	A set is defined with curly braces, {}, but it isn't the only data structure 
			that does; dictionaries do as well! However, the difference is that a set is 
			defined as a sequence of elements separated by commas:**
	*	Example:
	
			```
				set_example = {element1, element2, element3}
			```

	*	**while a dictionary is defined as a sequence of key, value pairs marked with 
			colons, separated by commas:**
	* 	Example:
	
			```
				dict_example = {key1: value1, key2: value2, key3: value3}.
			```

+	**Note: If you define a variable with an empty set of curly braces like the below**

			```
				a = {} 
			```	

	**Python will assign an empty dictionary to that variable**
+	**It's better to use set() and dict() to define empty sets and dictionaries as well**

*	**invalid dictionary - this should break**
*	Example:
	```
		room_numbers = {
		['Freddie', 'Jen']: 403,
		['Ned', 'Keith']: 391,
		['Kristin', 'Jazzmyne']: 411,
		['Eugene', 'Zach']: 395
		}
		print(room_numbers)
	```	
*	Outcome:
	```
	TypeError: unhashable type: 'list'
	```


The error you saw was TypeError: unhashable type: 'list'. In Python, any immutable 
object (such as an integer, boolean, string, tuple) is hashable, meaning its value 
does not change during its lifetime. This allows Python to create a unique hash 
value to identify it, which can be used by dictionaries to track unique keys 
and sets to track unique values. This is why Python requires us to use immutable 
datatypes for the keys in a dictionary.

The lists used in the code above are NOT immutable, and thus cannot be hashed 
and used as dictionary keys. Can you try modifying the datatype of the keys in 
the dictionary above to make the code run without errors? Hint: What other data 
structure can you use to store a sequence of values and is immutable?

# Correction for above code
# Must use () in defining tuple as keys for the dict in here 
room_numbers = {
    ('Freddie', 'Jen'): 403,
    ('Ned', 'Keith'): 391,
    ('Kristin', 'Jazzmyne'): 411,
    ('Eugene', 'Zach'): 395
}

COMPOUND DATA STRUCTURES:
------------------------
We can include containers in other containers to create compound data structures. 
For example, this dictionary maps keys to values that are also dictionaries!

elements = {"hydrogen": {"number": 1,
                         "weight": 1.00794,
                         "symbol": "H"},
              "helium": {"number": 2,
                         "weight": 4.002602,
                         "symbol": "He"}}
						 
We can access elements in this nested dictionary like this.

helium = elements["helium"]  # get the helium dictionary
hydrogen_weight = elements["hydrogen"]["weight"]  # get hydrogen's weight						 

You can also add a new key to the element dictionary.

oxygen = {"number":8,"weight":15.999,"symbol":"O"}  # create a new oxygen dictionary 
elements["oxygen"] = oxygen  # assign 'oxygen' as a key to the elements dictionary
print('elements = ', elements)

Output is:

elements =  {"hydrogen": {"number": 1,
                          "weight": 1.00794,
                          "symbol": 'H'},
               "helium": {"number": 2,
                          "weight": 4.002602,
                          "symbol": "He"}, 
               "oxygen": {"number": 8, 
                          "weight": 15.999, 
                          "symbol": "O"}}
						  
Data Structure	Ordered		Mutable		Constructor			Example
List			Yes			Yes			[ ] or list()		[5.7, 4, 'yes', 5.7]
Tuple			Yes			No			( ) or tuple()		(5.7, 4, 'yes', 5.7)
Set				No			Yes			{}* or set()		{5.7, 4, 'yes'}
Dictionary		No			No**		{ } or dict()		{'Jun': 75, 'Jul': 89}

* You can use curly braces to define a set like this: {1, 2, 3}. 
  However, if you leave the curly braces empty like this: {} Python will instead 
  create an empty dictionary. So to create an empty set, use set().

** A dictionary itself is mutable, but each of its individual keys must be 
  immutable.
  
CONTROL FLOW: Control flow is the sequence in which code is run
------------  
+ Conditional Statements - if, elif, else
+ Boolean Expressions
+ For and While Loops  
+ Break and Continue - to break out of or continue loop execution
+ Zip and Enumerate - built in functions
+ List Comprehensions

+ If Statement
An if statement is a conditional statement that runs or skips 
code based on whether a condition is true or false.

if phone_balance < 5:
    phone_balance += 10
    bank_balance -= 10

+ If, Elif, Else

In addition to the if clause, there are two other optional clauses 
often used with an if statement.

if season == 'spring':
    print('plant the garden!')
elif season == 'summer':
    print('water the garden!')
elif season == 'fall':
    print('harvest the garden!')
elif season == 'winter':
    print('stay indoors!')
else:
    print('unrecognized season')

Pointers to keep in mind while writing boolean expressions for if statements:

1. Don't use True or False as conditions
# Bad example
if True:
    print("This indented code will always get run.")
	
2. Be careful writing expressions that use logical operators
Logical operators and, or and not have specific meanings that aren't quite the 
same as their meanings in plain English. Make sure your boolean expressions are 
being evaluated the way you expect them to.

# Bad example
if weather == "snow" or "rain":
    print("Wear boots!")
This code is valid in Python, but it is not a boolean expression, although it 
reads like one. The reason is that the expression to the right of the or operator,
 "rain", is not a boolean expression 
 
3. Don't compare a boolean variable with == True or == False
This comparison isn’t necessary, since the boolean variable itself is a 
boolean expression.

# Bad example
if is_cold == True:
    print("The weather is cold!")

This is a valid condition, but we can make the code more readable by using 
the variable itself as the condition instead, as below.

# Good example
if is_cold:
    print("The weather is cold!")	
	
4. If you want to check whether a boolean is False, you can use the NOT operator	

Truth Value Testing
If we use a non-boolean object as a condition in an if statement in place of 
the boolean expression, Python will check for its truth value and use that to 
decide whether or not to run the indented code. By default, the truth value of 
an object in Python is considered True unless specified as False in the 
documentation.

5. Constants that are defined to be false:

   None and False
   Zero of any numeric type : 0, 0.0, 0j, decimal(0), fraction(0,1)
   Empty sequences and collections : '"", {},(),[], set(0), range(0)

Loops: FOR, WHILE
-----------------	  
+ A FOR loop is used to "iterate", or do something repeatedly, over an iterable
  
  Example : 
  
  cities = ['new york city', 'mountain view', 'chicago', 'los angeles']
  for city in cities:
      print(city)
  print("Done!")
  
+ An ITERABLE is an object that can return one of its elements at a time. 
  This can include sequence types, such as strings, lists, and tuples, as 
  well as non-sequence types, such as dictionaries and files

+ Using the range() Function with for Loops
  
  range() is a built-in function used to create an iterable sequence of numbers.
  
  You will frequently use range() with a for loop to repeat an action a certain 
  number of times. Any variable can be used to iterate through the numbers, but 
  Python programmers conventionally use i  
  
  range(start=0, stop, step=1)
  
  The range() function takes three integer arguments, the first and third of which 
  are optional:

  The 'start' argument is the first number of the sequence. If unspecified, 
  'start' defaults to 0.
  The 'stop' argument is 1 more than the last number of the sequence. 
  This argument must be specified. range(4) returns 0, 1, 2, 3
  The 'step' argument is the difference between each number in the sequence. 
  If unspecified, 'step' defaults to 1.

+ Notes on using range():

  If you specify one integer inside the parentheses with range(), it's used as 
  the value for 'stop,' and the defaults are used for the other two.
  e.g. - range(4) returns 0, 1, 2, 3
  
  If you specify two integers inside the parentheses with range(), they're used 
  for 'start' and 'stop' and the default is used for 'step'
  e.g. - range(2, 6) returns 2, 3, 4, 5
  
  Or we can specify all three integers for 'start', 'stop', and 'step'
  e.g. - range(1, 10, 2) returns 1, 3, 5, 7, 9  

+ For loop 
names = ["Joey Tribbiani", "Monica Geller", "Chandler Bing", "Phoebe Buffay"]

for name in names:
    name = name.lower().replace(" ", "_")

print(names)

'''
The printed output for the names list will look exactly like it did in the first 
line. During each iteration, the name variable is set to a string taken from the 
list. Then the assignment statement creates a new string (name.lower().replace(" ", "_")) 
and changes the name variable to that string. It doesn't modify the contents of the 
names list at all. To modify the list you must operate on the list itself, using 
range, as you saw earlier.
'''

+ Iterating Through Dictionaries with FOR Loops

When you iterate through a dictionary using a for loop, doing it the normal 
way (for n in some_dict) will only give you access to the keys in the dictionary

If you wish to iterate through both keys and values, 
you can use the built-in method items() like this:

cast = {
           "Jerry Seinfeld": "Jerry Seinfeld",
           "Julia Louis-Dreyfus": "Elaine Benes",
           "Jason Alexander": "George Costanza",
           "Michael Richards": "Cosmo Kramer"
       }

for key, value in cast.items():
    print("Actor: {}    Role: {}".format(key, value))

+ WHILE Loop:
  FOR loops are an example of "definite iteration" meaning that the loop's body is 
  run a predefined number of times. This differs from "indefinite iteration" which 
  is when a loop repeats an unknown number of times and ends when some condition is 
  met, which is what happens in a while loop.
  
  EXAMPLE:
  
  card_deck = [4, 11, 8, 5, 13, 2, 8, 10]
  hand = []

  # adds the last element of the card_deck list to the hand list
  # until the values in hand add up to 17 or more
	while sum(hand)  < 17:
		hand.append(card_deck.pop())	
+ sum() returns the sum of the elements in a list, and pop() is a list method that 
  removes the last element from a list and returns it
  
FOR Loop Vs WHILE Loop:

+ FOR loops are ideal when the number of iterations is known or finite
  
  Examples:
  
  Case I
  ------
  When you have an iterable collection (list, string, set, tuple, dictionary)
  
  for name in names:
  
  Case II
  -------
  When you want to iterate through a loop for a definite number of times, using range()
  
  for i in range(5):

+ WHILE loops are ideal when the iterations need to continue until a condition is met
  
  Examples:
  
  Case I
  ------
  When you want to use comparison operators
  
  while count <= 100:
  
  Case II
  -------
  When you want to loop based on receiving specific user input
  
  while user_input == 'y':  

BREAK VS CONTINUE:
-----------------
+ A loop will terminate immediately if it encounters a BREAK statement
+ Sometimes, rather than breaking out of the loop, there are times,
  simply when we want to skip only one iteration of the loop
+ CONTINUE statement terminates ONE ITERATION of a loop

ZIP and ENUMERATE:
-----------------
+ Zip returns an iterator that combines multiple iterables
  into one sequence of tuples. Each tuple contains the elements
  in that position from all the iterables.
  
  Example:
  
  items = ['bananas','mattresses','dog kernels','machine','cheeses']
  weights = [15, 34, 42, 120, 5]
  
  print(list(zip(items, weights)))
  manifest = list(zip(items, weights))
  
  for item, weight in manifest:
    print(f"{item} : {weight}")
	
  items = ['bananas','mattresses','dog kernels','machine','cheeses']
  weights = [15, 34, 42, 120, 5]

#zip returns an iterator
	print("Zipped List")
	print()
	print(list(zip(items, weights)))
	print("-----------------------")
	print()
	manifest = list(zip(items, weights))
	
	print("Manifest contents")
	print()
	for item, weight in manifest:
		print(item, weight)
	print("-----------------------")
	print()
	
	print("Unzipping zipped list")
	print()
	for cargo in zip(items, weights):
		print(cargo[0], cargo[1])
	print("-----------------------")
	print()
	
	print("Unzipping zipped list using an alternate method")
	print()
	for item, weight in zip(items, weights):
		print(item, weight)
	print("-----------------------")
	print()
	
	print("Printing unzipped list")
	print()
	for index, item in enumerate(items):
		print(f"{index} : {item}")    
	print("-----------------------")
	print() 	
  
+ zip and enumerate are useful built-in functions that can come in 
  handy when dealing with loops
  
+ Zip
  
  zip returns an iterator that combines multiple iterables into one 
  sequence of tuples. Each tuple contains the elements in that position 
  from all the iterables. For example, printing

  list(zip(['a', 'b', 'c'], [1, 2, 3])) 
  would output 
  [('a', 1), ('b', 2), ('c', 3)]

+ In addition to zipping two lists together, you can also unzip a list 
  into tuples using an asterisk.

  Example:
  
  some_list = [('a', 1), ('b', 2), ('c', 3)]
  letters, nums = zip(*some_list)   

+ ENUMERATE :
  
  enumerate is a built in function that returns an iterator of tuples 
  containing indices and values of a list. 
  
  Usage : When we want the index along with each element 
          of an iterable in a loop.

+ LIST COMPREHENSIONS

  In Python, you can create lists really quickly and concisely with 
  list comprehensions. 
  
  Example:
  
  capitalized_cities = []
  for city in cities:
      capitalized_cities.append(city.title())

  can be reduced to:

  capitalized_cities = [city.title() for city in cities]		  
  
+ List comprehensions allow us to create a list using a for 
  loop in one step.

+ Create a list comprehension with brackets [], 
  including an expression to evaluate for each element in an iterable. 
  This list comprehension above calls city.title() for each element 
  city in cities, to create each element in the new list, 
  capitalized_cities.
  
+ Conditionals in List Comprehensions
  
  You can also add conditionals to list comprehensions (listcomps). 
  After the iterable, you can use the if keyword to check a condition 
  in each iteration.

  squares = [x**2 for x in range(9) if x % 2 == 0]
  
  The code above sets squares equal to the list [0, 4, 16, 36, 64], 
  as x to the power of 2 is only evaluated if x is even. If you want 
  to add an else, you will get a syntax error doing this.
  squares = [x**2 for x in range(9) if x % 2 == 0 else x + 3]
  
  If you would like to add else, you have to move the conditionals 
  to the beginning of the listcomp, right after the expression, 
  like this.

  squares = [x**2 if x % 2 == 0 else x + 3 for x in range(9)]
  
  List comprehensions are not found in other languages, but are very 
  common in Python.
  
FUNCTIONS:
---------
+ Functions are useful chunks of code that help us encapulate a task
+ Encapsulation is a way to carry out a whole series of steps with one
  simple command
+ In programming, functions encapsulate all the steps of a process
  into one command
+ Functions are also used to organize and optimize the code
+ Functions provide code reusability
+ None is the default return of a function in case it doesn't 
  explicitly return anything else
+ Print provides output to the console whereas return provides
  a value that can be stored and worked with and coded later 
+ Not every function must return, it can still be a valid function
+ We can add default arguments in a function to have default values 
  for parameters that are unspecified in a function call.
  Example:
  -------
  def cylinder_volume(height, radius=5):
    pi = 3.14159
    return height * pi * radius ** 2  

+ Passing values to arguments by position vs by name
  
  cylinder_volume(10,7) # pass by position
  cylinder_volume(height = 10, radius = 7) # pass by name
  cylinder_volume(radius = 7,height = 10) # pass by name

VARIABLE SCOPE:
--------------

+ Scope refers to which parts of a program a variable 
  can be referenced or used from

+ If a variable is created inside a function, then it can only
  be used within that function - case of LOCAL scope

+ Scope is essential to understanding how information is passed
  throughout programs

+ Variables defined outside functions in a program has GLOBAL scope  

+ Generally speaking, the value of a global variable can not or rather 
  must not be modified inside the function. If we want to modify that 
  variable's value inside this function, it should be passed in as an 
  argument.
  
+ GOOD PRACTICE: It is best to define variables in the smallest scope 
  they will be needed in. While functions can refer to variables defined 
  in a larger scope, this is very rarely a good idea since you may not 
  know what variables you have defined if your program has a lot of 
  variables.  

+ Scoping example: 
  
  egg_count = 0
  def buy_eggs():
      egg_count += 12 # purchase a dozen eggs
	  
  buy_eggs()

'''
This code causes an UnboundLocalError, because the variable egg_count in the first line has global scope. 
Note that it is not passed as an argument into the function, so the function assumes the egg_count being referred 
to is the global variable.

Within a function, we can print a global variable's value successfully without an error. 
This works because we are simply accessing the value of the variable. If we try to change or reassign this global variable, 
however, as we do in this code, we get an error. Python doesn't allow functions to modify variables that aren't in the 
function's scope.
'''	

DOCSTRINGS or Documentation Strings:
-----------------------------------
+ Docstring is a type of comment used to explain the purpose of 
  a function and how it should be used

+ Docstrings are surrounded by:
  """
  Text
  """

  '''
  Text
  '''

+ Docstrings are part of good coding practice

LAMBDA EXPRESSIONS:
------------------
+ We can use lamda expressions to create anonymous functions
+ Anonymous functions are functions that don't have a name
+ Really useful for creating quick functions that are not required
  later or elsewhere in the code
+ This can be especially useful for higher order functions, or functions 
  that take in other functions as arguments

+ With a lambda expression, this function:

	def multiply(x, y):
		return x * y
	
	can be reduced to:

	multiply = lambda x, y: x * y  
	
+ Components of a Lambda Function
  ------------------------------- 
  
* The lambda keyword is used to indicate that this is a lambda expression
* Following lambda are one or more arguments for the anonymous function 
  separated by commas, followed by a colon : 
* Similar to functions, the way the arguments are named in a lambda 
  expression is arbitrary
* Last is an expression that is evaluated and returned in this function. 
* This is a lot like an expression you might see as a return statement 
  in a function 
* With this structure, lambda expressions aren’t ideal 
  for complex functions, but can be very useful for short, simple 
  functions.	

MAP() and FILTER()
----------------

* map() is a higher-order, built-in function that takes a function and 
  iterable as inputs, and returns an iterator that applies the function 
  to each element of the iterable
  
* filter() is a higher-order built-in function that takes a function and 
  iterable as inputs and returns an iterator with the elements from the 
  iterable for which the function returns True   
  
SCRIPTING
---------

+ Interacting with User Input using input() and eval()
  
  Scripting With Raw Input using input() and eval()
  
  We can get raw input from the user with the built-in function 
  input(), which takes in an optional string argument that you 
  can use to specify a message to show to the user when asking 
  for input.
  
  Example :
  
  name = input("Enter your name: ")
  print("Hello there, {}!".format(name.title()))
  
  The input function takes in whatever the user types and stores it as 
  a string. 
  
  If you want to interpret their input as something other than 
  a string, like an integer, as in the example below, you need to wrap 
  the result with the new type to convert it from a string.

  num = int(input("Enter an integer"))
  print("hello" * num)
  
  We can also interpret user input as a Python expression using the 
  built-in function eval(). This function evaluates a string as a 
  line of Python.
  
  result = eval(input("Enter an expression: "))
  print(result)
  
  

+ If the user inputs 2 * 3, this outputs 6


+ Errors and Exceptions 
  
  SYNTAX ERRORS occur when Python can’t interpret our code, since we 
  didn’t follow the correct syntax for Python. These are errors you’re 
  likely to get when you make a typo, or you’re first starting to learn 
  Python.
  
  Example : 
  
  msg = 'Welcome to this program!
  print(msg)
  
  Output :
  
  SyntaxError: EOL while scanning string literal 
    
  EXCEPTIONS occur when unexpected things happen during execution of a 
  program, even if the code is syntactically correct. There are 
  different types of built-in exceptions in Python, and you can see 
  which exception is thrown in the error message.
  
  Example : ValueError
  
  x = int(input("Enter a number: "))
  x += 20
  print(x)
  
  Program Run:
  
  Enter a number: ten
  ValueError: invalid literal for int() with base 10: 'ten'
  
  Note: Although our code is syntactically correct, but we ran 
        into an exception because a string spelling out
		ten is not a valid argument for the int function.

  Example : NameError 		
  
  print(non_existent_variable)
  
  Program Run:
  
  NameError: name 'non_existent_variable' is not defined
  
+ Common Exceptions and their Descriptions:

  Built-In exception                   Description
  
  ValueError						   An object of the correct
									   type but inappropriate value
									   is passed as an input
									   to a built-in operation
									   or function.
									   
  AssertionError					   An asset statement fails.

  IndexError						   A sequence substring is 
                                       out of range.
									   
  KeyError							   A key cannot be found 
                                       in dictionary.
									   
  TypeError							   An object of an unsupported 
									   type is passed as input to an
									   operation or function.
									   
									   
+ Handling Exceptions
  
  TRY-EXCEPT-FINALLY blocks to handle exceptions
  
  Try Statement
  
  * We can use try statements to handle exceptions 
    
	There are four clauses you can use:

    try: This is the only mandatory clause in a try statement. 
	     The code in this block is the first thing that Python 
		 runs in a try statement.
    
	except: If Python runs into an exception while running the 
	        try block, it will jump to the except block that 
			handles that exception.
    
	Specifying Exceptions
    
	We can actually specify which error we want to handle in an 
	except block like this:
	
	try:
		# some code
	except ValueError:
		# some code

	Now, it catches the ValueError exception, but not other exceptions. 
	If we want this handler to address more than one type of exception, 
	we can include a parenthesized tuple after the except with the 
	exceptions.
	
	try:
		# some code
	except (ValueError, KeyboardInterrupt):
		# some code
		
    Or, if we want to execute different blocks of code depending on 
	the exception, we can have multiple except blocks
	
	try:
		# some code
	except ValueError:
		# some code
	except KeyboardInterrupt:
		# some code
		
    		

	
	else: If Python runs into no exceptions while running the 
	      try block, it will run the code in this block after 
		  running the try block.
    
	finally: Before Python leaves this try statement, it will 
	         run the code in this finally block under any 
			 conditions, even if it's ending the program. 
			 E.g., if Python ran into an error while running code 
			 in the except or else block, this finally block will 
			 still be executed before stopping the program.
			 
			 finally block is useful for cleaning up actions
			 in our code.
			 
			 Use case: Use this finally block to close the file
			           after attempting opening it and performing 
					   operations/tasks on the opened file in try block
					   
	try:
		run_code1()
	except TypeError:
		run_code2()
		return None # The finally block is run before the method returns
	finally:
		other_code()
	
	Compare to this:
	
	try:
		run_code1()
	except TypeError:
		run_code2()
		return None   
	
	other_code()  # This doesn't get run if there's an exception.
	Other situations that can cause differences:
	
	If an exception is thrown inside the except block.
	If an exception is thrown in run_code1() but it's not a TypeError.
	Other control flow statements such as continue and break statements.		 
	
	
	https://stackoverflow.com/questions/11551996/why-do-we-need-the-finally-clause-in-python
			 
+ Accessing Error Messages
  ------------------------
  When we handle an exception, we can still access its error 
  message like this:
  
  try:
	# some code
  except ZeroDivisionError as e:
	# some code
	print("ZeroDivisionError occurred: {}".format(e))
	# This would print something like this:

  ZeroDivisionError occurred: integer division or modulo by zero
  So we can still access error messages, even if we handle them 
  to keep our program from crashing!
  
  If we don't know a specific error we're handling, we can still 
  access the message like this:
  
  try:
    # some code
  except Exception as e:
	# some code
    print("Exception occurred: {}".format(e))
  
  Exception is just the base class for all built-in exceptions. 
  
  We can learn more about Python's exceptions at the below link:
  https://docs.python.org/3/library/exceptions.html#bltin-exceptions
  
+ Reading and Writing Files
  -------------------------
  
  Reading a File
	
	f = open('my_path/my_file.txt', 'r')
	file_data = f.read()
	f.close()
  
  1. First open the file using the built-in function, open(). 
     This requires a string that shows the path to the file. 
	 The open() function returns a file object, which is a 
	 Python object through which Python interacts with the file 
	 itself. Here, we assign this object to the variable f.
  2. There are optional parameters you can specify in the open() 
     function. One is the mode in which we open() the file. 
	 Here, we use r or read only. This is actually the default 
	 value for the mode argument.
  3. Use the read() method to access the contents from the file object. 
     This read method takes the text contained in a file and puts it 
	 into a string. Here, we assign the string returned from this method
	 into the variable file_data.
  4. When finished with the file, use the close() method to free up 
     any system resources taken up by the file.

  Writing to a File
	
	f = open('my_path/my_file.txt', 'w')
	f.write("Hello there!")
	f.close()
	
 1. Open the file in writing ('w') mode. If the file does not exist, 
    Python will create it for you. 
	
	If you open an existing file in writing mode, any content that 
	it had contained previously will be deleted. 
	
	If you're interested in adding to an existing file, without deleting
	its content, you should use the append ('a') mode instead of write.
	
 2. Use the write method to add text to the file.
 3. Close the file when finished.
 
 With keyword:
 
 Python provides a special syntax that auto-closes a file for you 
 once you're finished using it.

	with open('my_path/my_file.txt', 'r') as f:
		file_data = f.read()

 This with keyword allows you to open a file, do operations on it, 
 and automatically close it after the indented code is executed, 
 in this case, reading from the file. Now, we don’t have to call 
 f.close()! You can only access the file object, f, within this 
 indented block.
 
https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files 

+ Importing Local, Standard, and Third-Party Modules

Importing Local Scripts
-----------------------
	
	We can actually import Python code from other scripts, 
	which is helpful if you are working on a bigger project 
	where you want to organize your code into multiple files 
	and reuse code in those files. 
	
	If the Python script you want to import is in the same 
	directory as your current script, you just type import 
	followed by the name of the file, without the .py extension.
	
		import useful_functions
	
	It's the standard convention for import statements to be 
	written at the top of a Python script, each one on a separate 
	line. 
	
	This import statement creates a module object called 
	useful_functions. 
	
	Modules are just Python files that contain 
	definitions and statements. 
	
	To access objects from an imported 
	module, you need to use dot notation.
	
		import useful_functions
		useful_functions.add_five([1, 2, 3, 4])
	
	We can add an alias to an imported module to reference it 
	with a different name.

		import useful_functions as uf
		uf.add_five([1, 2, 3, 4])
	
	Using a main block
    
	To avoid running executable statements in a script when it's 
	imported as a module in another script, include these lines 
	in an if __name__ == "__main__" block. 
	
	Or alternatively, include them in a function called main() 
	and call this in the if main block.

    Whenever we run a script like this, Python actually sets a 
	special built-in variable called __name__ for any module. 
	
	When we run a script, Python recognizes this module as the 
	main program, and sets the __name__ variable for this module 
	to the string "__main__". For any modules that are imported 
	in this script, this built-in __name__ variable is just set 
	to the name of that module. Therefore, the condition 
	if __name__ == "__main__"is just checking whether this module 
	is the main program.

https://pymotw.com/3/ - PYTHON MODULE OF THE WEEK

Which module can read data from a comma separated values (.csv) file into 
Python dictionaries for each row?

csv

Which module can tell you the current time and date?

datetime

Which module has a method for changing the current working directory?

os.path

Which module can help extract all of the files from a zip file?

zipfile

Which module can say how long your code took to run?

timeit for short pieces of code  
------

cProfile or profile for bigger jobs
--------    -------

The Python Standard Library has a lot of modules! To help you get 
familiar with what's available, here are a selection of our favourite 
Python Standard Library modules and why we use them!

csv: very convenient for reading and writing csv files

collections: useful extensions of the usual data types 
             including OrderedDict, defaultdict and namedtuple

random: generates pseudo-random numbers, shuffles sequences randomly 
        and chooses random items
		
string: more functions on strings. This module also contains useful 
        collections of letters like string.digits (a string containing 
		all characters which are valid digits).

re: pattern-matching in strings via regular expressions

math: some standard mathematical functions

os: interacting with operating systems

os.path: submodule of os for manipulating path names

sys: work directly with the Python interpreter

json: good for reading and writing json files (good for web work)

We hope you find these useful!

TECHNIQUES FOR IMPORTING MODULES:
--------------------------------
	
	There are other variants of import statements that 
	are useful in different situations.

		1. To import an individual function or class from a module:

			from module_name import object_name
		
		2. To import multiple individual objects from a module:
		
			from module_name import first_object, second_object
		
		3. To rename a module:

			import module_name as new_name
			
		4. To import an object from a module and rename it:

			from module_name import object_name as new_name

		5. To import every object individually from a module 
		   (DO NOT DO THIS): It causes lot of confusion about which
		   names and functions were defined in which module and can lead
		   to conflicts and shocking override of names and functions
		   
			from module_name import *

        6. If you really want to use all of the objects from a module, 
		   use the standard import module_name statement instead and 
		   access each of the objects with the dot notation.
		   
		   import module_name

MODULES, PACKAGES, AND NAMES:
----------------------------
		
		1. In order to manage the code better, modules in the Python 
		   Standard Library are split down into sub-modules that are 
		   contained within a package. 
		   
		2. A package is simply a module that contains sub-modules. 
		
		3. A sub-module is specified with the usual dot notation.

		4. Modules that are submodules are specified by the 
		   package name and then the submodule name separated 
		   by a dot. You can import the submodule like this.

		   import package_name.submodule_name
		   

THIRD PARTY LIBRARIES:
---------------------		   

		1. Can be installed using package managers like pip, anaconda
		2. pip is the standard package manager for python
		3. Anaconda is designed specifically for data science
		4. pip install package_name
		5. conda install package_name
		6. Using a requirements.txt file
		7. Larger Python programs might depend on dozens of 
		   third party packages. To make it easier to share 
		   these programs, programmers often list a project's 
		   dependencies in a file called requirements.txt. 
		   This is an example of a requirements.txt file.

			beautifulsoup4==4.5.1
			bs4==0.0.1
			pytz==2016.7
			requests==2.11.1

		   Each line of the file includes the name of a package 
		   and its version number. The version number is optional, 
		   but it usually should be included. 
		   
		   Libraries can change subtly, or dramatically, 
		   between versions, so it's important to use the 
		   same library versions that the program's author 
		   used when they wrote the program.

LIBRARY :  USAGE		   
-------    -----

IPython :  A better interactive Python interpreter

requests : Provides easy to use methods to make web requests 
           Useful for accessing web APIs

Flask :    a lightweight framework for making web 
           applications and APIs
		   
Django :   A more featureful framework for making web applications. 
           Django is particularly good for designing complex, 
		   content heavy, web applications.

Beautiful Soup : Used to parse HTML and extract information from it. 
				 Great for web scraping.
				 
pytest : extends Python's builtin assertions and unittest module.

PyYAML : For reading and writing YAML files.

NumPy : The fundamental package for scientific computing with Python. 
        It contains among other things a powerful N-dimensional array 
		object and useful linear algebra capabilities.

pandas : A library containing high-performance, data structures and 
         data analysis tools. In particular, pandas provides dataframes!

matplotlib : a 2D plotting library which produces publication quality 
             figures in a variety of hardcopy formats and interactive 
			 environments.
ggplot : Another 2D plotting library, based on R's ggplot2 library.

Pillow : The Python Imaging Library adds image processing capabilities 
         to your Python interpreter.

pyglet : A cross-platform application framework intended for game 
         development.
Pygame : A set of Python modules designed for writing games.

pytz : World Timezone Definitions for Python

You can use pip to install all of a project's dependencies at once by 
typing pip install -r requirements.txt in your command line.


+ Experimenting with an Interpreter

IPython

There is actually an awesome alternative to the default Python 
interactive interpreter. 

IPython, which comes with many additional features.

* tab completion
* ? for details about an object
* ! to execute system shell commands
* syntax highlighting!


+ Online Resources :
  ----------------
  
  How to Search

  Here are some techniques for effective web searching:

  Try using "Python" or the name of the library you're using as the 
  first word of your query. This tells the search engine to prioritize 
  results that are explicitly related to the tools you're using.
  
  Writing a good search query can take multiple attempts. If you 
  don't find helpful results on your first attempt, try again.

  Try using keywords found on the pages you found in your initial 
  search to direct the search engine to better resources in the 
  subsequent search.

  Copy and paste error messages to use as search terms. This will lead 
  you to explanations of the error and potential causes. An error 
  message might include references to specific line numbers of code 
  that you wrote. Only include the part of the error message that 
  comes before this in your search.

  If you can't find an answer to your question, ask it yourself! 
  Communities like StackOverflow have etiquette rules you must 
  learn if you want to participate, but don't let this stop you 
  from using these resources.  
  
+ Hierarchy of Online Resources

While there are many online resources about programming, not all of 
the them are created equal. This list of resources is in approximate 
order of reliability.

1.	The Python Tutorial 
	(https://docs.python.org/3/tutorial/)
	
	This section of the official documentation surveys Python's syntax 
	and standard library. It uses examples, and is written using less 
	technical language than the main documentation. Make sure you're 
	reading the Python 3 version of the docs!

2.  The Python Language and Library References
    (https://docs.python.org/3/index.html)
	
	The Language Reference and Library Reference are more technical 
	than the tutorial, but they are the definitive sources of truth. 
	As you become increasingly acquainted with Python you should use 
	these resources more and more.

3.  Third-Party Library Documentation
    
	Third-party libraries publish their documentation on their own 
	websites, and often times at https://readthedocs.org/. You can 
	judge the quality of a third-party library by the quality of its 
	documentation. If the developers haven't found time to write good 
	docs, they probably haven't found the time to polish their library 
	either.

4.	The websites and blogs of prominent experts 
    
	The previous resources are primary sources, meaning that they are 
	documentation from the same people who wrote the code being 
	documented. Primary sources are the most reliable. Secondary 
	sources are also extremely valuable. The difficulty with secondary 
	sources is determining the credibility of the source. The websites 
	of authors like Doug Hellmann (https://doughellmann.com//) and 
	developers like Eli Bendersky (https://eli.thegreenplace.net/) are 
	excellent. The blog of an unknown author might be excellent, 
	or it might be rubbish.  
	
5.  StackOverflow (https://stackoverflow.com/)

	This question and answer site has a good amount of traffic, so 
	it's likely that someone has asked (and someone has answered) 
	a related question before! However, answers are provided by 
	volunteers and vary in quality. Always understand solutions 
	before putting them into your program. One line answers without 
	any explanation are dubious. This is a good place to find out 
	more about your question or discover alternative search terms.	

+   ITERATORS AND GENERATORS (GENERATOR FUNCTIONS):

 1. Iterables are objects that can return one of their elements 
	at a time, such as a list.
	
 2. Many of the built-in functions we’ve used so far, like 'enumerate,' 
    return an iterator.	

 3. An iterator is an object that represents a stream of data. This 
    is different from a list, which is also an iterable, but is not 
	an iterator because it is not a stream of data.

 4. Generators are a simple way to create iterators using functions. 
    
	Here is an example of a generator function called my_range(x), 
	which produces an iterator that is a stream of numbers from 0 
	to (x - 1).

	def my_range(x):
		i = 0
		while i < x:
			yield i
			i += 1
			
	Notice that instead of using the return keyword, it uses yield. 
	This allows the function to return values one at a time, and 
	start where it left off each time it’s called. This yield keyword 
	is what differentiates a generator from a typical function.

    Remember, since this returns an iterator, we can convert it to a 
	list or iterate through it in a loop to view its contents. For 
	example, this code:
	
	for x in my_range(5):
		print(x)
    
	outputs:

	0
	1
	2
	3
	4		
	
	Why Generators?
    You may be wondering why we'd use generators over lists. 
	
	Generators are a lazy way to build iterables. They are useful when 
	the fully realized list would not fit in memory, or when the cost 
	to calculate each list element is high and you want to do it as 
	late as possible. But they can only be iterated over once.
	
	If you have an iterable that is too large to fit in memory in full 
	(e.g., when dealing with large files), being able to take and use 
	chunks of it at a time can be very valuable.
	
 5.	You can also define iterators using classes, which you can read 
	more about at 
	(https://docs.python.org/3/tutorial/classes.html#iterators).
	
GENERATOR EXPRESSIONS:
---------------------

	Here's a cool concept that combines generators and list comprehensions!
	You can actually create a generator in the same way you'd normally write 
	a list comprehension, except with parentheses instead of square brackets. 
	
	For example:	
	
	# this produces a list of squares
	sq_list = [x**2 for x in range(10)]  

	# this produces an iterator of squares
	sq_iterator = (x**2 for x in range(10))  
	
	
	
    
	
	