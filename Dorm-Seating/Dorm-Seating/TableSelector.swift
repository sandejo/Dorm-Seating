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
                placeStudent(studentIndex, tableIndex: tableIndex)
            } else {
                placeStudent(studentIndex + 1, tableIndex: tableIndex)
            }
        } else {
            placeStudent(studentIndex, tableIndex: tableIndex + 1)
        }
    }
    
    func clearTables() {
        for table in tables {
            table.saveSeating()
            while !table.students.isEmpty {
                students.append(table.clear())
            }
        }
    }

}
