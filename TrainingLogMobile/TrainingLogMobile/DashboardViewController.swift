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

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dashTableView: UITableView!
    
    let dashTableCellValsArr: [String] = ["Daily","Stats","Leaders"]
    
    let cellReuseIdentifier = "cell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashTableCellValsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DashboardTableViewCell = self.dashTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! DashboardTableViewCell
        return cell
    }
    
    let app_delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        dashTableView.delegate = self
        dashTableView.dataSource = self
        
        print("in dashboard: app_delegate current name = "+app_delegate.currentUserFullName)
        if app_delegate.currentUserFullName == "" {
            self.navigationItem.title = "Dashboard"
            
        }
        else {
            self.navigationItem.title = app_delegate.currentUserFullName+" Dashboard"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
