//
//  SignupErrors.swift
//  Xcode Unit Test
//
//  Created by Spemai-Macbook on 2021-08-26.
//

import Foundation

enum SignupError: Error, Equatable {
    
    case responseModelParsing
    case invalidRequestURLString
    case failedRequest
    
  
}
