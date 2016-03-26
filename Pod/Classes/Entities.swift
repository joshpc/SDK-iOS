//
//  Entities.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import JSONJoy

/**
 Entities class. This is the list of the current entities detected:
- age
- cardinal
- color
- datetime
- distance
- duration
- email
- ip
- language
- location
- mass
- misc
- money
- nationality
- number
- ordinal
- organization
- percent
- person
- pronoun
- set
- sort
- speed
- temperature
- url
- volume
 */
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
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        if let ag = decoder["age"].array
        {
            self.age = [Age]()
            for agDecoder in ag
            {
                self.age?.append(Age(agDecoder))
            }
        }
        if let crdnl = decoder["cardinal"].array
        {
            self.cardinal = [Cardinal]()
            for crdnlDecoder in crdnl
            {
                self.cardinal?.append(Cardinal(crdnlDecoder))
            }
        }
        if let clr = decoder["color"].array
        {
            self.color = [Color]()
            for clrDecoder in clr
            {
                self.color?.append(Color(clrDecoder))
            }
        }
        if let dttm = decoder["datetime"].array
        {
            self.datetime = [Datetime]()
            for dttmDecoder in dttm
            {
                self.datetime?.append(Datetime(dttmDecoder))
            }
        }
        if let dstnc = decoder["distance"].array
        {
            self.distance = [Distance]()
            for dstncDecoder in dstnc
            {
                self.distance?.append(Distance(dstncDecoder))
            }
        }
        if let drtn = decoder["duration"].array
        {
            self.duration = [Duration]()
            for drtnDecoder in drtn
            {
                self.duration?.append(Duration(drtnDecoder))
            }
        }
        if let eml = decoder["email"].array
        {
            self.email = [Email]()
            for emlDecoder in eml
            {
                self.email?.append(Email(emlDecoder))
            }
        }
        if let ip = decoder["ip"].array
        {
            self.ip = [IP]()
            for ipDecoder in ip
            {
                self.ip?.append(IP(ipDecoder))
            }
        }
        if let lngg = decoder["language"].array
        {
            self.language = [Language]()
            for lnggDecoder in lngg
            {
                self.language?.append(Language(lnggDecoder))
            }
        }
        if let lctn = decoder["location"].array
        {
            self.location = [Location]()
            for lctnDecoder in lctn
            {
                self.location?.append(Location(lctnDecoder))
            }
        }
        if let mss = decoder["mass"].array
        {
            self.mass = [Mass]()
            for mssDecoder in mss
            {
                self.mass?.append(Mass(mssDecoder))
            }
        }
        if let msc = decoder["misc"].array
        {
            self.misc = [Misc]()
            for mscDecoder in msc
            {
                self.misc?.append(Misc(mscDecoder))
            }
        }
        if let mn = decoder["money"].array
        {
            self.money = [Money]()
            for mnDecoder in mn
            {
                self.money?.append(Money(mnDecoder))
            }
        }
        if let ntnlt = decoder["nationality"].array
        {
            self.nationality = [Nationality]()
            for ntnltDecoder in ntnlt
            {
                self.nationality?.append(Nationality(ntnltDecoder))
            }
        }
        if let nmbr = decoder["number"].array
        {
            self.number = [Number]()
            for nmbrDecoder in nmbr
            {
                self.number?.append(Number(nmbrDecoder))
            }
        }
        if let ordnl = decoder["ordinal"].array
        {
            self.ordinal = [Ordinal]()
            for ordnlDecoder in ordnl
            {
                self.ordinal?.append(Ordinal(ordnlDecoder))
            }
        }
        if let orgnztn = decoder["organization"].array
        {
            self.organization = [Organization]()
            for orgnztnDecoder in orgnztn
            {
                self.organization?.append(Organization(orgnztnDecoder))
            }
        }
        if let prcnt = decoder["percent"].array
        {
            self.percent = [Percent]()
            for prcntDecoder in prcnt
            {
                self.percent?.append(Percent(prcntDecoder))
            }
        }
        if let prsn = decoder["person"].array
        {
            self.person = [Person]()
            for prsnDecoder in prsn
            {
                self.person?.append(Person(prsnDecoder))
            }
        }
        if let prnn = decoder["pronoun"].array
        {
            self.pronoun = [Pronoun]()
            for prnnDecoder in prnn
            {
                self.pronoun?.append(Pronoun(prnnDecoder))
            }
        }
        if let st = decoder["set"].array
        {
            self.set = [Set]()
            for stDecoder in st
            {
                self.set?.append(Set(stDecoder))
            }
        }
        if let srt = decoder["sort"].array
        {
            self.sort = [Sort]()
            for srtDecoder in srt
            {
                self.sort?.append(Sort(srtDecoder))
            }
        }
        if let spd = decoder["speed"].array
        {
            self.speed = [Speed]()
            for spdDecoder in spd
            {
                self.speed?.append(Speed(spdDecoder))
            }
        }
        if let tmprtr = decoder["temperature"].array
        {
            self.temperature = [Temperature]()
            for tmprtrDecoder in tmprtr
            {
                self.temperature?.append(Temperature(tmprtrDecoder))
            }
        }
        if let url = decoder["url"].array
        {
            self.url = [Url]()
            for urlDecoder in url
            {
                self.url?.append(Url(urlDecoder))
            }
        }
        if let vlm = decoder["volume"].array
        {
            self.volume = [Volume]()
            for vlmDecoder in vlm
            {
                self.volume?.append(Volume(vlmDecoder))
            }
        }
    }
}

