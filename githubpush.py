import os
from git import Repo

def update_and_push(repo_path, file_path, update_text, commit_message):
    # Change the current working directory to the Git repository
    os.chdir(repo_path)

    # Open the file, add content, and save changes
    with open(file_path, 'a') as file:
        file.write('\n' + update_text)

    # Commit changes
    repo = Repo(repo_path)
    repo.index.add([file_path])
    repo.index.commit(commit_message)

    # Push changes to the remote repository
    origin = repo.remote(name='origin')
    origin.push()

if __name__ == "__main__":
    # Replace these values with your actual paths and information
    repository_path = '/mnt/c/Users/DELL/Desktop/iac-ec2'
    file_to_update = 'test.txt'
    text_to_add = 'This is an automated update.'
    commit_message = 'Automated update to test.txt'

    update_and_push(repository_path, file_to_update, text_to_add, commit_message)

