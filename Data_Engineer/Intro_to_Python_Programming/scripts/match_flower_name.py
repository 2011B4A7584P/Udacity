'''
Question: 

Create a function that opens the flowers.txt, reads every line in it, 
and saves it as a dictionary. The main (separate) function should 
take user input (user's first name and last name) and parse the user 
input to identify the first letter of the first name. It should then 
use it to print the flower name with the same first letter 
(from dictionary created in the first function).
'''

# Write your code here

def get_flower_mappings(flower_file):
    flower_dict = dict()
    with open(flower_file,'r') as flowers:
        flower_list = flowers.readlines()
        for flower in flower_list:
            key, value = flower.strip().split(":")
            flower_dict[key] = value.strip()
    return flower_dict    
# HINT: create a dictionary from flowers.txt

# HINT: create a function to ask for user's first and last name
if __name__ == '__main__':
    print('\nPlease enter your first name followed \n')
    print('by a space and then your last name\n')
    user_name = input()
    first_name = user_name.split()[0]
    flower_dict = get_flower_mappings('flowers.txt')
    # print(flower_dict)
    print(flower_dict[first_name[0]])

# print the desired output

