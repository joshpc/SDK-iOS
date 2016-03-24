//
//  Entities.swift
//  Pods
//
//  Created by Pierre-edouard LIEB on 24/03/2016.
//
//

import Foundation
import JSONJoy

class Entities
{
    var location : [Location]?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        if let lctn = decoder["location"].array
        {
            self.location = [Location]()
            for lctnDecoder in lctn
            {
                self.location?.append(Location(lctnDecoder))
            }
        }
    }
}