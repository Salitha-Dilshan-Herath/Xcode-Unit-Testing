//
//  SignupWebService.swift
//  Xcode Unit Test
//
//  Created by Spemai-Macbook on 2021-08-26.
//

import Foundation

class SignupWebService: SignupWebServiceProtocol  {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString  = urlString
        self.urlSession = urlSession
    }
    
    func signup(withForm fromModel: SignupFormRequestModel, completionHandler: @escaping(SignupResponseModel?, SignupError?) -> Void ) {
        
        guard let url = URL(string: urlString) else {
            //TODO: Create a unit test to test that a specific error message is returned is URL is nil
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(fromModel)
        
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completionHandler(nil, SignupError.failedRequest)
                return
            }
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                
                completionHandler(signupResponseModel, nil)
            } else {
                
                //TODO: Create a new Unit Test to handle an error here
                completionHandler(nil, SignupError.responseModelParsing)
            }
        }
        
        dataTask.resume()
    }
}
