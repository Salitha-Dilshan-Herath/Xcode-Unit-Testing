//
//  SignupViewDelegateProtocol.swift
//  Xcode Unit Test
//
//  Created by Spemai-Macbook on 2021-09-07.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    
    func successfulSignup()
    func errorHandler(error: SignupError)
}
