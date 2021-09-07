//
//  SignupPresenter.swift
//  Xcode Unit Test
//
//  Created by Spemai-Macbook on 2021-09-06.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator : SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private var delegate: SignupViewDelegateProtocol
    
    init(formModelValidator: SignupModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel)  {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            
            return 
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            
            return
        }
        
        if !formModelValidator.doPasswordMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webService.signup(withForm: requestModel) {[weak self] responseModel, error in
            
            if responseModel != nil {
                self?.delegate.successfulSignup()
             
            } else {
                self?.delegate.errorHandler(error: error!)
               
            }
        }
    }
    
}
