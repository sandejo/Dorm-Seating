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
    var students: [Student] = []
    let openSeats: Int
    var seatingArrangements: [[Student]] = []
    
    init (facultyName: String, openSeats: Int) {
        self.facultyName = facultyName
        self.openSeats = openSeats
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
    
    func saveSeating() {
        seatingArrangements.append(students)
    }
    
    func printArrangement(seatingArrangement: Int) {
        for student in seatingArrangements[seatingArrangement] {
            print(student.name)
        }
    }
    
    func clear() -> Student {
        let student: Student = students[0]
        for person in students {
            if person != students[0] {
                students[0].addTableMate(person)
                person.addTableMate(students[0])
            }
        }
        students.removeAtIndex(0)
        return student
    }
    
    
}
