//
//  Sentence.swift
//  Pods
//
//  Created by Pierre-edouard LIEB on 24/03/2016.
//
//

import Foundation
import JSONJoy

class Sentence
{
    var source : String?
    var type : String?
    var polarity : String?
    var action : String?
    var agent : String?
    var entities : Entities?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.source = decoder["source"].string
        self.type = decoder["type"].string
        self.action = decoder["action"].string
        self.agent = decoder["agent"].string
        self.polarity = decoder["polarity"].string
        self.entities = Entities(decoder["entities"])
    }
}