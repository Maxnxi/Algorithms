//
//  Untitled.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 11/27/24.
//


import Foundation

struct Algorithm: Identifiable {
	var id = UUID()
	var name: String
	var exampleInput: String
	var calculate: ((Any) -> String?)?
}


