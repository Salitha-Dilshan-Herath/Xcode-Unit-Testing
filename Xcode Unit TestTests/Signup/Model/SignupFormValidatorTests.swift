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
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "jone")
        
        //Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have return True for valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortProvided_ShouldReturnFalse()  {

        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
        
    }
    
    
    func testSignupFormModelValidator_WhenTooLongProvided_ShouldReturnFalse()  {
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "SalithaSalitha")
        
        //Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue()  {
        
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "doe")
        
        //Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have return True for valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortProvidedLastName_ShouldReturnFalse()  {
        
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "S")
        
        //Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
        
    }
    
    
    func testSignupFormModelValidator_WhenTooLongProvidedLastName_ShouldReturnFalse()  {
        
        //Act
        let isLastNameValid = sut.isLastNameValid(lastName: "SalithaSalitha")
        
        //Assert
        XCTAssertFalse(isLastNameValid, "The isFirstNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortProvidedPassword_ShouldReturnFalse()  {
        
        //Act
        let isPasswordValid = sut.isPasswordValid(password: "12")
        
        //Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) characters but it has returned TRUE")
        
    }
    
    
    func testSignupFormModelValidator_WhenTooLongProvidedPassword_ShouldReturnFalse()  {

        //Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678909")
        
        //Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordProvided_ShouldReturnTrue()  {
        
        //Act
        let doPasswordMatch = sut.doPasswordMatch(password: "12345678",repeatPassword: "12345678" )
        
        //Assert
        XCTAssertTrue(doPasswordMatch, "The doPasswordMatch() should have returned TRUE for a matching password but it has returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenNotEqualPasswordProvided_ShouldReturnFalse()  {
        
        //Act
        let doPasswordMatch = sut.doPasswordMatch(password: "123456",repeatPassword: "12345678" )
        
        //Assert
        XCTAssertFalse(doPasswordMatch, "The doPasswordMatch() should have returned FALSE for a not matching password but it has returned TRUE")
        
    }
    
}
