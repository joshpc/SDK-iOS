//
//  RecastAPI.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import SwiftHTTP
import JSONJoy

public class RecastAPI
{
    private let url : String = "https://api.recast.ai/request"
    private let token : String
    private weak var delegate : HandlerRecastRequestProtocol?
    
    public init (token : String, handlerRecastRequestProtocol : HandlerRecastRequestProtocol)
    {
        self.token = token
        self.delegate = handlerRecastRequestProtocol
    }
    
    public func makeRequest(request : String)
    {
        do
        {
            let param = ["text" : request]
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            let opt = try HTTP.POST(self.url, parameters: param, headers: ["Authorization" : "Token " + self.token], requestSerializer: JSONParameterSerializer())
            opt.start
            {
                response in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                if let err = response.error
                {
                    dispatch_async(dispatch_get_main_queue())
                    {
                        self.delegate?.recastRequestError(err)
                    }
                }
                else
                {
                    dispatch_async(dispatch_get_main_queue())
                    {
                        self.delegate?.recastRequestDone(Response(JSONDecoder(response.data)))
                    }
                }
            }
        }
        catch let error
        {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            let er = error as NSError
            self.delegate?.recastRequestError(er)
        }
    }
}

