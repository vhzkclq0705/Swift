//
//  main.swift
//  ReferenceCounting
//
//  Created by 권오준 on 2024-08-19.
//

import Foundation

// MARK: - 참조와 복사

//class C {
//    var v = 10
//}
//
//var a = C()
//var b = a
//
//print(a.v)
//print(b.v)
//
//a.v = 20
//
//print(a.v)
//print(b.v)
//
//b.v = 30
//
//print(a.v)
//print(b.v)

class AClass {
    var a: Int
    
    init(a: Int) {
        self.a = a
    }
    
    func updateA(a newValue: Int) {
        self.a = newValue
    }
}

struct AStruct {
    var a: Int
    
    mutating func updateA(a newValue: Int) {
        self.a = newValue
    }
}

var aClass1 = AClass(a: 10)
var aClass2 = aClass1

var aStruct1 = AStruct(a: 10)
var aStruct2 = aStruct1

print(aClass1.a)
print(aClass2.a)

print(aStruct1.a)
print(aStruct2.a)

aClass2.updateA(a: 20)
aStruct2.updateA(a: 20)

print(aClass1.a)
print(aClass2.a)

print(aStruct1.a)
print(aStruct2.a)



// MARK: - 배열 추가 시간 비교

//final class DummyClass {}
//
//class TempClass {
//    var dummyClass = DummyClass()
//    var dummyClass2 = DummyClass()
//    var dummyClass3 = DummyClass()
//}
//
//struct TempStruct {
//    var dummyClass = DummyClass()
//    var dummyClass2 = DummyClass()
//    var dummyClass3 = DummyClass()
//}
//
//func measureReferencesOfClassTime() {
//    var array = [TempClass]()
//    let object = TempClass()
//    for _ in 0..<100000000 {
//        array.append(object)
//    }
//}
//
//func measureCopiesOfStructTime() {
//    var array = [TempStruct]()
//    let object = TempStruct()
//    for _ in 0..<100000000 {
//        array.append(object)
//    }
//}
//
//let clock = ContinuousClock()
//
//let time1 = clock.measure {
//    measureReferencesOfClassTime()
//}
//print("ReferencesOfClass: \(time1)")
//
//let time2 = clock.measure {
//    measureCopiesOfStructTime()
//}
//print("CopiesOfStruct: \(time2)")
