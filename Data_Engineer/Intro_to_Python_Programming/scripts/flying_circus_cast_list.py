def create_cast_list(filename):
    cast_list = []
    #use with to open the file filename
    with open(filename,'r') as entire_cast:
        for actor_details in entire_cast:
            cast_list.append(actor_details.split(",")[0])
            
    #use the for loop syntax to process each line
    #and add the actor name to cast_list

    return cast_list

cast_list = create_cast_list('flying_circus_cast.txt')
for actor in cast_list:
    print(actor)
