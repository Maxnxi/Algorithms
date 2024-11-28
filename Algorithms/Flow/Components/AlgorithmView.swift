//
//  AlgorithmView.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/27/24.
//

import SwiftUI


struct AlgorithmView: View {
	let algorithm: Algorithm
		
	@State var inputString: String = ""
	@State var outputString: String = ""
	
	var body: some View {
		VStack(spacing: 20) {
			Text(algorithm.name)
				.padding()
			
			Button("Example input: \(algorithm.exampleInput)") {
				UIPasteboard.general.string = algorithm.exampleInput
				inputString = algorithm.exampleInput
			}
			
			Divider()
			
			TextField("Input...", text: $inputString)
				.padding()
			
			Divider()
			
			Button("calculate") {
				calculate()
			}
			
			Divider()
						
			TextField("Output...", text: $outputString)
				.padding()
			
			Spacer()
		}
	}
	
	func calculate() {
		guard let output = algorithm.calculate?(inputString) else {
			debugPrint("Failed to get string after algorithm calculation")
			return outputString = "Error"
		}
		outputString = output
	}
}
