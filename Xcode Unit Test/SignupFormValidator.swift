//
//  File.swift
//  Xcode Unit Test
//
//  Created by Spemai-Macbook on 2021-08-21.
//

import Foundation

class SignupFormValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.isEmpty {
            returnValue = false
        }
        
        if firstName.count < SignupConstants.firstNameMinLength  || firstName.count > SignupConstants.firstNameMaxLength{
            returnValue = false
        }
        
        return returnValue
    }
}
