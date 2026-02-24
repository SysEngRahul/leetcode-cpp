#include <iostream>
using namespace std;

bool isPerfect(int n) {
    if (n <= 1) return false;

    int sum = 1;
    for (int i = 2; i * i <= n; ++i) {
        if (n % i == 0) {
            sum += i;
            if (i != n / i) {
                sum += n / i;
            }
        }
    }
    return sum == n;
}

int main() {
    int n;
    cout << "Enter a number: ";
    cin >> n;

    if (isPerfect(n)) {
        cout << n << " is a perfect number\n";
    } else {
        cout << n << " is NOT a perfect number\n";
    }

    return 0;
}