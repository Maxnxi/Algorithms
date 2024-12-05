//
//  DF_Search.cpp
//  Algorithms
//
//  Created by Maksim Ponomarev on 12/4/24.
//

#include "DF_Search.hpp"

#include <iostream>
#include <vector>
#include <unordered_set>

class Graph {
public:
	// Adjacency list representation of the graph
	std::unordered_map<int, std::vector<int>> adjacencyList;

	// Function to add an edge to the graph
	void addEdge(int source, int destination) {
		adjacencyList[source].push_back(destination);
	}

	// DFS function to find path from start to target
	bool dfs(int start, int target, std::unordered_set<int>& visited, std::vector<int>& path) {
		// Mark the node as visited
		visited.insert(start);
		path.push_back(start);

		// Check if we have reached the target
		if (start == target) {
			return true; // Target found
		}

		// Explore neighbors
		for (int neighbor : adjacencyList[start]) {
			if (visited.find(neighbor) == visited.end()) {
				if (dfs(neighbor, target, visited, path)) {
					return true; // Path found in recursive call
				}
			}
		}

		// Backtrack if no path is found
		path.pop_back();
		return false; // No path found
	}

	// Function to find a path from start to target
	std::vector<int> findPath(int start, int target) {
		std::unordered_set<int> visited;
		std::vector<int> path;

		if (dfs(start, target, visited, path)) {
			return path; // Return the found path
		} else {
			return {}; // Return an empty vector if no path found
		}
	}
};

// Example usage
int main() {
	Graph graph;
	graph.addEdge(0, 1);
	graph.addEdge(0, 2);
	graph.addEdge(1, 3);
	graph.addEdge(2, 3);
	graph.addEdge(3, 4);

	int start = 0, target = 4;
	std::vector<int> path = graph.findPath(start, target);

	if (!path.empty()) {
		std::cout << "Path found: ";
		for (int node : path) {
			std::cout << node << " ";
		}
		std::cout << std::endl;
	} else {
		std::cout << "No path found." << std::endl;
	}

	return 0;
}
