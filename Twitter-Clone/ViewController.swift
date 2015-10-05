//
//  ViewController.swift
//  Twitter-Clone
//
//  Created by Tianyi Xing on 9/27/15.
//  Copyright © 2015 Tianyi Xing. All rights reserved.
//

import UIKit


class ViewController: UIViewController {


    @IBAction func onLogin(sender: AnyObject) {

        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, error: NSError?) in
            if user != nil {
                //perform segue
                print("successfully loged in")
                self.performSegueWithIdentifier("loginSegue", sender: self)
            } else {
                //handle error login
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

