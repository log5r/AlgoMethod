#include <bits/stdc++.h>

using namespace std;
using ll = long long;
#define all(x) (x).begin(),(x).end()
#define rep(i, n) for(int i=0, i##_len=(n); i<i##_len; ++i)

// simple
int main() {

    random_device rd;
    default_random_engine eng(rd());
    uniform_int_distribution<int> rnd_a(1, 10);

    for (int test = 1; test <= 50; ++test) {


        vector<int> A(4);
        rep(i, 4) A[i] = rnd_a(eng);

        vector<vector<int>> grid(4, vector<int>(4, 0));
        grid[0] = A;
        rep(h, 4) {
            if (h == 0) continue;
            rep(w, 4) {
                if (w < h) continue; // 必要最低限だけ埋める
                int buf = 0;
                if (w - 1 >= 0) buf += grid[h - 1][w - 1];
                buf += grid[h - 1][w];
                if (w + 1 <= 3) buf += grid[h - 1][w + 1];
                grid[h][w] = buf;
            }
        }


        cout << "< test(" << test << ") >" << endl;
        cout << "------ INPUT START ------" << endl;
        rep(i, 4) {
            if (i) cout << " ";
            cout << A[i];
        }
        cout << endl;
        cout << endl;
        cout << "------ INPUT END --------" << endl;

        cout << "------ ANSWER START -----" << endl;
        cout << grid[3][3] << endl;
        cout << endl;
        cout << "------ ANSWER END -------" << endl;
    }

    return 0;
}
