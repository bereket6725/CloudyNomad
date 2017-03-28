//
//  GetRequestable.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/27/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire
//makes get requests
protocol GetRequestable{
    associatedtype P: Parsable
    static func get(builder: RequestBuildable, completion: @escaping(Result<[P], RequestError>) -> Void)
}

extension GetRequestable{
    static func requestData(builder: RequestBuildable, completion: @escaping (Result<Data, RequestError>) -> Void){
        guard let url = builder.endpoint else { completion(.failure(.invalidURL)); return }
        let type = builder.requestType
        switch type{
        case .get:
            Alamofire.request(url).responseJSON{ response in
                guard let rawData = response.data else {completion(.failure(.invalidData)); return }
                completion(.success(rawData))
            }
        //only get requests, otherwise kill the app
        default: fatalError("invalid request type: \(type). Expected .get")
        }
    }
}
