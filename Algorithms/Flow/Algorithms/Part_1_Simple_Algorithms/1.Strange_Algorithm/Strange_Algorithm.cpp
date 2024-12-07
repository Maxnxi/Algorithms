//
//  Strange_Algorithm_documentation.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/5/24.
//

#include <iostream>

using namespace std;
typedef long long ll;

int main() {
	// beter to use long long to not overflow int
	ll n;
	cin >> n;
	while (true) {
		cout << n << endl;
		if (n == 1) break;
		if (n%2 == 0) n/=2;
		else n = n*3+1;
	}
	cout << endl;
}
