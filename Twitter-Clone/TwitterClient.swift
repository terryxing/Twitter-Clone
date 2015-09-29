//
//  TwitterClient.swift
//  Twitter-Clone
//
//  Created by Tianyi Xing on 9/27/15.
//  Copyright © 2015 Tianyi Xing. All rights reserved.
//

import UIKit

let twitterConsumerKey = "jPxvGuGaEhDPX8iG9Yq1AMJkg"
let twitterConsumerSecret = "MUKFjXmBvCiGFXLleXz1RCWa8hwKkXMgELO4P2x0XFDsCMA2Cu"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")


class TwitterClient: BDBOAuth1RequestOperationManager {
    
    
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL!, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)

        }
        
        return Static.instance
    }

}
