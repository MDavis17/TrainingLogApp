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
        
        if app_delegate.currentUser == "" {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
