/*
 This source file is part of the Bezr open source project

 Copyright (c) 2014 - 2017 Regwez, Inc.
 Licensed under Apache License v2.0 with Runtime Library Exception

 Created by Ragy Eleish on 8/7/14.

*/

import XCTest
@testable
import Bezr

protocol ValueStruct:Comparable{
    var value:UInt16 {get}
}

struct TestValueStruct:ValueStruct{
    let value:UInt16
    let carriedValue:String
    init(value:UInt16,carriedValue: String){
        self.value = value
        self.carriedValue = carriedValue
    }

    init(value:UInt16){
        self.value = value
        self.carriedValue = ""
    }
}




func ==<T:ValueStruct>(lhs: T, rhs: T) -> Bool{
    return lhs.value == rhs.value
}

func <=<T:ValueStruct>(lhs: T, rhs: T) -> Bool{
    return lhs.value <= rhs.value
}

func >=<T:ValueStruct>(lhs: T, rhs: T) -> Bool{
    return lhs.value >= rhs.value
}

func ><T:ValueStruct>(lhs: T, rhs: T) -> Bool{
    return lhs.value > rhs.value
}

func <<T:ValueStruct>(lhs: T, rhs: T) -> Bool{
    return lhs.value < rhs.value
}


struct TestStruct:Comparable{
    let value:UInt16
    let carriedValue:String
    init(value:UInt16,carriedValue: String){
        self.value = value
        self.carriedValue = carriedValue
    }

    init(value:UInt16){
        self.value = value
        self.carriedValue = ""
    }
}


func ==(lhs: TestStruct, rhs: TestStruct) -> Bool{
    return lhs.value == rhs.value
}

func <=(lhs: TestStruct, rhs: TestStruct) -> Bool{
    return lhs.value <= rhs.value
}

func >=(lhs: TestStruct, rhs: TestStruct) -> Bool{
    return lhs.value >= rhs.value
}

func >(lhs: TestStruct, rhs: TestStruct) -> Bool{
    return lhs.value > rhs.value
}

func <(lhs: TestStruct, rhs: TestStruct) -> Bool{
    return lhs.value < rhs.value
}

class SearchTests: XCTestCase {

     let _sortedData:[UInt16] = [12, 16, 18, 25, 29, 30, 30, 44, 75, 86, 88, 90, 92, 97, 97, 101, 113, 122, 136, 164, 185, 191, 213, 228, 235, 239, 248, 248, 260, 265, 270, 284, 300, 300, 333, 344, 358, 369, 381, 391, 418, 446, 455, 457, 470, 470, 471, 478, 481, 491, 521, 541, 570, 575, 585, 595, 602, 602, 611, 629, 639, 644, 646, 663, 672, 678, 703, 703, 705, 707, 709, 733, 743, 745, 750, 765, 771, 771, 779, 798, 838, 846, 882, 883, 889, 895, 902, 909, 925, 932, 933, 941, 945, 952, 956, 965, 975, 976, 984, 993]

