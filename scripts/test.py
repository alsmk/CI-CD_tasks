from fetch_info import fetch_info
import unittest


class TestCommitInfo(unittest.TestCase):

    def test_committer_name(self):
        repo = "alsmk/CI-CD_tasks"
        base_url = "https://api.github.com"
        url = f"{base_url}/repos/{repo}/commits"
        commits = fetch_info(url)
        self.assertEqual(commits[0]["commit"]["author"]["name"], "alsmk")

    def test_fetch_commits(self):
        repo = "alsmk/CI-CD_tasks"
        base_url = "https://api.github.com"
        url = f"{base_url}/repos/{repo}/commits"
        commits = fetch_info(url)
        self.assertGreater(len(commits), 0)


if __name__ == "__main__":
    unittest.main()
