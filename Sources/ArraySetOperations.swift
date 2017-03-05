/*
 This source file is part of the Bezr open source project

 Copyright (c) 2014 - 2017 Regwez, Inc.
 Licensed under Apache License v2.0 with Runtime Library Exception

 Created by Ragy Eleish on 8/6/14.

*/

import Foundation

/*
  A function that performs an EQUAL search on a sorted array.
*/
public func unionOfSortedArrays<T:Comparable>(array1:[T], array2:[T]) -> [T]?{

    var resultingArray = [T]()
    resultingArray.reserveCapacity(array1.count)

    var idx1 = 0
    var idx2 = 0
    let count1 = array1.count
    let count2 = array2.count
    while idx1 < count1 && idx2 < count2 {

        //        if idx2 >= count2{
        //            resultingArray.append(array1[idx1])
        //            idx1++
        //            continue
        //        }
        //        print("ss")
        //        if idx1 >= count1{
        //            resultingArray.append(array2[idx2])
        //            idx2++
        //            continue
        //        }
        if array1[idx1] == array2[idx2] {
            resultingArray.append(array1[idx1])
            idx1 += 1
            idx2 += 1
        } else if array1[idx1] < array2[idx2]{
            resultingArray.append(array1[idx1])
            idx1 += 1
        }else {
            resultingArray.append(array2[idx2])
            idx2 += 1
        }

    }

        while idx2 < count2{
            resultingArray.append(array2[idx2])
            idx2 += 1
        }

        while idx1 < count1{
            resultingArray.append(array1[idx1])
            idx1 += 1
        }

    if resultingArray.count == 0 {
        return nil
    }

    return resultingArray
}


public func substractSortedArrays<T:Comparable>(fromArray:[T], array:[T]) -> [T]?{

    if array.count == 0{
        return [T](fromArray)
    }
    var resultingArray = [T]()
    resultingArray.reserveCapacity(fromArray.count)

    var subArrayIdx = 0
    for idx in 0..<fromArray.count {
        while (subArrayIdx < array.count && fromArray[idx] > array[subArrayIdx]){
            subArrayIdx += 1
        }
        if subArrayIdx >= array.count{
            break
        }
        if fromArray[idx] == array[subArrayIdx]{
            continue
        }
        resultingArray.append(fromArray[idx])

    }

    if resultingArray.count == 0 {
        return nil
    }

    return resultingArray
}

/* Function to intersect two Arrays and return a new array as a result */
public func intersectSortedArrays<T:Comparable>(array1:[T], array2:[T]) -> [T]?{
    var minSize = array1.count
    var smallArray = array1
    var largeArray = array2
    if array1.count > array2.count{
        minSize = array2.count
        smallArray = array2
        largeArray = array1
    }

    var resultingArray = [T]()
    resultingArray.reserveCapacity(minSize)

    var largeIdx = 0
    for smallIdx in 0..<minSize {
        while (largeIdx < largeArray.count && smallArray[smallIdx] > largeArray[largeIdx]){
            largeIdx += 1
        }
        if largeIdx >= largeArray.count{
            break
        }
        if smallArray[smallIdx] == largeArray[largeIdx]{
            resultingArray.append(smallArray[smallIdx])
            continue
        }

    }

    if resultingArray.count == 0 {
        return nil
    }

    return resultingArray
}

public func multipleSortedArraysIntersectionOneByOne<T:Comparable>(_ arrays:[[T]])-> [T]?{
    if arrays.count == 0{
        return nil
    }
    if arrays.count == 1 {
        return [T](arrays[0])
    }
    var unionOfFirstTwo = intersectSortedArrays(array1: arrays[0], array2: arrays[1])

    if arrays.count == 2 || unionOfFirstTwo == nil{
        return unionOfFirstTwo
    }

    for n in 2..<arrays.count{
        if let u = intersectSortedArrays(array1: unionOfFirstTwo!, array2: arrays[n]){
            unionOfFirstTwo = u
        }else{
            return nil
        }
    }
    return unionOfFirstTwo
}

func multipleunionOfSortedArrayss<T:Comparable>(_ arrays:[[T]])-> [T]?{

    if arrays.count == 0{
        return nil
    }
    var resultingValues = [T]()
    resultingValues.reserveCapacity(arrays.count)


    for n in 0..<arrays.count{
        let c:[T]? = arrays[n]
        if let l = c{
            resultingValues += l
        }
    }

    if resultingValues.count  == 0{
        return nil
    }
    resultingValues.sort()

    return removeDuplicatesFromSortedArray(resultingValues)

}

public func removeDuplicatesFromSortedArray<T:Comparable>(_ array:[T])-> [T]?{
    var resultingValues = [T]()
    resultingValues.reserveCapacity(array.count)

    var valueToCompare = array[0]
    resultingValues.append(valueToCompare)

    for n in 1..<array.count{
        if valueToCompare == array[n]{
            continue
        }
        valueToCompare = array[n]
        resultingValues.append(array[n])
    }
    return resultingValues
}
