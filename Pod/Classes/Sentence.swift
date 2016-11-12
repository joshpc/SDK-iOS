//
//  Sentence.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import JSONJoy

/**
 Class Sentence
 
 Sentence sent to through the request
 */
open class Sentence
{
    open var source : String?
    open var type : String?
    open var polarity : String?
    open var action : String?
    open var agent : String?
    open var entities : Entities?
        
    /**
     Init
     
     Init class with JSONDecoder to parse JSON
     */
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
