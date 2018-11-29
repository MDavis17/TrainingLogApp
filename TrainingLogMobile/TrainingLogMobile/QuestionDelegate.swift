//
//  QuestionDelegate.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 11/29/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import Foundation

protocol QuestionDelegate {
    func onQuestionAnswer(ans: String, cell: QuestionTableViewCell)
}
