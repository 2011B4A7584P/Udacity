import git

repo = git.Repo('/Learning/Udacity/Nanodegree/Udacity')

repo.git.add('--all')
repo.git.commit('-m', 'Added design patterns')
origin = repo.remote(name='origin')
origin.push()