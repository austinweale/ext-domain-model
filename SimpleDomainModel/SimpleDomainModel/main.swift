//Austin Weale
//10/18/16
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

protocol CustomStringConvertible {
	var description: String { get set }
}


////////////////////////////////////
// Money
//
public struct Money: CustomStringConvertible {
  public var amount : Int
  public var currency : String
  private let convertToUsdMap : [String: Double] = ["GBP": 0.5, "CAN": 1.25, "EUR": 1.5, "USD": 1]
	public var description : String
	
	
	init(amount: Int, currency: String){
		self.amount = amount
		self.currency = currency
		self.description = "\(currency)\(amount)"
	}
	
  public func convert(_ to: String) -> Money {
    let usdAmount = Double(self.amount) / (convertToUsdMap[self.currency])!
		
		let convertedAmount = usdAmount * (convertToUsdMap[to])!
		
		return Money(amount: Int(convertedAmount), currency: to)
		
  }
	
	//adds the current money to the passed-in money
  public func add(_ to: Money) -> Money {
		//the passed-in Money in terms of this currency
		let inThisCurrency = self.convert(to.currency)
		let newAmount = inThisCurrency.amount + to.amount
		
		
		return Money(amount: newAmount, currency: to.currency)
  }
	
	//subtracts the current money from the passed-in Money
  public func subtract(_ from: Money) -> Money {
		let inThisCurrency = from.convert(self.currency)
		let newAmount = inThisCurrency.amount - self.amount
		
		
		return Money(amount: newAmount, currency: self.currency)
  }
}

////////////////////////////////////
// Job
//
open class Job: CustomStringConvertible {
  fileprivate var title : String
  fileprivate var type : JobType
	public var description: String

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
		
		func get() -> Double{
			switch self {
			case .Hourly(let num):
				return num
			case .Salary(let num):
				let doubleAmount = Double(num)
				return doubleAmount
			}
		}
		
		var description : String {
			switch self {
				case .Hourly(let num): return "Hourly";
				case .Salary(let num): return "Salary";
			}
		}
  }
	
  public init(title : String, type : JobType) {
		self.title = title
		self.type = type
		self.description = "\(self.title), \(self.type.description)"
  }
	
  open func calculateIncome(_ hours: Int) -> Int {
		if self.type.description == "Salary" {
			return Int(self.type.get())
		}else{
			return Int(Double(hours) * self.type.get())
		}
  }
	
  open func raise(_ amt : Double) {
		if self.type.description == "Salary"  {
			let newAmount = self.type.get() + amt
			let integerAmount = Int(newAmount)
			self.type = JobType.Salary(integerAmount)
		}else{
			self.type = JobType.Hourly(self.type.get() + amt)
		}
  }
}

////////////////////////////////////
// Person
//
open class Person: CustomStringConvertible {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0
	public var description : String

  fileprivate var _job : Job? = nil
  open var job : Job? {
		get {
			if(_job == nil){
				return nil
			}else{
				return _job
			}
			
		}
    set(value) {
			if(self.age >= 16){
				_job = value
			}
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get {
			if(_spouse == nil){
				return nil
			}else{
				return _spouse
			}
		}
    set(value) {
			if self.age >= 18 {
				_spouse = value
			}
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
		self.description = "\(firstName) \(lastName), \(age)"
  }
	
	//[Person: firstName:Ted lastName:Neward age:45 job:nil spouse:nil]
  open func toString() -> String {
		return "[Person: firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age) job:\(self.job) spouse:\(self.spouse)]"
  }
}

////////////////////////////////////
// Family
//
open class Family: CustomStringConvertible {
  fileprivate var members : [Person] = []
	var description: String
  
  public init(spouse1: Person, spouse2: Person) {
		if spouse1.spouse == nil && spouse2.spouse == nil {
			spouse1.spouse = spouse2
			spouse2.spouse = spouse1
			self.members.append(spouse1)
			self.members.append(spouse2)
		}
		self.description = "\(spouse1.description), \(spouse2.description)"
  }
	
  open func haveChild(_ child: Person) -> Bool {
		var over21: Bool = false
		if(self.members.count > 0){
			for i in 0...self.members.count - 1 {
				if self.members[i].age >= 21{
					over21 = true
				}
			}
		}
		if(over21){
			self.members.append(child)
			self.description = "\(self.description), \(child.description)"
		}
		return over21
  }
	
  open func householdIncome() -> Int {
		var totalIncome = 0
		if(self.members.count > 0){
			
			for i in 0...self.members.count - 1 {
				if(members[i].job != nil){
					
					totalIncome += self.members[i].job!.calculateIncome(2000)
				}
			}
		}
		print(totalIncome)
		return totalIncome
  }
}





