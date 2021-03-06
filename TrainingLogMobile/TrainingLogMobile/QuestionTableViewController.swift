//
//  QuestionTableViewController.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 11/28/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, QuestionDelegate {
    
    func onQuestionAnswer(ans: String, cell: QuestionTableViewCell) {
//        print("returned from the "+cell.questionTextLabel.text!+" popup with answer: \""+ans+"\"")
        cell.answerLabel.isHidden = false
        cell.answerLabel.text = ans
        cell.isSelected = false
    }
    
    // count is the number of questions per day
    var questions = [Question]()
    
    var currentQuestionCell = QuestionTableViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setToolbarHidden(false, animated: true)
        loadQuestions()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    private func loadQuestions() {
        guard let q1 = Question(question: "Double?",status: false) else {
            fatalError("Unable to instantiate q1")
        }
        guard let q2 = Question(question: "Fuel?",status: false) else {
            fatalError("Unable to instantiate q2")
        }
        guard let q3 = Question(question: "Stretch and roll out?",status: false) else {
            fatalError("Unable to instantiate q3")
        }
        questions += [q1,q2,q3]
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? QuestionTableViewCell else {
            fatalError("The dequeued cell is not an instance of QuestionTableViewCell.")
        }
        let question = questions[indexPath.row]

        cell.questionTextLabel.text = question.question
        cell.answerLabel.isHidden = true
//        currentQuestionCell = cell
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedQuestionSourceView = tableView.cellForRow(at: indexPath)
            currentQuestionCell = selectedQuestionSourceView as! QuestionTableViewCell
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "questionPopUp") {
            let vc = segue.destination as! PopUpViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedQuestionSourceView = tableView.cellForRow(at: indexPath)
                currentQuestionCell = selectedQuestionSourceView as! QuestionTableViewCell
                vc.delegate = self
//                vc.cell = currentQuestionCell
                vc.cell = currentQuestionCell
                vc.question = currentQuestionCell.questionTextLabel.text
            }
        }
        
        
    }
 

}
