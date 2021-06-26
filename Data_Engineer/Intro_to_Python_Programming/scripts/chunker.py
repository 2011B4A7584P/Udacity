def chunker(iterable, size):
    # Implement function here
    index = 0
    while index < len(iterable):
        yield iterable[index:index+size]
        index += size


for chunk in chunker(range(25), 4):
    print(list(chunk))