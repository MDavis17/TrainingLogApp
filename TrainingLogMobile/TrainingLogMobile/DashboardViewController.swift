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
        print("in dashboard viewDidLoad")
        
//        // is user logged in?
//        if app_delegate.currentUserFullName == "" {
//            // user not logged in
//            self.navigationItem.title = "Dashboard"
//            performSegue(withIdentifier: "signIn", sender: nil)
//        }
//        // user is logged in
//        else {
//            self.navigationItem.title = app_delegate.currentUserFullName+" Dashboard"
//            // is user registered?
//            if !app_delegate.userIsRegistered {
//                //user is not registered
//                performSegue(withIdentifier: "registerUser", sender: nil)
//            }
//            //user is registered -> continue
//        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("in dashboard viewDidAppear")
        
        //temporarliy removing the table view from dash
        dashTableView.delegate = self
        dashTableView.dataSource = self
        
        
        print("in dashboard: app_delegate current name = "+app_delegate.currentUserFullName)
        
        // is user logged in?
        if app_delegate.currentUserFullName == "" {
            // user not logged in
            self.navigationItem.title = "Dashboard"
            performSegue(withIdentifier: "signIn", sender: nil)
        }
            // user is logged in
        else {
            self.navigationItem.title = app_delegate.currentUserFullName+" Dashboard"
            
            
            // is user registered?
            userIsRegistered(email:app_delegate.userEmail, finished: {isRegistered in
                if !isRegistered {
                    // user not registered -> have them register
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "registerUser", sender: nil)
                    }
                    return
                }
            })
            
            //user is registered -> continue
        }
        
    }
    
    func userIsRegistered(email:String,finished:@escaping ((_ isRegistered:Bool) -> Void)) {
        //        let url = URL(string:"http://localhost:8080/athletes/search/findByLastName?name="+familyName)
        let url = URL(string:"http://localhost:8080/athletes/search/findByEmail?email="+email)
        URLSession.shared.dataTask(with: url!) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(Response.self, from: data)
                
                // new email search should yield 1 or 0 athletes
                if(responseData._embedded.athletes.count == 1) {
//                    self.userRegistered = true
                    finished(true)
                }
                else {
                    finished(false)
                }
                
                // old name compare for registration check
                //                for athlete in responseData._embedded.athletes {
                //                    if fullName == String(athlete.firstName+" "+athlete.lastName) {
                //                        finished(true)
                //                        break
                //                    }
                //                }
                //                finished(false)
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
