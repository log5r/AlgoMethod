#include <bits/stdc++.h>

using namespace std;
#define rep(i, n) for(int i=0, i##_len=(n); i<i##_len; ++i)

int main() {

    int N; cin >> N;
    vector<int> A(N);
    rep(i, N) cin >> A[i];

    vector<vector<int>> grid(N, vector<int>(N, 0));
    grid[0] = A;
    rep(h, N) {
        if (h == 0) continue;
        rep(w, N) {
            if (w < h) continue;
            int buf = 0;
            rep(k, 3) {
                int d = k - 1;
                if (w - d < 0 || w + d > N - 1) continue;
                buf += grid[h - 1][w + d];
                buf %= 100;
            }
            grid[h][w] = buf;
        }
    }
    cout << grid[N - 1][N - 1] << endl;
    return 0;
}
