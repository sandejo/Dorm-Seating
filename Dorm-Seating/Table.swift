//
//  Table.swift
//  Dorm-Seating
//
//  Created by joshua on 4/28/16.
//  Copyright © 2016 SSFS. All rights reserved.
//

import Foundation

class Table {
    
    let facultyName: String
    let facultyNumber: Int
    let totalSeats: Int
    var students: [Student] = []
    let openSeats: Int
    
    init (facultyName: String, facultyNumber: Int, totalSeats: Int) {
        self.facultyName = facultyName
        self.facultyNumber = facultyNumber
        self.totalSeats = totalSeats
        self.openSeats = totalSeats - facultyNumber
    }
    
    func addStudent(student: Student) {
        
        students.append(student)
    }
    
    func isFull() -> Bool {
        if students.count == openSeats {
            return true
        } else {
            return false
        }
    }
    
    func clear() {
        for person in students {
            if person.name != students[0].name {
                students[0].addTableMate(person)
                person.addTableMate(students[0])
            }
        }
        students.removeAtIndex(0)
    }
    
    
}
