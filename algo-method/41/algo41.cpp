#include <bits/stdc++.h>

using namespace std;
using ll = long long;
#define rep(i, n) for(int i=0, i##_len=(n); i<i##_len; ++i)
#define all(x) (x).begin(),(x).end()

int main() {
    int N; cin >> N;
    // dp[i][t]: i日目にタスクtを選んだときの累計報酬
    vector<vector<int>> dp(N, vector<int>(3, 0));
    rep(i, N) {
        rep(t, 3) {
            int selected_before_reward = 0;
            int selected_before_task = -1;
            if (i > 0) {
                rep(before_task, 3) {
                    if (t == before_task) continue;
                    if (dp[i - 1][before_task] > selected_before_reward) {
                        selected_before_reward = dp[i - 1][before_task];
                        selected_before_task = before_task;
                    }
                }
            }
            if (selected_before_task == t) continue;
            int reward; cin >> reward;
            dp[i][t] = reward + selected_before_reward;
        }
    }
    cout << *max_element(all(dp[N - 1])) << endl;
}
