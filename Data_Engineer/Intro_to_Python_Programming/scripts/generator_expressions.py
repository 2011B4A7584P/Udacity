# this produces a list of squares
sq_list = [x**2 for x in range(10)]  

# this produces an iterator of squares
sq_iterator = (x**2 for x in range(10))  

print('\nList of Squares : ', sq_list)
print()
for i in sq_list:
    print(i)

print('\nIterator of squares : ',sq_iterator)
print()
for i in sq_iterator:
    print(i)
