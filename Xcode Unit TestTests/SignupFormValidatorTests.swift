//
//  SignupFormValidatorTests.swift
//  Xcode Unit TestTests
//
//  Created by Spemai-Macbook on 2021-08-21.
//

import XCTest
@testable import Xcode_Unit_Test

class SignupFormValidatorTests: XCTestCase {

    var sut: SignupFormValidator!
    
    override func setUp() {
        
        sut = SignupFormValidator()
        
    }
    
    override func tearDown() {
        
        sut = nil
    }

    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue()  {
        
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "jone")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have return True for valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortProvided_ShouldReturnFalse()  {
        
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
        
    }
    
    
    func testSignupFormModelValidator_WhenTooLongProvided_ShouldReturnFalse()  {
        
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "SalithaSalitha")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
        
    }
    
    
}
