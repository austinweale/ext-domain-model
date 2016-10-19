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


}
