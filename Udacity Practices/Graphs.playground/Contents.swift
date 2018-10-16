// Graphs in Swift
// Udacity: https://classroom.udacity.com/courses/ud1011/lessons/7849d809-7f82-401c-a70d-92f8d8fe1441/concepts/7cdeb09c-3589-4f07-8117-3cedf876b5c4
// Ref2: https://www.raywenderlich.com/773-swift-algorithm-club-graphs-with-adjacency-list

// Vertex
struct Node: Hashable, Equatable {
    var value: Int
    var edges: [Edge]
    var visited = false // For traversal
    var hashValue: Int {
        return "\(value)".hashValue
    }
    
    init(value: Int) {
        self.value = value
        self.edges = []
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
}

// Directed
struct Edge {
    
    var value: Int?
    var source: Node?
    var destination: Node?
    
    init(value: Int?, source: Node?, destination: Node?) {
        self.value = value
        self.source = source
        self.destination = destination
    }
}

class Graph {
    
    var nodes: [Node]
    var edges: [Edge]
    
    init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }
    
    // Create a recursive implementation.
    // Return a list of the node values.
    func dfs(_ startNode: Node) -> [Int] {
        let visited = [startNode.value]
        return dfsHelper(startNode, visited: visited)
    }
    
    // helper method - use to implement DFS recursively
    func dfsHelper(_ current: Node, visited: [Int]) -> [Int] {
        var result = visited
        
        for edge in edges {
            if !result.contains((edge.destination?.value)!) {
                result.append(edge.destination!.value)
                result = dfsHelper(edge.destination!, visited: result)
            }
        }
        return result
    }
    
    
    // Create an iterative implementation.
    // Return a list of the node values.
    func bfs(_ startNode: inout Node) -> [Int] {
        var visited: [Int] = []
        var toVisit: [Node] = [] // Treat this array as a queue
        
        toVisit.append(startNode)
        visited.append(startNode.value)
        startNode.visited = true
        
        while !toVisit.isEmpty {
            let node = toVisit.removeFirst()
            
            for edge in node.edges {
                var neighborNode = edge.destination
                
                if !(neighborNode?.visited)! {
                    toVisit.append(neighborNode!)
                    neighborNode?.visited = true
                    visited.append((neighborNode?.value)!)
                }
            }
        }
        return visited
    }

    // Return an array of arrays where inner arrays look like
    // (Edge Value, From Node Value, To Node Value)
    func getEdgeList() -> [[Int]] {
        var edgeList = [[Int]]()
        for edge in self.edges {
            edgeList.append([edge.value!, (edge.source?.value)!, (edge.destination?.value)!])
        }
        return edgeList
    }
    
    func getAdjacencyList() -> [Node : [Edge]] {
        var adjacencyList: [Node : [Edge]] = [:]
        for edge in edges {
            guard let source = edge.source else {
                continue
            }
            if adjacencyList[source] == nil {
                adjacencyList[source] = [edge]
            } else {
                adjacencyList[source]?.append(edge)
            }
        }
        return adjacencyList
    }
    
    // Return a matrix, or 2D array.
    // Row numbers represent from nodes.
    // Column numbers represent to nodes.
    // Store the edge values in each spot, and a 0 if no edge exists.
    func getAdjacencyMatrix() -> [[Int]] {
        let max = getMaxIndex()
        var adjacencyMatrix = [[Int]]()
        for _ in 0...max {
            var newArray: [Int] = []
            for _ in 0...max {
                newArray.append(0)
            }
            adjacencyMatrix.append(newArray)
        }
        for edge in edges {
            adjacencyMatrix[(edge.source?.value)!][(edge.destination?.value)!] = edge.value!
        }
        return adjacencyMatrix
    }
    
    func printAdjacencyList(_ adjacentList: [Node : [Edge]]) {
        var printStr = ""
        for i in adjacentList {
            for value in i.value {
                printStr += "[\(i.key.value), (src: \((value.source?.value)!), des: \((value.destination?.value)!), val: \(value.value!)] "
            }
        }
        print(printStr)
    }
    
    // Helper to be used with adjacency list and adjacency matrix
    // max node value determines the size of the array
    func getMaxIndex() -> Int {
        var maxIndex = 0
        
        for node in nodes {
            if node.value > maxIndex {
                maxIndex = node.value
            }
        }
        
        return maxIndex
    }
    
    // creates a node with a given value and inserts it into the graph
    func insertNodeWithValue(_ value: Int) {
        let newNode = Node(value: value)
        nodes.append(newNode)
    }
    
    // inserts an edge between the "to" and "from" nodes with the specified values
    func insertEdgeWithValue(_ newVal: Int, srcValue: Int, destValue: Int) {
        var fromFound: Node? = nil
        var toFound: Node? = nil
        
        for node in nodes {
            if srcValue == node.value {
                fromFound = node
            }
            if destValue == node.value {
                toFound = node
            }
        }
        
        if fromFound == nil {
            fromFound = Node(value: srcValue)
            nodes.append(fromFound!) 
        }
        if toFound == nil {
            toFound = Node(value: destValue)
            nodes.append(toFound!)
        }
        
        let newEdge = Edge(value: newVal, source: fromFound, destination: toFound)
        fromFound?.edges.append(newEdge)
        toFound?.edges.append(newEdge)
        edges.append(newEdge)
    }
}

// Test cases
let node = Node(value: 1)
let graph = Graph(nodes: [node], edges: [])
graph.insertEdgeWithValue(100, srcValue: 1, destValue: 2)
graph.insertEdgeWithValue(101, srcValue: 1, destValue: 3)
graph.insertEdgeWithValue(102, srcValue: 1, destValue: 4)
graph.insertEdgeWithValue(103, srcValue: 3, destValue: 4)

print(graph.getEdgeList()) // Should be [(100, 1, 2), (101, 1, 3), (102, 1, 4), (103, 3, 4)]
graph.printAdjacencyList(graph.getAdjacencyList())
/**
 Output should be:
 [3, (src: 3, des: 4, val: 103]
 [1, (src: 1, des: 2, val: 100]
 [1, (src: 1, des: 3, val: 101]
 [1, (src: 1, des: 4, val: 102]
 */

print(graph.getAdjacencyMatrix()) // Should be [[0, 0, 0, 0, 0], [0, 0, 100, 101, 102], [0, 0, 0, 0, 0], [0, 0, 0, 0, 103], [0, 0, 0, 0, 0]]

// Graph traversal
print(graph.dfs(graph.nodes[0])) // Should be [1, 2, 3, 4]
print(graph.bfs(&graph.nodes[0])) // Should be [1, 2, 3, 4]
