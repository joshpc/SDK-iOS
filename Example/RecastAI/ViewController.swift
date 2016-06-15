//
//  ViewController.swift
//  RecastAI
//
//  Created by plieb on 03/29/2016.
//  Copyright (c) 2016 plieb. All rights reserved.
//

import UIKit
import RecastAI

/**
Class ViewController Example of implementations for Text & Voice Requests
 */
class ViewController: UIViewController, HandlerRecastRequestProtocol
{
    //Outlets
    @IBOutlet weak var requestTextField: UITextField!
    
    //Vars
    var bot : RecastAIClient?
    var recording : Bool = true

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bot = RecastAIClient(token : "YOUR_BOT_TOKEN", handlerRecastRequestProtocol: self)
        self.bot = RecastAIClient(token : "YOUR_BOT_TOKEN", handlerRecastRequestProtocol: self, language: "en")
    }
    
    /**
     Method called when the request was successful
     
     - parameter response: the response returned from the Recast API
     
     - returns: void
     */
    func recastRequestDone(response : Response)
    {
        print(response.source)
        print(response.language)
        print(response.intents)
    }
    
    /**
     Method called when the request failed
     
     - parameter error: error returned from the Recast API
     
     - returns: void
     */
    func recastRequestError(error : NSError)
    {
        print("Delegate Error : \(error)")
    }
    
    /**
     Make text request to Recast.AI API
     */
    @IBAction func makeRequest()
    {
        if (!(self.requestTextField.text?.isEmpty)!)
        {
            //Call makeRequest with string parameter to make a text request
            self.bot?.textRequest(self.requestTextField.text!)
            self.bot?.textRequest(self.requestTextField.text!, lang: "en")
        }
    }
    
    /**
     Make Voice request to Recast.AI API
     */
    @IBAction func makeVoiceRequest()
    {
        if (self.recording)
        {
            self.recording = !self.recording
            //Call startStreamRequest to start recording your voice
            self.bot!.startStreamRequest()
        }
        else
        {
            self.recording = !self.recording
            //Call stopStreamRequest to stop recording your voice and launch the request to the Recast.AI API
            self.bot!.stopStreamRequest()
        }
    }
}
