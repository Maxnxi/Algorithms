//
//  Brute_force_with_backtracking.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/7/24.
//

#include <stdio.h>

int n = 4;
int count = 0;
<int> col;

void search(int y) {
	if (y == n) {
		count++;
		return;
	}
	for (int x = 0; x < n; x++ ) {
		if (col[x] || diag1[x+y] || diag2[x-y+n-1]) continue;
		
	}
}
