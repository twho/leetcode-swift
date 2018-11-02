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
                (output[j], output[j+1]) = (output[j+1], output[j])
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
    var leftArray = mergeSort(Array(nums[0..<midIndex]))
    var rightArray = mergeSort(Array(nums[midIndex..<nums.count]))
    
    // Merge
    var results: [Int] = []
    while leftArray.count > 0 || rightArray.count > 0 {
        if leftArray.count > 0 && rightArray.count > 0 {
            if leftArray.first! < rightArray.first! {
                results.append(leftArray.removeFirst())
            } else {
                results.append(rightArray.removeFirst())
            }
        } else if leftArray.count > 0  {
            results.append(contentsOf: leftArray)
            leftArray = []
        } else if rightArray.count > 0 {
            results.append(contentsOf: rightArray)
            rightArray = []
        }
    }
    return results
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

print("\(quicksort(testArray))")
