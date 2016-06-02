//
//  DateRange.swift
//  Dorm-Seating
//
//  Created by joshua on 6/1/16.
//  Copyright © 2016 SSFS. All rights reserved.
//

import UIKit

class DateRange: NSObject, UIPickerViewDataSource {
    
    let values = (0...8).map { $0 }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int { // sets number of columns in picker view
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { // sets number of rows in picker view
        return values.count
    }
    
}
