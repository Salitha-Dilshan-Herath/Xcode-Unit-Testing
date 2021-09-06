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
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.isEmpty {
            returnValue = false
        }
        
        if lastName.count < SignupConstants.lastNameMinLength  || lastName.count > SignupConstants.lastNameMaxLength{
            returnValue = false
        }
        
        return returnValue
    }
    
    func isPasswordValid(password: String) -> Bool {
        
        
        if password.isEmpty {
            return false
        }
        
        if password.count > SignupConstants.passwordMinLength {
            return false
        }
        
        if password.count < SignupConstants.passwordMaxLength {
            return false
        }
        
        return true
    }
    
    func doPasswordMatch(password: String, repeatPassword: String ) -> Bool {
        
        return password == repeatPassword
        
    }
}
