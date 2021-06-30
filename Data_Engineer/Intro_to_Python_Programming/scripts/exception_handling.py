#   Run the file on a case by case basis
#   Case 1:

def exception_handling_case_one():
    try:
        result = 1/0
        return result
    except ZeroDivisionError:
            print("Trying to divide by zero")
            return "returned from except"
    finally:
            print("Please edit the code")
            return "returned from *finally*"

result = exception_handling_case_one()            
print(result)

'''
#   Case 2:
def exception_handling_case_two():
    try:
        result = 1/0
        return result
    except ZeroDivisionError:
            print("Trying to divide by zero")
            return "returned from except"
    print("We are about to exit case two")
    
result = exception_handling_case_two()            
print(result)
'''

'''
#   Case 3:
def exception_handling_case_three():
    try:
        result = 1/0
        return result
    except ZeroDivisionError:
            print("Trying to divide by zero")
    
    print("We are exiting case three now!")
    
result = exception_handling_case_three()
print(result)
'''
'''
#   Case 4:
def exception_handling_case_four():
    try:
        result = 1/0
        return result
    except ZeroDivisionError:
            print("Trying to divide by zero")
            float("ashish") # exception inside except
    print("We are exiting case four now!")
    
result = exception_handling_case_four()
print(result)
'''
'''
#   Case 5:
def exception_handling_case_five():
    try:
        result = 1/5
    except ZeroDivisionError:
            print("Trying to divide by zero")
            float("ashish") # exception inside except
    else:
        print("We are exiting case five now!")
    
result = exception_handling_case_five()
print(result)
'''
'''
#   Case 6:
def exception_handling_case_six():
    try:
        result = 1/5
    except ZeroDivisionError:
            print("Trying to divide by zero")
            float("ashish") # exception inside except
    else:
        print("We are about to exit case six now!")
        float("ashish")
    
result = exception_handling_case_six()
print(result)
'''