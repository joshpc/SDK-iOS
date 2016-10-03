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
class ViewController: UIViewController
{
    //Outlets
    @IBOutlet weak var requestTextField: UITextField!
    
    //Vars
    var bot : RecastAIClient?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bot = RecastAIClient(token : "YOUR_TOKEN")
        self.bot = RecastAIClient(token : "YOUR_TOKEN", language: "en")
    }
    
    /**
     Method called when the request was successful
     
     - parameter response: the response returned from the Recast API
     
     - returns: void
     */
    func recastRequestDone(_ response : Response)
    {
        print(response)
        print(response.language)
        print(response.intent())
        print(response.entities)
    }
    
    /**
     Method called when the request failed
     
     - parameter error: error returned from the Recast API
     
     - returns: void
     */
    func recastRequestError(_ error : Error)
    {
        print("Error : \(error)")
    }
    
    /**
     Make text request to Recast.AI API
     */
    @IBAction func makeRequest()
    {
        if (!(self.requestTextField.text?.isEmpty)!)
        {
            //Call makeRequest with string parameter to make a text request
            self.bot?.textRequest(self.requestTextField.text!, successHandler: recastRequestDone, failureHandle: recastRequestError)
        }
    }
    
    /**
     Make File request to Recast.AI API
     */
    func makeFileRequest()
    {
        if (!(self.requestTextField.text?.isEmpty)!)
        {
            let url = URL(string: self.requestTextField.text!)!
            //Call makeRequest with string parameter to make a text request
            self.bot?.fileRequest(url, successHandler: recastRequestDone, failureHandle: recastRequestError)
        }
    }
}