    let _sortedTestStructData:[TestStruct] = [
        TestStruct(value: 12, carriedValue: "12"), TestStruct(value: 16, carriedValue: "16") ,
        TestStruct(value:18 , carriedValue: "18"),TestStruct(value:25 , carriedValue: "25") ,
        TestStruct(value:29 , carriedValue: "29"),TestStruct(value:30 , carriedValue: "30") ,
        TestStruct(value:30 , carriedValue: "30"),TestStruct(value:44 , carriedValue: "44") ,
        TestStruct(value:75 , carriedValue: "75"),TestStruct(value: 86, carriedValue: "86") ,
        TestStruct(value:88 , carriedValue: "88"),TestStruct(value: 90, carriedValue: "90") ,
        TestStruct(value:92 , carriedValue: "92") ,TestStruct(value:97 , carriedValue: "97") ,
        TestStruct(value:97 , carriedValue: "97"),TestStruct(value:101 , carriedValue: "101") ,
        TestStruct(value:113 , carriedValue: "113"),TestStruct(value: 122, carriedValue: "122") ,
        TestStruct(value:136 , carriedValue: "136"),TestStruct(value:164 , carriedValue: "164") ,
        TestStruct(value:185 , carriedValue: "185"), TestStruct(value:191 , carriedValue: "191"),
        TestStruct(value:213 , carriedValue: "213"),TestStruct(value:228 , carriedValue: "228") ,
        TestStruct(value:235 , carriedValue: "235"),TestStruct(value:239 , carriedValue: "239") ,
        TestStruct(value:248 , carriedValue: "248"), TestStruct(value:248 , carriedValue: "248") ,
        TestStruct(value:260 , carriedValue: "260"), TestStruct(value:265 , carriedValue: "265"),
        TestStruct(value:270 , carriedValue: "270"), TestStruct(value:284 , carriedValue: "284"),
        TestStruct(value:300 , carriedValue: "300"),TestStruct(value:300 , carriedValue: "300") ,
        TestStruct(value:333 , carriedValue: "333"),TestStruct(value:344 , carriedValue: "344") ,
        TestStruct(value:358 , carriedValue: "358"),TestStruct(value:369 , carriedValue: "369") ,
        TestStruct(value:381 , carriedValue: "381"),TestStruct(value:391 , carriedValue: "391") ,
        TestStruct(value:418 , carriedValue: "418"), TestStruct(value:446 , carriedValue: "446"),
        TestStruct(value:455 , carriedValue: "455"),TestStruct(value:457 , carriedValue: "457") ,
        TestStruct(value:470 , carriedValue: "470"), TestStruct(value:470 , carriedValue: "470"),
        TestStruct(value:471 , carriedValue: "471"), TestStruct(value:478 , carriedValue: "478"),
        TestStruct(value: 481, carriedValue: "481"),TestStruct(value:491 , carriedValue: "491") ,
        TestStruct(value:521 , carriedValue: "521"),TestStruct(value:541 , carriedValue: "541") ,
        TestStruct(value:570 , carriedValue: "570"),TestStruct(value:575 , carriedValue: "575") ,
        TestStruct(value:585 , carriedValue: "585"),TestStruct(value:595 , carriedValue: "595") ,
        TestStruct(value:602 , carriedValue: "602"),TestStruct(value:602 , carriedValue: "602") ,
        TestStruct(value:611 , carriedValue: "611"),TestStruct(value:629 , carriedValue: "629") ,
        TestStruct(value:639 , carriedValue: "639"),TestStruct(value:644 , carriedValue: "644") ,
        TestStruct(value:646 , carriedValue: "646"),TestStruct(value:663 , carriedValue: "663") ,
        TestStruct(value:672 , carriedValue: "672") , TestStruct(value:678 , carriedValue: "678"),
        TestStruct(value:703 , carriedValue: "703"),TestStruct(value:703 , carriedValue: "703") ,
        TestStruct(value:705 , carriedValue: "705"), TestStruct(value: 707, carriedValue: "707"),
        TestStruct(value:709 , carriedValue: "709"), TestStruct(value:733 , carriedValue: "733"),
        TestStruct(value:743 , carriedValue: "743"),TestStruct(value:745 , carriedValue: "745") ,
        TestStruct(value:750 , carriedValue: "750"), TestStruct(value:765 , carriedValue: "765"),
        TestStruct(value:771 , carriedValue: "771"), TestStruct(value:771 , carriedValue: "771"),
        TestStruct(value:779 , carriedValue: "779"),TestStruct(value:798 , carriedValue: "798") ,
        TestStruct(value:838 , carriedValue: "838"),TestStruct(value:846 , carriedValue: "846") ,
        TestStruct(value:882 , carriedValue: "882"), TestStruct(value:883 , carriedValue: "883"),
        TestStruct(value:889 , carriedValue: "889"),TestStruct(value:895 , carriedValue: "895") ,
        TestStruct(value:902 , carriedValue: "902"),TestStruct(value:909 , carriedValue: "909") ,
        TestStruct(value:925 , carriedValue: "925"),TestStruct(value:932 , carriedValue: "932") ,
        TestStruct(value:933 , carriedValue: "933"),TestStruct(value:941 , carriedValue: "941") ,
        TestStruct(value:945 , carriedValue: "945"),TestStruct(value:952 , carriedValue: "952") ,
        TestStruct(value:956 , carriedValue: "956"),TestStruct(value:965 , carriedValue: "965") ,
        TestStruct(value:975 , carriedValue: "975"),TestStruct(value:976 , carriedValue: "976") ,
        TestStruct(value:984 , carriedValue: "984"),TestStruct(value:993 , carriedValue: "993") ]

    var _sortedTestValueStructData:[TestValueStruct]? = nil

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        var x = [TestValueStruct]()

        for n in _sortedTestStructData{
            x.append(TestValueStruct(value: n.value, carriedValue: n.carriedValue))
        }
        _sortedTestValueStructData = x
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEqual() {
        var index = findIndexEqualToValue(0, array: _sortedData)
        XCTAssert(index == nil, "Pass")
        index = findIndexEqualToValue(12, array: _sortedData)
        XCTAssert(index! == 0, "Pass")

        index = findIndexEqualToValue(993, array: _sortedData)
        XCTAssert(index! == _sortedData.count-1 , "Pass")
    }

    func testStructEqual() {
        var index = findIndexEqualToValue(TestStruct(value:0 ), array: _sortedTestStructData)
        XCTAssert(index == nil, "Pass")
        index = findIndexEqualToValue(TestStruct(value:12), array: _sortedTestStructData)
        XCTAssert(index! == 0, "Pass")

        index = findIndexEqualToValue(TestStruct(value:993 ), array: _sortedTestStructData)
        XCTAssert(index! == _sortedTestStructData.count-1 , "Pass")
    }

    var iterations = 100


    func testUInt16SearchPerformance() {
        let a = _sortedData
        let i = iterations
        self.measure() {
            for _ in 0...i{
                var index = findIndexEqualToValue(0, array: a)
                index = findIndexEqualToValue(12, array: a)
                index = findIndexEqualToValue(707, array: a)
                index = findIndexEqualToValue(993, array: a)
            }
        }
    }

    func testTestStructSearchPerformance() {
        let a = _sortedTestStructData
        let i = iterations
        self.measure() {
            for _ in 0...i{
                var index = findIndexEqualToValue(TestStruct(value:0 ), array: a)
                index = findIndexEqualToValue(TestStruct(value:12 ), array: a)
                index = findIndexEqualToValue(TestStruct(value:707 ), array: a)
                index = findIndexEqualToValue(TestStruct(value:993 ), array: a)
            }
        }
    }

    func testValueTestStructSearchPerformance() {
        let a = _sortedTestValueStructData!
        let i = iterations
        self.measure() {
            for _ in 0...i{
                var index = findIndexEqualToValue(TestValueStruct(value:0 ), array: a)
                index = findIndexEqualToValue(TestValueStruct(value:12 ), array: a)
                index = findIndexEqualToValue(TestValueStruct(value:707 ), array: a)
                index = findIndexEqualToValue(TestValueStruct(value:993 ), array: a)
            }
        }
    }


}
