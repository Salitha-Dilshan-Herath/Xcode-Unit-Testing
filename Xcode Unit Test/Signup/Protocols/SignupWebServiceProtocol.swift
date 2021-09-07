//
//  SignupWebServiceProtocol.swift
//  Xcode Unit Test
//
//  Created by Spemai-Macbook on 2021-09-07.
//

import Foundation

protocol SignupWebServiceProtocol {
    
    func signup(withForm fromModel: SignupFormRequestModel, completionHandler: @escaping(SignupResponseModel?, SignupError?) -> Void )
}
