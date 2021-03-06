lessons = ["Why Python Programming", "Data Types and Operators", "Control Flow", "Functions", "Scripting"]

def my_enumerate(iterable, start=0):
    # Implement your generator function here
    index = 0
    while index < len(iterable):
        yield index+start, iterable[index]
        index += 1
    
for i, lesson in my_enumerate(lessons, 1):
    print("Lesson {}: {}".format(i, lesson))