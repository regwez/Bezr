/*
 This source file is part of the Bezr open source project

 Copyright (c) 2014 - 2017 Regwez, Inc.
 Licensed under Apache License v2.0 with Runtime Library Exception

 Created by Ragy Eleish on 8/6/14.

*/
import Foundation
import XCTest
@testable
import Bezr

class ArraySetTests: XCTestCase {

    let a0 = [33,67]
    let a01 = [0,13,15]
    let a1 = [0,1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17]
    let a2 = [3,9,10,14,16,17]
    let a3 = [3,10,14,16,19]
    let a22 = [3,9,10,14,16,17]
    let a32 = [3,10,14,16,19]
    let a23 = [3,9,10,14,16,17]
    let a33 = [3,10,14,16,19]
    let a24 = [3,9,10,14,16,17]
    let a34 = [3,10,14,16,19]

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testUnion() {
       let r00 = unionOfSortedArrays(array1: a0, array2: a0)
        XCTAssert(a0 == r00!, "Pass")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }

}
