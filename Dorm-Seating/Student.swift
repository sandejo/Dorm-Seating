//
//  Student.swift
//  Dorm-Seating
//
//  Created by joshua on 4/28/16.
//  Copyright © 2016 SSFS. All rights reserved.
//

import UIKit

class Student: BAAObject {
    
    let name: String
    var previousTableMates: [Student] = []
    
    override init(dictionary: [NSObject : AnyObject]!) {
        self.name = dictionary["name"]! as! String
        
        super.init(dictionary: dictionary)
    }
    
    func addTableMate(student: Student) {
        previousTableMates.append(student)
        if previousTableMates.count > 20 {
            previousTableMates.removeAtIndex(20)
        }
    }
    
    func repetitivity(students: [Student]) -> Int {
        var repetition = 0
        for student in students {
            for person in previousTableMates {
                if student == person {
                    repetition += 1
                }
            }
        }
        return repetition
    }

    override func collectionName() -> String! {
        return "document/dormStudents"
    }
    
}
