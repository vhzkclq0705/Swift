//
//  main.swift
//  ReferenceCounting
//
//  Created by 권오준 on 2024-08-19.
//

import Foundation

// MARK: - 상속

//class Vehicle {
//    func honk() {
//        print("경적소리")
//    }
//}
//
//class Car: Vehicle {
//    override func honk() {
//        print("빵빵~")
//    }
//}
//
//class Bicycle: Vehicle {
//    override func honk() {
//        print("따릉따릉~")
//    }
//}
//
//var v = Vehicle()
//var c = Car()
//var b = Bicycle()
//
//v.honk()
//c.honk()
//b.honk()

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

//class AClass {
//    var a: Int
//    
//    init(a: Int) {
//        self.a = a
//    }
//    
//    func updateA(a newValue: Int) {
//        self.a = newValue
//    }
//}
//
//struct AStruct {
//    var a: Int
//    
//    mutating func updateA(a newValue: Int) {
//        self.a = newValue
//    }
//}
//
//var aClass1 = AClass(a: 10)
//var aClass2 = aClass1
//
//var aStruct1 = AStruct(a: 10)
//var aStruct2 = aStruct1
//
//print(aClass1.a)
//print(aClass2.a)
//
//print(aStruct1.a)
//print(aStruct2.a)
//
//aClass2.updateA(a: 20)
//aStruct2.updateA(a: 20)
//
//print(aClass1.a)
//print(aClass2.a)
//
//print(aStruct1.a)
//print(aStruct2.a)



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

// MARK: - 클래스 구조체

func address(_ object: AnyObject) {
    print(Unmanaged.passUnretained(object).toOpaque())
}

//class ExamplaryClass {
//    var a: Int
//    
//    init(a: Int) {
//        self.a = a
//    }
//    
//    func updateA(_ a: Int) {
//        self.a = a
//    }
//}
//
//let exampleClass = ExamplaryClass(a: 10)
//let reference = exampleClass
//
//print(exampleClass.a)
//print(reference.a)
//
//exampleClass.updateA(20)
//
//print(exampleClass.a)
//print(reference.a)
//
//reference.updateA(30)
//
//print(exampleClass.a)
//print(reference.a)
//
//address(exampleClass)
//address(reference)
//
//struct ExamplaryStruct {
//    var a: Int
//    
//    mutating func updateA(_ a: Int) {
//        self.a = a
//    }
//}
//
///// let은 에러 발생
//var exampleStruct = ExamplaryStruct(a: 10)
//var copy = exampleStruct
//
//exampleStruct.updateA(20)
//
//print(exampleStruct.a)
//print(copy.a)
//
//copy.updateA(30)
//
//print(exampleStruct.a)
//print(copy.a)

// 구조체는 불가능
//address(exampleStruct)
//address(copy)

// MARK: - 참조 카운트 계산

//class AClass {
//    var bClass: BClass? = nil
//    
//    init() {
//        print("AClass 메모리 할당")
//    }
//    
//    deinit {
//        print("AClass 메모리 해제")
//    }
//}
//
//class BClass {
//    var aClass: AClass? = nil
//    
//    init() {
//        print("BClass 메모리 할당")
//    }
//    
//    deinit {
//        print("BClass 메모리 해제")
//    }
//}
//
//var a: AClass? = AClass()
//var b: BClass? = BClass()
//
//print(CFGetRetainCount(a))
//print(CFGetRetainCount(b))
//
//address(a!)
//address(b!)
//
//a?.bClass = b
//b?.aClass = a
//
//print(CFGetRetainCount(a))
//print(CFGetRetainCount(b))
//
//address(a!.bClass!)
//address(b!.aClass!)
//
//a?.bClass = nil
//b?.aClass = nil
//
//print(CFGetRetainCount(a))
//print(CFGetRetainCount(b))
//
//a = nil
//b = nil

class DummyClass { }

class ExamplaryClass {
    let dummyClass1 = DummyClass()
    let dummyClass2 = DummyClass()
    let dummyClass3 = DummyClass()
}

let examplaryClass = ExamplaryClass()
let reference1 = examplaryClass
let reference2 = examplaryClass
let reference3 = examplaryClass

address(examplaryClass)
address(reference1)
address(reference2)
address(reference3)

print(CFGetRetainCount(examplaryClass))
print(CFGetRetainCount(examplaryClass.dummyClass1))
print(CFGetRetainCount(examplaryClass.dummyClass2))
print(CFGetRetainCount(examplaryClass.dummyClass3))

struct ExamplaryStruct {
    let dummyClass1 = DummyClass()
    let dummyClass2 = DummyClass()
    let dummyClass3 = DummyClass()
}

let examplaryStruct = ExamplaryStruct()
let copy1 = examplaryStruct
let copy2 = examplaryStruct
let copy3 = examplaryStruct

address(examplaryStruct.dummyClass1)
address(copy1.dummyClass1)
address(copy2.dummyClass1)
address(copy3.dummyClass1)

//print(CFGetRetainCount(examplaryStruct))
print(CFGetRetainCount(examplaryStruct.dummyClass1))
print(CFGetRetainCount(examplaryStruct.dummyClass2))
print(CFGetRetainCount(examplaryStruct.dummyClass3))


