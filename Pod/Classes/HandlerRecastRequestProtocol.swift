//
//  HandlerRecastRequestProtocol.swift
//  Pods
//
//  Created by Pierre-edouard LIEB on 24/03/2016.
//
//

import Foundation

protocol HandlerRecastRequestProtocol : class
{
    func recastRequestDone(response : Response)
    
    func recastRequestError(error : NSError)
}