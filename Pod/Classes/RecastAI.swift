//
//  RecastAPI.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import JSONJoy
import Alamofire

/**
 RecastAIClient class handling request to the API
 */
open class RecastAIClient
{
    private let url : String = "https://api.recast.ai/v1/request"
    private let url_voice : String = "ws://api.recast.ai/v1/request"
    private let token : String
    private let language : String?
    private weak var delegate : HandlerRecastRequestProtocol?
    private weak var delegateVoiceFile : HandlerRecastRequestProtocol?
    var audio : AudioFile = AudioFile()
    
    /**
     Init RecastAPI Class for text
     
     - parameter token: your bot token
     - parameter handlerRecastRequestProtocol: class that handles the protocol
     
     - returns: void
     */
    public init (token : String, handlerRecastRequestProtocol : HandlerRecastRequestProtocol, language : String? = nil)
    {
        self.token = token
        self.delegate = handlerRecastRequestProtocol
        self.language = language
    }
    
    /**
     Make a request to Recast API
     
     - parameter request: sentence to send to Recast API
     
     - returns: void
     */
    open func textRequest(_ request : String, lang: String? = nil)
    {
        var param = ["text" : request]
        if let ln = lang
        {
            param = ["text" : request, "language" : lang!]
        }
        else if let ln = self.language
        {
            param = ["text" : request, "language" : self.language!]
        }
		
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
		Alamofire.request(url, method: .post, parameters: param, encoding: URLEncoding.default, headers: ["Authorization" : "Token " + self.token]).responseJSON { response in
			UIApplication.shared.isNetworkActivityIndicatorVisible = false
			
			if let error = response.result.error as? NSError {
				debugPrint("\(error)")
				self.delegate?.recastRequestError(error: error)
			}
			else {
				let res = Results(JSONDecoder(response.data!))
				let json = try! JSONSerialization.jsonObject(with: response.data!, options:.mutableContainers) as! [String : AnyObject]
				res.results?.raw = json["results"] as? [String : AnyObject]
				self.delegate?.recastRequestDone(response: res.results!)
			}
		}
    }
 
    /**
     Start voice recording
     
     - returns: void
     */
    open func startStreamRequest()
    {
        audio.recordAudio()
    }
    
    /**
     Stop voice recording and make the request to Recast.AI API and parse JSON response into Response object
     
     - returns: void
     */
    open func stopStreamRequest()
    {
        audio.stopAudio()
        let headers = ["Authorization": "Token " + self.token]
        let parameters : [String : String]
        if let ln = self.language
        {
            parameters = ["language" : self.language!]
        }
		Alamofire.upload(multipartFormData: { (multipartFormData: MultipartFormData) in
			multipartFormData.append(self.audio.path, withName: "voice")
		}, to: url) { encodingResult in
			switch encodingResult {
			case .success(let upload, _, _):
				upload.responseJSON { response in
					debugPrint(response)
					let res = Results(JSONDecoder(response.data!))
					self.delegate?.recastRequestDone(response: res.results!)
				}
			case .failure(let encodingError):
				print(encodingError)
				let er = encodingError as NSError
				self.delegate?.recastRequestError(error: er)
			}
		}
	}
}

