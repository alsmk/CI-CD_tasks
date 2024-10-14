import requests
import os

# from dotenv import load_dotenv

# load_dotenv()

token = os.getenv("TOKEN")
repo = "alsmk/CI-CD_tasks"
base_url = "https://api.github.com"


def fetch_info(url):
    headers = {"Authorization": f"token {token}"}
    response = requests.get(url, headers=headers)
    commits = response.json()
    return commits


def print_commit_info():
    url = f"{base_url}/repos/{repo}/commits"
    lis = fetch_info(url)
    commit = lis[0]
    print("The latest commit ::")
    print(f"Commit Message: {commit['commit']['message']}")
    print(f"Author: {commit['commit']['author']['name']}")
    print(f"Date: {commit['commit']['author']['date']}")


if __name__ == "__main__":
    print_commit_info()
    # print_pr_info()
