#include <bits/stdc++.h>

using namespace std;
#define rep(i, n) for(int i=0, i##_len=(n); i<i##_len; ++i)

int main() {
    int N; cin >> N;
    int M; cin >> M;
    vector<int> D(N);
    rep(i, M) cin >> D[i];

    bitset<1005> b;
    b.set(0, true);
    rep(i, N + 1) for (int s: D) if (i - s >= 0 && b.test(i - s)) b.set(i);
    cout << (b.test(N) ? "Yes" : "No") << endl;

    return 0;
}
