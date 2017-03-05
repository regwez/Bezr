/*
 This source file is part of the Bezr open source project

 Copyright (c) 2014 - 2017 Regwez, Inc.
 Licensed under Apache License v2.0 with Runtime Library Exception

 Created by Ragy Eleish on 8/7/14.

*/

import XCTest
@testable
import Bezr

class SortingTests: XCTestCase {


    let _data:[UInt16] = [86, 457, 75, 136, 765, 191, 25, 644, 491, 976, 270, 44, 481, 18, 213, 381, 895, 771, 902, 956, 646, 570, 945, 30, 743, 639, 358, 595, 470, 228, 611, 90, 300, 889, 369, 703, 771, 975, 575, 16, 391, 672, 164, 455, 602, 750, 260, 235, 470, 300, 478, 284, 92, 984, 733, 113, 541, 30, 883, 97, 838, 248, 521, 909, 882, 248, 12, 29, 602, 333, 678, 122, 239, 932, 846, 418, 705, 101, 265, 97, 745, 965, 629, 88, 933, 952, 779, 703, 446, 925, 471, 185, 993, 941, 585, 707, 798, 344, 709, 663]


    let _sortedData:[UInt16] = [12, 16, 18, 25, 29, 30, 30, 44, 75, 86, 88, 90, 92, 97, 97, 101, 113, 122, 136, 164, 185, 191, 213, 228, 235, 239, 248, 248, 260, 265, 270, 284, 300, 300, 333, 344, 358, 369, 381, 391, 418, 446, 455, 457, 470, 470, 471, 478, 481, 491, 521, 541, 570, 575, 585, 595, 602, 602, 611, 629, 639, 644, 646, 663, 672, 678, 703, 703, 705, 707, 709, 733, 743, 745, 750, 765, 771, 771, 779, 798, 838, 846, 882, 883, 889, 895, 902, 909, 925, 932, 933, 941, 945, 952, 956, 965, 975, 976, 984, 993]

    override func setUp() {
        super.setUp()
        //_data = [86, 457, 75, 136, 765, 191, 25, 644, 491, 976, 270, 44, 481, 18, 213, 381, 895, 771, 902, 956, 646, 570, 945, 30, 743, 639, 358, 595, 470, 228, 611, 90, 300, 889, 369, 703, 771, 975, 575, 16, 391, 672, 164, 455, 602, 750, 260, 235, 470, 300, 478, 284, 92, 984, 733, 113, 541, 30, 883, 97, 838, 248, 521, 909, 882, 248, 12, 29, 602, 333, 678, 122, 239, 932, 846, 418, 705, 101, 265, 97, 745, 965, 629, 88, 933, 952, 779, 703, 446, 925, 471, 185, 993, 941, 585, 707, 798, 344, 709, 663]

    //    _sortedData = [12, 16, 18, 25, 29, 30, 30, 44, 75, 86, 88, 90, 92, 97, 97, 101, 113, 122, 136, 164, 185, 191, 213, 228, 235, 239, 248, 248, 260, 265, 270, 284, 300, 300, 333, 344, 358, 369, 381, 391, 418, 446, 455, 457, 470, 470, 471, 478, 481, 491, 521, 541, 570, 575, 585, 595, 602, 602, 611, 629, 639, 644, 646, 663, 672, 678, 703, 703, 705, 707, 709, 733, 743, 745, 750, 765, 771, 771, 779, 798, 838, 846, 882, 883, 889, 895, 902, 909, 925, 932, 933, 941, 945, 952, 956, 965, 975, 976, 984, 993]

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

  /*  func testRadixSort() {
        var unsortedData = [UInt16](_data)
       radixSortUInt16(&unsortedData)

        //XCTAssertEqual(_data == _sortedData, ,"Arrays should be equal")
        // This is an example of a functional test case.
        XCTAssert(unsortedData == _sortedData, "Pass")
    }

    func testRadixSortPerformance() {
        // This is an example of a performance test case.
      //var unsortedData = [UInt16](_data)

        self.measure() {
            for _ in 0...10 {
                var unsortedData = [UInt16](self._data)
                radixSortUInt16(&unsortedData)
            }
        }
    }
*/
    func testStandardSortPerformance() {
        // This is an example of a performance test case.


        self.measure() {
            for _ in 0...10 {
                var unsortedData = [UInt16](self._data)
                unsortedData.sort()
            }
        }
    }

    func testStandardBlockSortPerformance() {
        // This is an example of a performance test case.


        self.measure() {
            for _ in 0...10  {
                var unsortedData = [UInt16](self._data)
                unsortedData.sort(){
                    $0>$1
                }
            }
        }
    }


}
