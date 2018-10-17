//
//  Response.swift
//  TrainingLogMobile
//
//  Created by Max Davis on 10/17/18.
//  Copyright © 2018 Max Davis. All rights reserved.
//

import Foundation


struct Response: Codable {
    struct Embedded: Codable {
        struct Athlete: Codable {
            let firstName: String
            let lastName: String
            let gender: String
            let year: Int
        }
        let athletes: [Athlete]
    }
    struct Links: Codable {
        struct Self_Struct: Codable {
            let href: String
        }
        
        enum CodingKeys: String, CodingKey {
            case self_struct = "self"
        }
        
        let self_struct: Self_Struct
    }
    
    let _embedded: Embedded
    let _links: Links
}

