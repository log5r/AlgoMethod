#include <bits/stdc++.h>

using namespace std;
using ll = long long;
#define all(x) (x).begin(),(x).end()
#define rep(i, n) for(int i=0, i##_len=(n); i<i##_len; ++i)


int main() {

    random_device rd;
    default_random_engine eng(rd());
    uniform_int_distribution<int> cellc(1, 1000);
    uniform_int_distribution<int> dicec(1, 20);

    for (int c = 1; c <= 50; ++c) {

        // input のかわりに入れる
        int N = cellc(eng);
        int M = dicec(eng);
        vector<int> D;
        rep(i, M) D.push_back(cellc(eng));

        cout << "< test(" << c << ") >" << endl;
        cout << "------ INPUT START ------" << endl;
        cout << N << " " << M << endl;
        rep(i, M) {
            if (i) cout << " ";
            cout << D[i];
        }
        cout << endl;
        cout << endl;
        cout << "------ INPUT END --------" << endl;

        vector<bool> cells(N + 1, false);
        cells[0] = true;
        rep(i, N + 1) for (int s: D) if (i - s >= 0 && cells[i - s]) cells[i] = true;

        cout << "------ ANSWER START -----" << endl;
        cout << (cells[N]? "Yes": "No") << endl;
        cout << "------ ANSWER END -------" << endl;
        cout << " " << endl;

    }

    return 0;
}
