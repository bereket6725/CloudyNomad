//
//  Networkable.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation
import Alamofire

//for models that handle get and post requests. perhaps as we scale we could add more request types,
//we can expand what this inherits from
protocol Networkable: GetRequestable, PostRequestable{
}


