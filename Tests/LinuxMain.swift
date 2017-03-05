/*
 This source file is part of the Bezr open source project

 Copyright (c) 2014 - 2017 Regwez, Inc.
 Licensed under Apache License v2.0 with Runtime Library Exception

 Created by Ragy Eleish on 3/4/17.

*/

import XCTest
@testable import BezrTests

import XCTest

XCTMain([testCase(ArraySetTests.allTests),
         testCase(SearchTests.allTests),
         testCase(SortingTests.allTests)
        ])
