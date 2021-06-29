import git

repo = git.Repo('/Learning/Udacity/Nanodegree/Udacity')

repo.git.add('--all')
repo.git.commit('-m', 'Updated learning doc')
origin = repo.remote(name='origin')
origin.push()
