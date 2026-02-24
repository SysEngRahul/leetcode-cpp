#include <iostream>
#include <vector>

using namespace std;

int main() {
    int n = 30;  // change this to test different inputs

    if (n <= 2) {
        cout << 0 << endl;
        return 0;
    }

    vector<bool> isPrime(n, true);
    isPrime[0] = false;
    isPrime[1] = false;

    for (size_t i = 2; i * i < static_cast<size_t>(n); ++i) {
        if (isPrime[i]) {
            for (size_t j = i * i; j < static_cast<size_t>(n); j += i) {
                isPrime[j] = false;
            }
        }
    }

    int count = 0;
    for (bool p : isPrime) {
        if (p) ++count;
    }

    cout << count << endl;
    return 0;
}