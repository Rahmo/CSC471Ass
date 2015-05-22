//
//  SharedData.swift
//  AlzahraniAssignement4
//
//  Created by Abdulrahman on 2015-05-18.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import Foundation

class SharedData { //singliton pattern
   
    
    static  var No : Int?

    var channelsConfiguration : [Channel]
  
    var sharedString = "shared string"
    
    var sharedInt = 54
    
     var FavChann = ["ABC":0,"CNN":1,"HBO":2,"FOX":3]
    
    class var sharedInstance: SharedData {
        struct StaticMyVar {
            static var instance: SharedData?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&StaticMyVar.token) {
            StaticMyVar.instance = SharedData()
        }
        
        return StaticMyVar.instance!
    }
    
    
    init()
    {
        channelsConfiguration = [Channel]()
        channelsConfiguration.append(Channel(ChannelLabelIn: "ABC", customNumberIn: 0))
        channelsConfiguration.append(Channel(ChannelLabelIn: "CNN", customNumberIn: 1))
        channelsConfiguration.append(Channel(ChannelLabelIn: "HBO", customNumberIn: 2))
        channelsConfiguration.append(Channel(ChannelLabelIn: "FOX", customNumberIn: 3))
        
    }

}