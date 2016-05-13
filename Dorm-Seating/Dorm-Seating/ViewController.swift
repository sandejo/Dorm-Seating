//
//  ViewController.swift
//  Dorm-Seating
//
//  Created by joshua on 3/1/16.
//  Copyright © 2016 SSFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var students: [Student] = []
    var tables: [Table] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let adam = Table(facultyName: "Adam", openSeats: 3)
        tables.append(adam)
        let ken = Table(facultyName: "Ken", openSeats: 6)
        tables.append(ken)
        let aimee = Table(facultyName: "Aimee", openSeats: 6)
        tables.append(aimee)
        let kristin = Table(facultyName: "Kristin", openSeats: 6)
        tables.append(kristin)
        let ben = Table(facultyName: "Ben", openSeats: 3)
        tables.append(ben)
        let meghan = Table(facultyName: "Meghan/Dave", openSeats: 6)
        tables.append(meghan)
        let brian = Table(facultyName: "Brian", openSeats: 5)
        tables.append(brian)
        let michelle = Table(facultyName: "Michelle/Lauren", openSeats: 5)
        tables.append(michelle)
        let joe = Table(facultyName: "Joe", openSeats: 6)
        tables.append(joe)
        let price = Table(facultyName: "Price Family", openSeats: 3)
        tables.append(price)
        let julie = Table(facultyName: "Julie", openSeats: 6)
        tables.append(julie)
        let tony = Table(facultyName: "Tony", openSeats: 3)
        tables.append(tony)
        
        Student.getObjectsWithCompletion( {(students: [AnyObject]!, error: NSError!) -> () in
            if error == nil { // checks for errors in loading the questions
                self.students = students as! [Student]
            } else {
                print("error loading students")
            }
        })
        
        let selector = TableSelector(tables: tables, students: students)
        
        selector.placeStudent(0, tableIndex: 0)
        
        for table in tables {
            for student in table.students {
                print(student.name)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let client = BAAClient.sharedClient()
        if !client.isAuthenticated() { // checks that the user is logged in
            navigationController?.performSegueWithIdentifier("showLogin", sender: nil)
        }
    }


}

