//
//  LoginViewModelTests.swift
//  FirstUIKitProjTests
//
//  Created by Bhushan Abhyankar on 13/11/2024.
//
/*
 Test cases- XCTest framework
 1.Unit Tests - here we will be checking the business logic part
 2.UI Tests - here we will check if our designed UI elemnts exists on screen, or if there are clickable or interactable or not, or we will check of certain UI flows happens or not
 
 A.TDD - test driven development
 we write the test cases first, then we make those fail. then write the logic , then make ur test case work and then repate the same cycle
 
 Red Green Refractor aapoch
 
 Retro TDD
 Given When then approch
 
 B. BDD- Behavioural Driven Development
 
 */

import XCTest
@testable import FirstUIKitProj

final class LoginViewModelTests: XCTestCase {

    var loginViewModel:LoginViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("inside setUpWithError")
        
        //Given
        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("inside tearDownWithError")
        loginViewModel = nil

    }

    func testFirstTestCase() throws {
        print("executing testExample")
        //When
        let expecation = expectation(description: "When my credentials are correct I'm expecting correct output")
        let isValid = loginViewModel.isCredentialsValid(emailID: "abc@gmail.com", password: "1235446")
        
        //Then
        XCTAssertTrue(isValid)
        expecation.fulfill()
        
        wait(for: [expecation])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
