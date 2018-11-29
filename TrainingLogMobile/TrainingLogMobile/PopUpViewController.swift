//
//  PopUpViewController.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 11/28/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // blur
//        let blurEffect = UIBlurEffect(style: .extraLight)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = self.view.frame
//        self.view.insertSubview(blurEffectView, at: 0)
        
        self.view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yes(_ sender: UIButton) {
        returnToQuestions()
    }
    
    @IBAction func no(_ sender: UIButton) {
        returnToQuestions()
    }
    
    func returnToQuestions() {
        self.dismiss(animated: true, completion: {});
//        if let navController = self.navigationController {
//            navController.popViewController(animated: true)
//        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
