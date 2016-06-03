//
//  ViewController.swift
//  Dorm-Seating
//
//  Created by joshua on 3/1/16.
//  Copyright © 2016 SSFS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dateRange: DateRange!
    @IBOutlet weak var adamTable: UILabel!
    @IBOutlet weak var kenTable: UILabel!
    @IBOutlet weak var aimeeTable: UILabel!
    @IBOutlet weak var kristinTable: UILabel!
    @IBOutlet weak var benTable: UILabel!
    @IBOutlet weak var meghanTable: UILabel!
    @IBOutlet weak var brianTable: UILabel!
    @IBOutlet weak var michelleTable: UILabel!
    @IBOutlet weak var joeTable: UILabel!
    @IBOutlet weak var priceTable: UILabel!
    @IBOutlet weak var julieTable: UILabel!
    @IBOutlet weak var tonyTable: UILabel!
    
    @IBOutlet weak var datePicker: UIPickerView!
    
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
                let selector = TableSelector(tables: self.tables, students: self.students)
                var x = 0
                while x < 2 {
                    selector.placeStudent(0, tableIndex: 0)
                    for table in self.tables {
                        print(table.facultyName)
                        for student in table.students {
                            print(student.name)
                        }
                    }
                    selector.clearTables()
                    x += 1
                }
                
                
                print("\(students.count)")
                self.adamTable.text = adam.getArrangement(0)
                self.kenTable.text = ken.getArrangement(0)
                self.aimeeTable.text = aimee.getArrangement(0)
                self.kristinTable.text = kristin.getArrangement(0)
                self.benTable.text = ben.getArrangement(0)
                self.meghanTable.text = meghan.getArrangement(0)
                self.brianTable.text = brian.getArrangement(0)
                self.michelleTable.text = michelle.getArrangement(0)
                self.joeTable.text = joe.getArrangement(0)
                self.priceTable.text = price.getArrangement(0)
                self.julieTable.text = julie.getArrangement(0)
                self.tonyTable.text = tony.getArrangement(0)
                
                
                
            } else {
                print("error loading students")
                print(error)
            }
        })
        
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
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let dateNumber = dateRange.values[row]
        return "\(dateNumber)"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let client = BAAClient.sharedClient()
        if !client.isAuthenticated() { // checks that the user is logged in
            navigationController?.performSegueWithIdentifier("showLogin", sender: nil)
        }
        

    }


}
