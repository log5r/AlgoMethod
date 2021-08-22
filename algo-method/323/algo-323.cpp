#include <bits/stdc++.h>

using namespace std;
#define rep(i, n) for(int i=0, i##_len=(n); i<i##_len; ++i)

int main() {
    int N; cin >> N;
    int M; cin >> M;
    vector<int> D(N);
    rep(i, M) cin >> D[i];

    vector<bool> cells(N + 1, false);
    cells[0] = true;
    rep(i, N + 1) for (int s: D) if (i - s >= 0 && cells[i - s]) cells[i] = true;
    cout << (cells[N]? "Yes": "No") << endl;

    return 0;
}
