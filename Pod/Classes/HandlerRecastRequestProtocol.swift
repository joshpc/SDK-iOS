//
//  HandlerRecastRequestProtocol.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation

//Protocol to implement to get back to current ViewController
public protocol HandlerRecastRequestProtocol : class
{
    func recastRequestDone(response : Response)
    
    func recastRequestError(error : NSError)
}