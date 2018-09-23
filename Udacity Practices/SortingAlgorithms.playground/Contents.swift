// Sorting algorithms
// Reference: https://github.com/raywenderlich/swift-algorithm-club


var testArray = [1, 12, 54, 7, 3, 13, 26, 19]
/**
 Bubble sort (bad sorting algorithm)
 
 Runtime:
    - Average: O(n^2)
    - Worst:   O(n^2)
 Space:
    - O(1)
 
 Note: how to write 2 related for-loop
 */
func bubbleSort(_ nums: [Int]) -> [Int] {
    var output: [Int] = nums
    for i in 0..<output.count {
        for j in 0..<output.count-i-1 {
            if (output[j] > output[j+1]) {
                let temp = output[j]
                output[j] = output[j+1]
                output[j+1] = temp
            }
        }
    }
    return output
}

print("\(bubbleSort(testArray))")

/**
 Merge sort
 Reference: https://github.com/raywenderlich/swift-algorithm-club/blob/master/Merge%20Sort/MergeSort.swift
 
 Runtime:
     - Average: O(nlog(n))
     - Worst:   O(nlog(n))
 Space:
     - O(n)
 
 Note: recursive and subsets the arrays
 */
func mergeSort(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else { return nums }
    
    let midIndex = nums.count / 2
    let leftArray = mergeSort(Array(nums[0..<midIndex]))
    let rightArray = mergeSort(Array(nums[midIndex..<nums.count]))
    
    // Merge
    var results: [Int] = []
    var leftIndex = 0
    var rightIndex = 0
    while true {
        guard leftIndex < leftArray.count else {
            results.append(contentsOf: rightArray[rightIndex..<rightArray.endIndex])
            return results
        }
        
        guard rightIndex < rightArray.count else {
            results.append(contentsOf: leftArray[leftIndex..<leftArray.endIndex])
            return results
        }
        
        if leftArray[leftIndex] > rightArray[rightIndex] {
            results.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            results.append(leftArray[leftIndex])
            leftIndex += 1
        }
    }
}

print("\(mergeSort(testArray))")

/**
 Quick sort: most efficient algorithm in many cases
 
 Runtime:
     - Average: O(nlog(n))
     - Worst:   O(n^2)
 Space:
     - O(1)
 */

func quicksort(_ nums: [Int])  -> [Int] {
    guard nums.count > 1 else { return nums }
    
    let pivot = nums[nums.count/2]
    let less = nums.filter { $0 < pivot }
    let equal = nums.filter { $0 == pivot }
    let greater = nums.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}

func quicksort(_ input: [Int], low: Int, high: Int) -> [Int] {
    var result = input
    
    if low < high {
        let pivot = result[high]
        var i = low
        
        for j in low..<high {
            if result[j] <= pivot {
                (result[i], result[j]) = (result[j], result[i])
                i += 1
            }
        }
        (result[i], result[high]) = (result[high], result[i])
        result = quicksort(result, low: low, high: i - 1)
        result = quicksort(result, low: i + 1, high: high)
    }
    
    return result
}

print("\(quicksort(testArray))")
print("\(quicksort(testArray, low: 0, high: testArray.count - 1))")
