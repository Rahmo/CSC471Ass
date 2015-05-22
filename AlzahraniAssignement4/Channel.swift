//
//  Channel.swift
//  AlzahraniAssignement4
//
//  Created by Abdulrahman on 2015-05-18.
//  Copyright (c) 2015 DePaul University. All rights reserved.
//

import Foundation

class Channel{
    var channelLable : String?
    var customNumber : Int?
    
    //Constructor
    init(ChannelLabelIn: String, customNumberIn: Int)
    {
        self.channelLable = ChannelLabelIn
        self.customNumber = customNumberIn
        
    }
    
    var setChannelLabel : String {
        get {
            return (channelLable)!
        }
        set(newChannelLbel)
        {
            if count(newChannelLbel) < 4
            {
                channelLable = newChannelLbel
            }
        }
        
       
    }
    var setCustomNo : Int {
        get {
            return (customNumber)!
        }
        set(NewcustomNumber)
        {
//            if count(customNumber) < 4
//            {
                customNumber = NewcustomNumber
           // }
        }}
}