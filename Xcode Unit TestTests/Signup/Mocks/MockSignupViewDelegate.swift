//
//  MockSignupViewDelegate.swift
//  Xcode Unit TestTests
//
//  Created by Spemai-Macbook on 2021-09-07.
//

import Foundation
import XCTest
@testable import Xcode_Unit_Test

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var signupError: SignupError?
    var successfulSignupCount = 0
    var errorHandlerCount = 0

    
    func successfulSignup() {
        successfulSignupCount += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        errorHandlerCount += 1
        signupError = error
        expectation?.fulfill()
    }
    
}
