//
//  DashboardViewController.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 10/15/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DashboardViewController: UIViewController  {
    let app_delegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("in dashboard: app_delegate current name = "+app_delegate.currentUser)
        if app_delegate.currentUser == "" {
            self.navigationItem.title = "Dashboard"
        }
        else {
            self.navigationItem.title = app_delegate.currentUser+" Dashboard"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
