//
//  SignupWebServiceTests.swift
//  Xcode Unit TestTests
//
//  Created by Spemai-Macbook on 2021-08-26.
//

import XCTest
@testable import Xcode_Unit_Test

class SignupWebServiceTests: XCTestCase {

    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!
    
    override func setUp()  {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
     
        signupFormRequestModel = SignupFormRequestModel(firstName: "Johe", lastName: "Doe", email: "sa@sa.com", password: "12345678")
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }


    func testSignupWebService_WhenGivenSuccessFullResponse_ReturnSuccess()  {
        
        //Arrange

        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        //Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation ], timeout: 5)
    }
    
    func testSignupWebService_WhenReceiveDifferentJSOResponse_ErrorTookPlace()  {
        
        //Arrange
        let jsonString = "{\"description\":\"error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        //Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            //Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.responseModelParsing, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation ], timeout: 5)
    }
    
    func testSignupWebService_WhenProvideEmptyURLString_ReturnsError()  {
        
        //Arrange
        sut = SignupWebService(urlString: "")
        
        let expectation = self.expectation(description: "An empty URL string expectation")

        
        //Act
        sut.signup(withForm: signupFormRequestModel) { signupResponseModel, error in
            
            //Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(signupResponseModel, "When an invalidRequestURLString taken place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription()  {
        
        //Arrange
        
        let expectation = self.expectation(description: "A failed Request expectation")
        MockURLProtocol.error = SignupError.failedRequest
        
        //Act
        sut.signup(withForm: signupFormRequestModel) { SignupResponseModel, error in
            
            
            XCTAssertEqual(error, SignupError.failedRequest, "The Signup() method did not return an expected error for the failed request")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
}
