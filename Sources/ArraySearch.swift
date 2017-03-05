/*
 This source file is part of the Bezr open source project

 Copyright (c) 2014 - 2017 Regwez, Inc.
 Licensed under Apache License v2.0 with Runtime Library Exception

 Created by Ragy Eleish on 8/6/14.

*/


/*
  A function that performs an EQUAL search on a sorted array.
*/
public func findIndexEqualToValue<T: Comparable>(_ value:T ,array:[T], startRange:Int, endRange:Int)->Int?{
    var localStartRange = startRange
    var localEndRange = endRange
    var index = -1
    if (array[0] > value || array[localEndRange-1] < value) {
        return nil
    }
    while (localEndRange>=localStartRange) {
        let rangeSpan = localEndRange-localStartRange
        index = localStartRange+(rangeSpan)/2
        if (array[index] == value) {
            return index
        }else if(array[index] < value){
            localStartRange = index+1
        }else{
            localEndRange = index-1
        }
    }

    return nil
}


/*
  A function that performs an EQUAL search on a sorted array.
*/

public func findIndexEqualToValue<T: Comparable>(_ value:T ,array:[T])->Int?{
   // return findIndexEqualToValue(value, array: array, startRange:0, endRange:array.count)
    var startRange = 0
    var endRange = array.count
    var index = -1
    if (array[0] > value || array[endRange-1] < value) {
       return nil
    }
    while (endRange>=startRange) {
        let rangeSpan = endRange-startRange
        index = startRange+(rangeSpan)/2
        if (array[index] == value) {
            return index
        }else if(array[index] < value){
            startRange = index+1
        }else{
            endRange = index-1
        }
    }

    return nil
}

/*
  A function that performs an LESS-THAN search on a sorted array.
*/

public func findIndexLessThanValue<T: Comparable>(_ value:T ,array:[T])->Int?{
    var startRange = 0
    var endRange = array.count
     var index = -1
    if (array[0] >= value) {
        return nil
    }
    if (array[endRange-1] < value) {
        return endRange-1
    }
    while (startRange <= endRange) {
        let rangeSpan = endRange-startRange
        index = startRange+(rangeSpan)/2
        if (array[index]==value) {
            return index-1
        }else if(array[index]<value){
            if (rangeSpan<=2) {
                return index
            }
            startRange=index
        }else{
            endRange=index
        }
    }

    return nil
}

/*
  A function that performs an LESS-OR-EQUAL search on a sorted array.
*/

public func findIndexLessOrEqualToValue<T: Comparable>(_ value:T ,array:[T])->Int?{
    var startRange = 0
    var endRange = array.count
    var index = -1
    if (array[0]>value) {
        return nil
    }
    if (array[endRange-1]<=value) {
        return endRange-1
    }
    while (startRange<endRange) {
        let rangeSpan = endRange-startRange
        index = startRange+(rangeSpan)/2
        if (array[index]==value) {
            return index
        }else if(array[index]<value){
            if (rangeSpan<=2) {
                return index
            }
            startRange=index
        }else{

            endRange=index
        }
    }

    return nil
}

/*
  A function that performs an GREATER-THAN search on a sorted array.
*/

public func findIndexGreaterThanValue<T: Comparable>(_ value:T ,array:[T])->Int?{
    var startRange = 0
    var endRange = array.count
    var index = -1
    if (array[0]>value) {
        return 0
    }
    if (array[endRange-1]<=value) {
        return nil
    }
    while (startRange<=endRange) {
        let rangeSpan = endRange-startRange
        index = startRange+(rangeSpan)/2
        if (array[index]==value) {
            return index+1
        }else if(array[index]<value){
            startRange=index+1
        }else{
            if (rangeSpan<=1) {
                return index
            }
            endRange=index
        }
    }

    return nil
}

/*
  A function that performs an GREATER-OR-EQUAL search on a sorted array.
*/

public func findIndexGreaterOrEqualToValue<T: Comparable>(_ value:T ,array:[T])->Int?{
    var startRange = 0
    var endRange = array.count
    var index = -1
    if (array[0]>=value) {
        return 0
    }
    if (array[endRange-1]<value) {
        return nil
    }
    while (startRange <= endRange) {
        let rangeSpan = endRange-startRange
        index = startRange+(rangeSpan)/2
        if (array[index] == value) {
            return index
        }else if(array[index]<value){
            startRange = index+1
        }else{
            if (rangeSpan<2) {
                return index
            }
            endRange=index
        }
    }

    return nil
}
