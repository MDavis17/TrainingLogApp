//
//  QuestionsViewController.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 11/27/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import UIKit

class QuestionsViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    lazy var orderedQuestions: [QuestionController] = {
        return [self.newQuestion(question: "double"),
                self.newQuestion(question: "fuel"),
                self.newQuestion(question: "stretch_roll"),
                self.newQuestion(question: "submit")]
    }()
    
    var questionControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        if let firstQuestion = orderedQuestions.first {
            setViewControllers([firstQuestion], direction: .forward, animated: true, completion: nil)
        }
        
        configureQuestionControl()
        
        // Do any additional setup after loading the view.
    }
    
    func configureQuestionControl() {
        questionControl = UIPageControl(frame: CGRect(x:0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
        questionControl.numberOfPages = orderedQuestions.count
        questionControl.currentPage = 0
        questionControl.tintColor = UIColor.black
        questionControl.pageIndicatorTintColor = UIColor.lightGray
        questionControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(questionControl)
    }
    
    func newQuestion(question: String) -> QuestionController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: question) as! QuestionController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let questionControllerIndex = orderedQuestions.index(of: viewController as! QuestionController) else {
            return nil
        }
        let previousIndex = questionControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedQuestions.count > previousIndex else {
            return nil
        }
        
        return orderedQuestions[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let questionControllerIndex = orderedQuestions.index(of: viewController as! QuestionController) else {
            return nil
        }
        let nextIndex = questionControllerIndex + 1
        
        guard orderedQuestions.count != nextIndex else {
            return nil
        }
        
        guard orderedQuestions.count > nextIndex else {
            return nil
        }
        
        return orderedQuestions[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let questionContentViewController = pageViewController.viewControllers![0]
        self.questionControl.currentPage = orderedQuestions.index(of: questionContentViewController as! QuestionController)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
