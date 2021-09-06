//
//  SignupFormRequestModel.swift
//  Xcode Unit Test
//
//  Created by Spemai-Macbook on 2021-08-26.
//

import Foundation

struct SignupFormRequestModel: Encodable {

    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
