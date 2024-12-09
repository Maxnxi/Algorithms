//
//  BruteForce_ver2.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/9/24.
//

#include <stdio.h>

void search(int y) {
	int n = 4;
	int count = 0;
	
	int col[n];
	int diag1[n];
	int diag2[n];
	
	if (y == n) {
		count++;
		return;
	}
	for (int x = 0; x < n; x++) {
		if (col[x] || diag1[x+y] || diag2[x-y+n-1]) continue;
		col[x] = diag1[x+y] = diag2[x-y+n-1] = 1;
		search(y+1);
		col[x] = diag1[x+y] = diag2[x-y+n-1] = 0;
	}
}
