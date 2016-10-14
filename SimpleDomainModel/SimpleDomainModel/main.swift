//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}


////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
  private let convertToUsdMap : [String: Double] = ["GBP": 0.5, "CAN": 1.25, "EUR": 1.5, "USD": 1]
	
	
	init(amount: Int, currency: String){
		self.amount = amount
		self.currency = currency
	}
  public func convert(_ to: String) -> Money {
    let usdAmount = Double(self.amount) / (convertToUsdMap[self.currency])!
		
		let convertedAmount = usdAmount * (convertToUsdMap[to])!
		
		return Money(amount: Int(convertedAmount), currency: to)
		
  }
	
	//adds the current money to the passed-in money
  public func add(_ to: Money) -> Money {
		
  }
	
	//subtracts the current money from the passed-in Money
  public func subtract(_ from: Money) -> Money {
  }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
  }
  
  open func raise(_ amt : Double) {
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}





