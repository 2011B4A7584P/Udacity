with open('Mathematics.txt','w') as f:
    f.write('Welcome to the world of mathematics')
    f.write('\n')
    f.write('Let\'s do 2+2')
    f.write('\n')
    f.write('Bye!')
    f.close()

with open('Mathematics.txt','r') as f:
    file_content = f.read()
    print(file_content)
    f.close()

