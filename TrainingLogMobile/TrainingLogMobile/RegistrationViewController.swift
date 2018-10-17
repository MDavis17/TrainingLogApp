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
    
    @objc func doneClicked(){
        genderTextField.resignFirstResponder()
        yearTextField.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
