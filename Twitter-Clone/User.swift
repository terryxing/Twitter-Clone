//
//  User.swift
//  Twitter-Clone 
//
//  Created by Tianyi Xing on 9/28/15.
//  Copyright © 2015 Tianyi Xing. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: String?
    var screenname: String?
    var profileImageUrl : String?
    var tagline: String?
    
    init(dictionary: NSDictionary){
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url"]as? String
        tagline = dictionary["description"] as? String
    }

}
