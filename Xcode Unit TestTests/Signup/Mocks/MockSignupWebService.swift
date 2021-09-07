//
//  MockSignupWebService.swift
//  Xcode Unit TestTests
//
//  Created by Spemai-Macbook on 2021-09-07.
//

import Foundation
@testable import Xcode_Unit_Test

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    var isErrorResponse: Bool = false

    func signup(withForm fromModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        
        isSignupMethodCalled = true
        
        if isErrorResponse {
          
            let error = SignupError.failedRequest
            completionHandler (nil, error)

        } else {
            
            let responseModel = SignupResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
            
        }
        
    }
    
}
