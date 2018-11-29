//
//  Day.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 11/29/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import Foundation

class Day {
    var answers = [String?](repeating: nil, count: 3)
    
    func addAns(ans: String, index: Int) {
        answers.insert(ans, at: index)
    }
}
