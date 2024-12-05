//
//  DFSearch.swift
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/4/24.
//
/*
 Explanation:

 Graph Representation:
 The graph is represented as an adjacency list using a dictionary.
 
 DFS Function:
 The dfs function recursively explores each node. It uses a visited set to keep track of visited nodes and a path array to record the current path being explored.

 Backtracking:
 If a path does not lead to the target, it backtracks by removing the last node from the path.
 Finding the Path: The findPath method initializes the search.

 Note:
 This implementation does not guarantee the shortest path due to the nature of DFS. For finding the shortest path in an unweighted graph, it is more common to use BFS.
 
 Depth-First Search (DFS) is typically used to explore all possible paths in a graph. While it’s more common to use Breadth-First Search (BFS) for finding the shortest path in an unweighted graph, you can combine DFS with backtracking to find paths. A typical DFS implementation does not guarantee the shortest path, DFS to explore paths.
 */

import Foundation

class Graph {
	var adjacencyList: [Int: [Int]] = [:]

	func addEdge(from source: Int, to destination: Int) {
		adjacencyList[source, default: []].append(destination)
	}
	
	func dfs(start: Int, target: Int, visited: inout Set<Int>, path: inout [Int]) -> [Int]? {
		// Mark the node as visited
		visited.insert(start)
		path.append(start)

		// Check if we have reached the target
		if start == target {
			return path
		}

		// Explore neighbors
		for neighbor in adjacencyList[start, default: []] {
			if !visited.contains(neighbor) {
				if let resultPath = dfs(start: neighbor, target: target, visited: &visited, path: &path) {
					return resultPath
				}
			}
		}

		// Backtrack
		path.removeLast()
		return nil
	}

	func findPath(start: Int, target: Int) -> [Int]? {
		var visited = Set<Int>()
		var path = [Int]()
		return dfs(start: start, target: target, visited: &visited, path: &path)
	}
}

/*
// Example usage
let graph = Graph()
graph.addEdge(from: 0, to: 1)
graph.addEdge(from: 0, to: 2)
graph.addEdge(from: 1, to: 3)
graph.addEdge(from: 2, to: 3)
graph.addEdge(from: 3, to: 4)

if let path = graph.findPath(start: 0, target: 4) {
	print("Path found: \(path)")
} else {
	print("No path found.")
}
*/
