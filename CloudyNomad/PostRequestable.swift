//
//  PostRequestable.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/27/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire

protocol PostRequestable{
    static func post(builder: RequestBuildable, completion: @escaping(Result<Void, RequestError>) -> Void)
}

extension PostRequestable{
    static func updateData(builder: RequestBuildable, completion: @escaping(Result<Void, RequestError>) -> Void){
        guard let url = builder.endpoint else { completion(.failure(.invalidURL)); return }
        var params : [String: Any]?
        
        switch builder.requestType{
        case .post(let parameters): params = parameters
        default: fatalError("invalid Request type: \(builder.requestType) expected .post")
        }
        Alamofire.request(url, method: builder.requestType.methodType, parameters: params).responseJSON{ response in
            if response.response?.statusCode == 201 {
                completion(.success())
            }
            else{
                completion(.failure(.defaultRequestError))
            }
        }
    }
}