/**
 Class Age
 
 Examples :	20 year old, eighteen-years-old
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be s (seconds), min (minutes), h (hours), wk (weeks), y (years), decade (decades), century (centuries), etc.
 - raw: The raw value extracted for the sentence
 */
public class Age
{
    public var value : Float?
    public var unit : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float
        self.unit = decoder["unit"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Cardinal
 
 Examples :	north, southeast, north-west
 
 Key:
 - deg: Float, the cardinal point bearing in degrees
 - raw: The raw value extracted for the sentence
 */
public class Cardinal
{
    public var deg : Float?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.deg = decoder["deg"].float
        self.raw = decoder["raw"].string
    }
}

/**
 Class Color
 
 Examples :	blue, red, orange
 
 Key:
 - hex: String, the hexadecimal value of the color
 - raw: The raw value extracted for the sentence
 */
public class Color
{
    public var hex : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.hex = decoder["hex"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Datetime
 
 Examples :	the next friday, today, September 7 2016
 
 Key:
 - value: Integer, the unix timestamp of the datetime
 - raw: The raw value extracted for the sentence
 */
public class Datetime
{
    public var value : Int?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].integer
        self.raw = decoder["raw"].string
    }
}

/**
 Class Distance
 
 Examples :	20 meters, seven miles
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier
 - raw: The raw value extracted for the sentence
 */
public class Distance
{
    public var value : Float?
    public var unit : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float
        self.unit = decoder["unit"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Duration
 
 Examples :	five days, one year
 
 Key:
 - value: Integer, the number of seconds in this span
 - raw: The raw value extracted for the sentence
 */
public class Duration
{
    public var value : Int?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].integer
        self.raw = decoder["raw"].string
    }
}

/**
 Class Email
 
 Examples :	hello@recast.ai, hello+devs@recast.ai
 
 Key:
 - value: String, the downcased email
 - raw: The raw value extracted for the sentence
 */
public class Email
{
    public var value : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class IP
 
 Examples :	127.0.0.1
 
