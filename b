#include <bits/stdc++.h>
using namespace std;

class Solution {
  private:
    bool isSafe(int x, int y, vector<vector<int>>& visited, vector<vector<int>>& mat, int n) {
        return (x >= 0 && x < n) && (y >= 0 && y < n) && (visited[x][y] == 0) && (mat[x][y] == 1);
    }

    void solve(int x, int y, vector<vector<int>>& visited, string& path, vector<vector<int>>& mat, int n, vector<string>& ans) {
        // base case
        if (x == n - 1 && y == n - 1) {
            ans.push_back(path);
            return;
        }

        visited[x][y] = 1;

        // Down
        if (isSafe(x + 1, y, visited, mat, n)) {
            path.push_back('D');
            solve(x + 1, y, visited, path, mat, n, ans);
            path.pop_back();
        }

        // Up
        if (isSafe(x - 1, y, visited, mat, n)) {
            path.push_back('U');
            solve(x - 1, y, visited, path, mat, n, ans);
            path.pop_back();
        }

        // Left
        if (isSafe(x, y - 1, visited, mat, n)) {
            path.push_back('L');
            solve(x, y - 1, visited, path, mat, n, ans);
            path.pop_back();
        }

        // Right
        if (isSafe(x, y + 1, visited, mat, n)) {
            path.push_back('R');
            solve(x, y + 1, visited, path, mat, n, ans);
            path.pop_back();
        }

        visited[x][y] = 0;
    }

  public:
    vector<string> findPath(vector<vector<int>>& mat, int n) {
        vector<string> ans;
        if (mat[0][0] == 0 || mat[n - 1][n - 1] == 0) return ans;

        vector<vector<int>> visited(n, vector<int>(n, 0));
        string path = "";
        solve(0, 0, visited, path, mat, n, ans);
        sort(ans.begin(), ans.end());
        return ans;
    }
};

