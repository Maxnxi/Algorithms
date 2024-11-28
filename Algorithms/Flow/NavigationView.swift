//
//  ContentView.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/27/24.
//

import SwiftUI


struct NavigationView: View {

	@EnvironmentObject var algorithmContainer: AlgorithmContainer
	
	var body: some View {
		NavigationStack {
			List(algorithmContainer.algorithms) { algorithm in
				NavigationLink {
					AlgorithmView(algorithm: algorithm)
				} label: {
					Text(algorithm.name)
				}
			}
			.navigationTitle("Choose an Algorithm")
		}
	}
}

//#Preview {
//	NavigationView()
//}
