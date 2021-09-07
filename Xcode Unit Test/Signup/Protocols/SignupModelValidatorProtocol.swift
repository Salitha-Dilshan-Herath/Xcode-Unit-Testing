//
//  SignupModelValidatorProtocol.swift
//  Xcode Unit Test
//
//  Created by Spemai-Macbook on 2021-09-06.
//

import Foundation

protocol SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordMatch(password: String, repeatPassword: String ) -> Bool 
    
}
