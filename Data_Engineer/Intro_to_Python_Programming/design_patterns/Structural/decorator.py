import time

def compute_time(func):
    
    def wrap_time(*args, **kwargs):
        start_time = time.time()
        output = func(*args, **kwargs)
        end_time = time.time()
        print(str(end_time - start_time) + )
        print("Output\n")
        return output
    return wrap_time

@compute_time
def add_five(input_list):
    return [x+5 for x in input_list]
    
if __name__ == '__main__':
    print(add_five(list(range(1000))))