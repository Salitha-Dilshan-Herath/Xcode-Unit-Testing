//
//  SignupPresenterTests.swift
//  Xcode Unit TestTests
//
//  Created by Spemai-Macbook on 2021-09-06.
//

import XCTest
@testable import Xcode_Unit_Test

class SignupPresenterTests: XCTestCase {

    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!

    override func setUp() {
         signupFormModel = SignupFormModel(firstName: "Johe",
                                              lastName: "Doe",
                                              email: "sa@sa.com",
                                              password: "12345678",
                                              repeatPassword:"12345678")
        
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()

        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService, delegate: mockSignupViewDelegate)
    }

    override func tearDown() {
        
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }


    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
    
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not validate if password match")
        
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        
  
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled, "The signup() method was not called in SignupWebService class")
        
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate()  {
        
        //Arrange
        let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCount, 1, "The successful method call more than 1")
    }
    
    func testSignupPresenter_WhenSignupOperationFails_ShouldCallErrorOnDelegate()  {
        
        //Arrange
        let myExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        mockSignupWebService.isErrorResponse = true
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCount, 0, "The successful method call")
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCount, 1, "The error handler method call more than 1")
        XCTAssertNotNil(mockSignupViewDelegate.signupError)

    }
}
