#include <bits/stdc++.h>
using namespace std;

int main() {
    vector<int> nums = {2, 7, 11, 15};
    int target = 9;

    unordered_map<int, size_t> index;  // value -> index

    for (size_t i = 0; i < nums.size(); ++i) {
        int need = target - nums[i];

        auto it = index.find(need);
        if (it != index.end()) {
            cout << it->second << " " << i << "\n";
            return 0;
        }

        index[nums[i]] = i;
    }

    cout << "No valid pair found\n";
    return 0;
}