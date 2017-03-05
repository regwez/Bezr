/*
 This source file is part of the Bezr open source project

 Copyright (c) 2014 - 2017 Regwez, Inc.
 Licensed under Apache License v2.0 with Runtime Library Exception

 Created by Ragy Eleish on 3/2/17.

*/

extension ArraySetTests {

    static var allTests : [(String, (ArraySetTests) -> () throws -> Void)] {
        return [
        ("testUnion", testUnion),
        ("testPerformanceExample", testPerformanceExample)
        ]
    }
}

extension SearchTests {

    static var allTests = [
        ("testEqual", testEqual),
        ("testStructEqual", testStructEqual),
        ("testUInt16SearchPerformance",testUInt16SearchPerformance),
        ("testTestStructSearchPerformance",testTestStructSearchPerformance),
    ]
}

extension SortingTests {

    static var allTests = [
        ("testRadixSort", testRadixSort),
        ("testRadixSortPerformance", testRadixSortPerformance),
        ("testStandardSortPerformance",testStandardSortPerformance),
        ("testStandardBlockSortPerformance",testStandardBlockSortPerformance),

    ]
}
