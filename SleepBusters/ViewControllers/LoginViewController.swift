//
//  LoginViewController.swift
//  SleepBusters
//
//  Created by Klein on 2015-10-03.
//  Copyright © 2015 PillowSoft. All rights reserved.
//

import UIKit
class LoginViewController:UIViewController {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    var business = Business()
    var rememberMe = false;

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Code for Login Button OnClick Event
        ////////////////////////////////////
//        let user = business.validateLogin("klein", password: "test")
//        let userId = user.Id
//       let isValidated = user.IsValidated
//        if (isValidated && rememberMe)
//        {
//            // Save user login state and show MyProfileViewController
//            defaults.setBool(true,forKey: "userIsLoggedIn")
//            showTabViewController()
//        }
//        else if (isValidated && !rememberMe)
//        {
//            // Save user login state and show MyProfileViewController
//            defaults.setBool(false,forKey: "userIsLoggedIn")
//            showTabViewController()
//        }
//        else
//        {
//            // Login Failed: Show message for incorrect username/password
//            let alert = UIAlertView()
//            alert.title = "Error"
//            alert.message = "The username or password is incorrect!"
//            alert.addButtonWithTitle("Okay")
//            alert.show()
//        }
        ////////////////////////////////////
        // END CODE FOR OnClick Login
        
    }
    
    func showTabViewController(){
        let tabViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TabViewController")
        let appDelegate = UIApplication.sharedApplication().delegate!
        appDelegate.window!!.rootViewController = tabViewController;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}