//
//  SignInViewController.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 10/15/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import UIKit
import CoreData
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    let app_delegate = UIApplication.shared.delegate as! AppDelegate
    
//    var userFirstName = ""
    //
    //    func setUserFirstName(name: String) {
    //        userFirstName = name
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("inside: view did load")
        GIDSignIn.sharedInstance().uiDelegate = self
        nameLabel.text = "Welcome "+app_delegate.currentUserFullName
        
        
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(" inside: view will appear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    //    @IBAction func goToESPN(_ sender: UIButton) {
    //        if let url = URL(string: "https://www.espn.com") {
    //            UIApplication.shared.open(url, options: [:])
    //        }
    //    }
    
    
    //    @IBAction func didTapSignOut(_ sender: UIButton) {
    //        GIDSignIn.sharedInstance().signOut()
    //    }
    
    @IBAction func signOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        nameLabel.text = "Welcome"
    }
    
}

