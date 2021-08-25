#include <bits/stdc++.h>

using namespace std;
using ll = long long;
#define rep(i, n) for(int i=0, i##_len=(n); i<i##_len; ++i)
#define all(x) (x).begin(),(x).end()

int main() {

    random_device rd;
    default_random_engine eng(rd());
    uniform_int_distribution<int> rnd_n(1, 1000), rnd_a(1, 1000);

    for (int test = 1; test <= 50; ++test) {

        int N = rnd_n(eng);
        vector<vector<int>> A(N, vector<int>(3));
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
                int reward = rnd_a(eng);
                A[i][t] = reward;
                dp[i][t] = reward + selected_before_reward;
            }
        }

        cout << "< test(" << test << ") >" << endl;
        cout << "------ INPUT START ------" << endl;
        cout << N << endl;
        rep(i, N) {
            rep(t, 3) {
                if (t) cout << " ";
                cout << A[i][t];
            }
            cout << endl;
        }
        cout << endl;
        cout << "------ INPUT END --------" << endl;

        cout << "------ ANSWER START -----" << endl;
        cout << *max_element(all(dp[N - 1])) << endl;
        cout << endl;
        cout << "------ ANSWER END -------" << endl;



    }
}

