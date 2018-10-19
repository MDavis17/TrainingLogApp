//
//  RegistrationViewController.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 10/15/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import UIKit
import CoreData

class RegistrationViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    let app_delegate = UIApplication.shared.delegate as! AppDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.accessibilityIdentifier == "genderID" {
            return genders.count
        }
        else if pickerView.accessibilityIdentifier == "yearID" {
            return years.count
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        if pickerView.accessibilityIdentifier == "genderID" {
            return genders[row]
        }
        else if pickerView.accessibilityIdentifier == "yearID" {
            return String(years[row])
        }
        else {
            return ""
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.accessibilityIdentifier == "genderID" {
            genderTextField.text = genders[row]
        }
        else if pickerView.accessibilityIdentifier == "yearID" {
            yearTextField.text = String(years[row])
        }
    }
    
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    var genders: [String] = [String]()
    var years: [Int] = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let genderPicker = UIPickerView()
        let yearPicker = UIPickerView()
        genderPicker.accessibilityIdentifier = "genderID"
        yearPicker.accessibilityIdentifier = "yearID"
        genderPicker.removeFromSuperview()
        yearPicker.removeFromSuperview()
        genderTextField.inputView = genderPicker
        yearTextField.inputView = yearPicker
        
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(doneClicked) )
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        genderTextField.inputAccessoryView = toolbar
        yearTextField.inputAccessoryView = toolbar
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        yearPicker.delegate = self
        yearPicker.dataSource = self
        
        genders = ["Female","Male"]
        years = [1,2,3,4,5]
        
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        
        
        
    }
    
    @IBAction func submit(_ sender: UIButton) {
        // prepare to register new athlete with POST request
        app_delegate.userYear = Int(yearTextField.text!)!
        app_delegate.userGender = genderTextField.text!
        let nameArr = app_delegate.currentUserFullName.split(separator: " ")
        let first_name = nameArr[0]
        let last_name = nameArr[1]
        let json:[String: Any] = ["firstName":first_name,"lastName":last_name,"gender":genderTextField.text!.prefix(1),"year":Int(yearTextField.text!)]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        let url = URL(string: "http://localhost:8080/athletes")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
            
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
//        curl -i -X POST -H "Content-Type:application/json" -d '{"firstName":"Max","lastName":"Davis","gender":"M","year":5}' http://localhost:8080/athletes
    }
    
    @objc func doneClicked(){
        genderTextField.resignFirstResponder()
        yearTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
