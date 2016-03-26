//
//  Entities.swift
//  Recast.AI Official iOS SDK
//
//  Created by Pierre-Edouard LIEB on 24/03/2016.
//
//  pierre-edouard.lieb@recast.ai

import Foundation
import JSONJoy

// MARK: Entities
// This is the list of the current entities we detect, with examples and formatted information for each one.
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