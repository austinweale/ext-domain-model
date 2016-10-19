//
//  ConvertibleTests.swift
//  SimpleDomainModel
//
//  Created by Austin Weale on 10/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import XCTest

import SimpleDomainModel

class ConvertibleTests: XCTestCase {


    func testMoneyDescription() {
			
				let money = Money(amount: 22, currency: "EUR")
				XCTAssert(money.description == "EUR22")
    }
	
		func testJobDescription() {
		
			let job = Job(title: "teacher", type: Job.JobType.Salary(1000))
			XCTAssert(job.description == "teacher, Salary")
		}
	
	
	func testPersonDescription(){
		let person = Person(firstName: "Austin", lastName: "Weale", age: 23)
		XCTAssert(person.description == "Austin Weale, 23")
	}
	
	func testFamilyDescription(){
		let person1 = Person(firstName: "Brad", lastName: "Pitt", age: 45)
		let person2 = Person(firstName: "Angelina", lastName: "Jolie", age: 45)
		let family = Family(spouse1: person1, spouse2: person2)
		XCTAssert(family.description == "Brad Pitt, 45, Angelina Jolie, 45")
		
	}
	
	func testAddMoney(){
		let money1 = Money(amount: 20, currency: "EUR")
		let money2 = Money(amount: 10, currency: "EUR")
		let money3 = money1.add(money2)
		XCTAssert(money3.description == "EUR30")
	}
	
	func testSubtractMoney(){
		let money1 = Money(amount: 20, currency: "EUR")
		let money2 = Money(amount: 10, currency: "EUR")
		let money3 = money2.subtract(money1)
		XCTAssert(money3.description == "EUR10")
	}


}
