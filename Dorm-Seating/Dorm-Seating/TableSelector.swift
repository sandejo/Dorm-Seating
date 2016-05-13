//
//  TableSelector.swift
//  Dorm-Seating
//
//  Created by joshua on 4/28/16.
//  Copyright © 2016 SSFS. All rights reserved.
//

import Foundation

class TableSelector {
    
    let tables: [Table]
    var students: [Student]
    
    init (tables: [Table], students: [Student]) {
        self.tables = tables
        self.students = students
    }
    
    func placeStudent(studentIndex: Int, tableIndex: Int) {
        if students.count == 0 {
            return
        }
        if tableIndex >= tables.count {
            placeStudent(studentIndex, tableIndex: 0)
        } else if studentIndex >= students.count {
            placeStudent(0, tableIndex: tableIndex)
        }
        if !tables[tableIndex].isFull() {
            if students[studentIndex].repetitivity(tables[tableIndex].students) == 0 {
                tables[tableIndex].addStudent(students[studentIndex])
                students.removeAtIndex(studentIndex)
            } else {
                placeStudent(studentIndex + 1, tableIndex: tableIndex)
            }
        } else {
            placeStudent(studentIndex, tableIndex: tableIndex + 1)
        }
    }
    /*
    func arrangeStudents() -> Int { // use recursive backtracking
        var index = 0
        var error = 0
        for student in students {
            if !tables[index].isFull() {
                for otherStudent in tables[index].students {
                    error += student.repetitivity(otherStudent)
                }
                if error == 0 {
                    tables[index].addStudent(student)
                }
            } else {
                index++
                tables[index].addStudent(student)
            }
        }
        for table in tables {
            for student in table.students {
                for otherStudent in table.students {
                    error += student.repetitivity(otherStudent)
                }
            }
        }
        return error
    } */
}
