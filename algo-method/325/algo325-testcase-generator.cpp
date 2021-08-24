#include <bits/stdc++.h>

using namespace std;
using ll = long long;
#define all(x) (x).begin(),(x).end()
#define rep(i, n) for(int i=0, i##_len=(n); i<i##_len; ++i)

int main() {

    random_device rd;
    default_random_engine eng(rd());
    uniform_int_distribution<int> rnd_N(2, 100);
    uniform_int_distribution<int> rnd_a(0, 99);

    for (int test = 1; test <= 50; ++test) {


        int N = rnd_N(eng);
        vector<int> A(N);
        rep(i, N) A[i] = rnd_a(eng);

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

        // OUTPUT
        cout << "< test(" << test << ") >" << endl;
        cout << "------ INPUT START ------" << endl;
        cout << N << endl;
        rep(i, N) {
            if (i) cout << " ";
            cout << A[i];
        }
        cout << endl;
        cout << endl;
        cout << "------ INPUT END --------" << endl;

        cout << "------ ANSWER START -----" << endl;
        cout << grid[N - 1][N - 1] << endl;
        cout << endl;
        cout << "------ ANSWER END -------" << endl;

    }
    return 0;
}