 Key:
 - formated: String, the full denomination of the ip’s location
 - lat: Float, the latitude of the ip’s location
 - lng: Float, the longitude of the ip’s location
 - raw: The raw value extracted for the sentence
 */
public class IP
{
    public var formated : String?
    public var lat : Float?
    public var lng : Float?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.formated = decoder["formated"].string
        self.lat = decoder["lat"].float
        self.lng = decoder["lng"].float
        self.raw = decoder["raw"].string
    }
}

/**
 Class Language
 
 Examples :	French, Hindi, Russian
 
 Key:
 - code: String, the language code. Follows the ISO 639-1 standard
 - raw: The raw value extracted for the sentence
 */
public class Language
{
    public var code : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.code = decoder["code"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Location
 
 Examples :	San Francisco, Paris, France
 
 Key:
 - formated: String, the full denomination of the location
 - lat: Float, the latitude of the location
 - lng: Float, the longitude of the location
 - raw: The raw value extracted for the sentence
 */
public class Location
{
    public var formated : String?
    public var lat : Float?
    public var lng : Float?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.formated = decoder["formated"].string
        self.lat = decoder["lat"].float
        self.lng = decoder["lng"].float
        self.raw = decoder["raw"].string
    }
}

/**
 Class Mass
 
 Examples :	45 pounds, twenty-one grams
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be lbs (pounds), kg (kilograms), g (grams), oz (ounces), etc.
 - raw: The raw value extracted for the sentence
 */
public class Mass
{
    public var value : Float?
    public var unit : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float
        self.unit = decoder["unit"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Misc
 
 Examples :	World Champion, Americans
 
 Key:
 - value: String, the downcased entity extracted
 - raw: The raw value extracted for the sentence
 */
public class Misc
{
    public var value : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Money
 
 Examples :	3.14 euros, eight millions dollars, $6
 
 Key:
 - value: Float, the countable
 - unit: String, the currency. Follows the ISO 4217 standard
 - raw: The raw value extracted for the sentence
 */
public class Money
{
    public var value : Float?
    public var unit : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float
        self.unit = decoder["unit"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Nationality
 
 Examples :	French, Spanish, Australian
 
 Key:
 - code: String, the country code. Follows the ISO 3166-1 alpha2 standard
 - raw: The raw value extracted for the sentence
 */
public class Nationality
{
    public var code : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.code = decoder["code"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Number
 
 Examples :	one thousand, 3, 9,000
 
 Key:
 - value: Integer, the number
 - raw: The raw value extracted for the sentence
 */
public class Number
{
    public var value : Int?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].integer
        self.raw = decoder["raw"].string
    }
}

/**
 Class Ordinal
 
 Examples :	3rd, 158th, last
 
 Key:
 - value: Integer, the number behind the ordinal
 - raw: The raw value extracted for the sentence
 */
public class Ordinal
{
    public var value : Int?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].integer
        self.raw = decoder["raw"].string
    }
}

/**
 Class Organization
 
 Examples :	Lehman Brothers, NASA
 
 Key:
 - value: String, the downcased entity extracted
 - raw: The raw value extracted for the sentence
 */
public class Organization
{
    public var value : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Percent
 
 Examples :	99%, two percent, one out of three
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be % (percent), etc.
 - raw: The raw value extracted for the sentence
 */
public class Percent
{
    public var value : Float?
    public var unit : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float
        self.unit = decoder["unit"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Person
 
 Examples :	John Smith, David H. Doe
 
 Key:
 - value: String, the downcased entity extracted
 - raw: The raw value extracted for the sentence
 */
public class Person
{
    public var value : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Pronoun
 
 Examples :	I, we, it
 
 Key:
 - person: Integer, the person of the pronoun. Can be 1, 2 or 3
 - number: String, the number of the pronoun. Can be singular or plural
 - gender: String, the gender of the pronoun. Can be unknown, neutral, male of female
 - raw: The raw value extracted for the sentence
 */
public class Pronoun
{
    public var person : Int?
    public var number : String?
    public var gender : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.person = decoder["person"].integer
        self.number = decoder["number"].string
        self.gender = decoder["gender"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Set
 
 Examples :	every Sunday, each day
 
 Key:
 - next: Integer, the timestamp representing the next occurence
 - grain: String, the delay to repeat. Can be a combination of a number and a quantifier (day, week, month, year), just a quantifier, or even a day name.
 - raw: The raw value extracted for the sentence
 */
public class Set
{
    public var next : Int?
    public var grain : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.next = decoder["next"].integer
        self.grain = decoder["grain"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Sort
 
 Examples :	most valuable, best, least affordable
 
 Key:
 - value: String, the criterion to sort
 - order: String, the order to sort (MySQL inspired)
 - raw: The raw value extracted for the sentence
 */
public class Sort
{
    public var value : String?
    public var order : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string
        self.order = decoder["order"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Speed
 
 Examples :	7 mph, 10 km/h, seven meters per second
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be km/h (kilometer per hour), mi/s (miles per second), kt (knots), etc.
 - raw: The raw value extracted for the sentence
 */
public class Speed
{
    public var value : Float?
    public var unit : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float
        self.unit = decoder["unit"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Temperature
 
 Examples :	7 mph, 10 km/h, seven meters per second
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be C (Celsius), K (Kelvin), F (Fahrenheit), R (Rankine), etc.
 - raw: The raw value extracted for the sentence
 */
public class Temperature
{
    public var value : Float?
    public var unit : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float
        self.unit = decoder["unit"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Url
 
 Examples :	https://recast.ai, localhost:9000, api.recast.ai/request
 
 Key:
 - value: String, the downcased entity extracted
 - raw: The raw value extracted for the sentence
 */
public class Url
{
    public var value : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].string
        self.raw = decoder["raw"].string
    }
}

/**
 Class Volume
 
 Examples :	30 liters, two barrels, ½ tbsp
 
 Key:
 - value: Float, the countable
 - unit: String, the quantifier. Can be l (liters), tsp (teaspoons), pt (pints), etc.
 - raw: The raw value extracted for the sentence
 */
public class Volume
{
    public var value : Float?
    public var unit : String?
    public var raw : String?
    
    init () {}
    
    init (_ decoder : JSONDecoder)
    {
        self.value = decoder["value"].float
        self.unit = decoder["unit"].string
        self.raw = decoder["raw"].string
    }
}