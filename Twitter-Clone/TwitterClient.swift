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
    
    var loginCompletion: ((user: User?, error: NSError?) -> ())?
    
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL!, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)

        }
        
        return Static.instance
    }
    
    func loginWithCompletion(completion: (user: User?, error: NSError?) -> ()) {
        
        loginCompletion = completion

        
        //fetch request token & redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterdemo://oauth"), scope: nil, success: {(requestToken: BDBOAuth1Credential!) -> Void in
            print("Got the request token")
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL!)
            }) {(error: NSError!) -> Void in
                print("Failed to get request token")
        }

        
    }
    
    func openURL(url: NSURL) {
        
        
         fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuth1Credential(queryString: url.query), success: { (accessToken: BDBOAuth1Credential!) -> Void in
            print("Got Access Token")
            TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
            
            TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                //print("user: \(response)")
                
                var user = User(dictionary: response as! NSDictionary)
                print("user: \(user.name)")
                
                
                }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                    print("error getting current user")
            })
            
            TwitterClient.sharedInstance.GET("1.1/statuses/home_timeline.json", parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                //print("home timeline \(response)")
                
                var tweets = Tweet.tweetWithArray(response as! [NSDictionary])
                
                for tweet in tweets {
                    print("text:\(tweet.text), created: \(tweet.createdAt)")
                }
                
                
                }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                    print("error getting home timeline")
            })
            
            
            }) { (error: NSError!) -> Void in
                print("Failed to receive access token")
        }

        
        
        
    }

}
