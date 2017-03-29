//
//  EventModel.swift
//  CloudyNomad
//
//  Created by Bereket Ghebremedhin on 3/22/17.
//  Copyright © 2017 Bereket Ghebremedhin. All rights reserved.
//

import Foundation

//this will be the model made from the information gathered from the Meetup API 
struct Event: Parsable{
    static func parseJSON(data: Data) -> [Event]{
        return [Event]()
    }
}
