# RecastAI - iOS SDK

[logo]: https://github.com/RecastAI/SDK-ios/blob/master/Misc/logo-inline.png "Recast.AI"

[![CI Status](http://img.shields.io/travis/plieb/RecastAI.svg?style=flat)](https://travis-ci.org/plieb/RecastAI)
[![Version](https://img.shields.io/cocoapods/v/RecastAI.svg?style=flat)](http://cocoapods.org/pods/RecastAI)
[![License](https://img.shields.io/cocoapods/l/RecastAI.svg?style=flat)](http://cocoapods.org/pods/RecastAI)
[![Platform](https://img.shields.io/cocoapods/p/RecastAI.svg?style=flat)](http://cocoapods.org/pods/RecastAI)

![alt text][logo]

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 8.0+
- Xcode 7.2+

## Installation

RecastAI is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RecastAI"
```
## How to use Recast iOS SDK

### RecastAPI Class

This class handles everything. Create a RecastAPI object and init it with your token and a class that implements the `HandlerRecastRequestProtocol` Protocol.

```swift
import RecastAI

class ViewController: UIViewController, HandlerRecastRequestProtocol
{
    var bot : RecastAPI?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //Initialise bot with token & handlerRecastProtocol
        self.bot = RecastAPI(token : "YOUR_BOT_TOKEN", handlerRecastRequestProtocol: self)
    }
}
```

* **Text Request**

The `makeRequest` method allows you to make a request to the Recast.AI API. The `makeRequest` method is to make a **Text** request and takes a `String` as parameter.
```swift
/**
Make text request to Recast.AI API
*/
@IBAction func makeRequest()
{
    //Call makeRequest with string parameter to make a text request
    self.bot?.makeRequest(<#T##request: String##String#>)
}
```

* **Voice Request**

In order to make a **Voice** Request you need to implement two methods `startVoiceRequest` & `stopVoiceRequest`. `startVoiceRequest` will start recording your **voice** and `stopVoiceRequest` will stop recording your **voice** and send the request to the Recast.AI API.

```swift
//Bool to check if currently recording voice 
var recording : Bool = true

/**
Make Voice request to Recast.AI API
*/
@IBAction func makeVoiceRequest()
{
    if (self.recording)
    {
        self.recording = !self.recording
        //Call startVoiceRequest to start recording your voice
        self.bot!.startVoiceRequest()
    }
    else
    {
        self.recording = !self.recording
        //Call stopVoiceRequest to stop recording your voice and launch the request to the Recast.AI API
        self.bot!.stopVoiceRequest()
    }
}
```

### handlerRecastRequestProtocol

In order to comply with the handlerRecastRequestProtocol you need to implement `recastRequestDone` & `recastRequestError`.
- `recastRequestDone` is called when the request was successful with the Response in parameter
- `recastRequestError` is called when the request failed with the error in parameter
```swift
public protocol HandlerRecastRequestProtocol : class
{
    //If success
    func recastRequestDone(response : Response)
    
    //If failure
    func recastRequestError(error : NSError)
}
```

Implement those metods in your ViewController. 

```swift
/**
Method called when the request was successful

- parameter response: the response returned from the Recast API

- returns: void
*/
func recastRequestDone(response : Response)
{
    print(response.source)
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
```

### Error

We will return an error (400: bad_request) if any of these cases is met:

- text parameter is missing.
- text parameter is blank.
- text parameter is superior to 256 characters.

We will return an error (401: unauthorized) if the following case is met:

- The token provided in your request is not linked to any of your bots.

### Response

Once you made the request to the API, you receice a response. Response contains an array of intents sorted by probability and an array of the sentences you sent through the `makeRequest` method.
```swift
public class Response
{
    public var source : String?
    public var intents : [String]?
    public var sentences : [Sentence]?
    public var version : String?
    public var timestamp : String?
    public var status : Int?
}
```

### Sentence

A Sentence contains the action and the object `Entities`
```swift
public class Sentence
{
    public var source : String?
    public var type : String?
    public var polarity : String?
    public var action : String?
    public var agent : String?
    public var entities : Entities?
}
```

### Entities

All the entities implement the `CustomStringConvertible` protocol. See Apple documentation [CustomStringConvertible](https://developer.apple.com/library/watchos/documentation/Swift/Reference/Swift_CustomStringConvertible_Protocol/index.html) for more information.
This is the list of the current entities we detect.

```swift
public class Entities
{
    public var age : [Age]?
    public var cardinal : [Cardinal]?
    public var color : [Color]?
    public var datetime : [Datetime]?
    public var distance : [Distance]?
    public var duration : [Duration]?
    public var email : [Email]?
    public var ip : [IP]?
    public var language : [Language]?
    public var location : [Location]?
    public var mass : [Mass]?
    public var misc : [Misc]?
    public var money : [Money]?
    public var nationality : [Nationality]?
    public var number : [Number]?
    public var ordinal : [Ordinal]?
    public var organization : [Organization]?
    public var percent : [Percent]?
    public var person : [Person]?
    public var pronoun : [Pronoun]?
    public var set : [Set]?
    public var sort : [Sort]?
    public var speed : [Speed]?
    public var temperature : [Temperature]?
    public var url : [Url]?
    public var volume : [Volume]?
    public var custom : [Custom]?
}
```

You can print a description of the entity using the description method :
```swift
public var description: String
{
    return "Custom(value : \(value), raw : \(raw))"
}
```

### Accessing Entities

You can access entities from the first sentence this way :
```swift
response.sentences![0].entities?.age.raw
```

### Accessing Custom Entities

If you want to get custom entities you can do it this way : 
```swift
print(response.sentences![0].entities?.custom)
```
Output :
```swift
Optional(["movie": [Custom(value : star wars 8, raw : Star Wars 8)]])
```

If you want to access the array of a specific custom entity you can do it with its key:
```swift
print(response.sentences![0].entities?.custom!["movie"]
```
Output :
```swift
Optional([Custom(value : star wars 8, raw : Star Wars 8)])
```


## MAN Recast.AI

For more details regarding the API please visit [man.recast.ai](https://man.recast.ai)

## Author

PE Lieb, pierre-edouard.lieb@recast.ai, [@pedward_lieb](https://twitter.com/pedward_lieb)

You can follow us on Twitter at [@recastai](https://twitter.com/recastai) for updates and releases.

## License

RecastAI is available under the MIT license. See the LICENSE file for more info.
