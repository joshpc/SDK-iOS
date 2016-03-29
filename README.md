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

This class handles everything. Create a RecastAPI object and init it with your token and a class that implements the `HandlerRecastRequestProtocol` Protocol. The `makeRequest` method allows you to make a request to the Recast.AI API  
```swift
import RecastAI

class ViewController: UIViewController, HandlerRecastRequestProtocol
{
    var api : RecastAPI?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.api = RecastAPI(token : "YOUR_APP_TOKEN", handlerRecastRequestProtocol: self)
        self.api?.makeRequest(<#T##request: String##String#>)
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
import RecastAI

class ViewController: UIViewController, HandlerRecastRequestProtocol
{
    var api : RecastAPI?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.api = RecastAPI(token : "YOUR_APP_TOKEN", handlerRecastRequestProtocol: self)
        self.api?.makeRequest(<#T##request: String##String#>)
    }

    func recastRequestDone(response : Response)
    {
        print(response.source)
    }
    
    func recastRequestError(error : NSError)
    {
        print(error)
    }
}
```

### Error

We will return an error (400: bad_request) if any of these cases is met:

- text parameter is missing.
- text parameter is blank.
- text parameter is superior to 256 characters.

We will return an error (401: unauthorized) if the following case is met:

- The token provided in your request is not linked to any of your apps.

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
    public  var agent : String?
    public var entities : Entities?
}
```

### Entities

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
}
```

## MAN Recast.AI

For more details regarding the API please visit [man.recast.ai](https://man.recast.ai)

## Author

PE Lieb, pierre-edouard.lieb@recast.ai, [@pedward_lieb](https://twitter.com/pedward_lieb)

You can follow us on Twitter at [@recastai](https://twitter.com/recastai) for updates and releases.

## License

RecastAI is available under the MIT license. See the LICENSE file for more info.
