//
//  Question.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 11/28/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import Foundation

public class Question {
    var question: String
    var status: Bool
    
    init?(question: String, status: Bool) {
        if question.isEmpty {
            return nil
        }
        self.question = question
        self.status = status
    }
    
}
