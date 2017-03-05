/*
 This source file is part of the Bezr open source project

 Copyright (c) 2014 - 2017 Regwez, Inc.
 Licensed under Apache License v2.0 with Runtime Library Exception

 Created by Ragy Eleish on 8/6/14.

*/

import Foundation

public func insertionSort<T: Comparable>(_ array:inout [T], offset:Int, end:Int) {
    var y = offset

    for x in offset..<end {
        y = x
        while(y>offset && array[y-1]>array[y]) {
            let temp = array[y]
            array[y] = array[y-1]
            array[y-1] = temp
            y -= 1
        }
    }
}


public func radixSortUInt16(_ array:inout [UInt16]) {
    internalRadixSortUInt16(&array, offset:0, end:array.count,shift:8)
}

func internalRadixSortUInt16(_ array:inout [UInt16], offset:Int, end:Int, shift:UInt16) {
    var y:UInt16 = 0
    var temp:UInt16 = 0
    var value: UInt16 = 0
    var last = [Int](repeating: 0, count: 256)
    var pointer = [Int](repeating: 0, count: 256)
    var localShift:UInt16 = shift


    for x1:UInt16 in UInt16(offset)..<UInt16(end) {
        let index:UInt16 = (array[Int(x1)] >> shift) & 0xFF
        last[Int(index)] += 1
    }

    last[0] += offset;
    pointer[0] = offset;
    for x in 1..<256  {
        let previousX = Int(x - 1)
        pointer[Int(x)] = last[previousX]
        last[Int(x)] += last[previousX]
    }

    for x in 0..<256 {
        while (pointer[x] != last[x]) {
            value = array[pointer[x]]
            y = (value >> shift) & 0xFF
            while UInt16(x) != y {
                temp = array[pointer[Int(y)]]
                array[pointer[Int(y)]] = value
                y += 1
                value =  temp
                y = (value >> shift) & 0xFF
            }
            array[pointer[x]] = value
            pointer[x] += 1
        }
    }

    if localShift > 0 {
        localShift -= 8;
        for x in 0..<256 {
            let temp = x > 0 ? pointer[Int(x)] - pointer[Int(x-1)] : pointer[0] - offset
            if (temp > 64) {
                internalRadixSortUInt16(&array, offset:pointer[Int(x)] - temp, end:pointer[Int(x)], shift:localShift)
            } else if (temp > 1) {
                insertionSort(&array, offset: pointer[Int(x)] - temp, end: pointer[Int(x)])
            }
        }
    }
}
