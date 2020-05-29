//
//  TaskItem.swift
//  Todoey
//
//  Created by Samuel Kim on 5/29/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct TaskItem {
    let taskName: String
    var isChecked: Bool = false
    
    init(_ taskName: String) {
        self.taskName = taskName
    }
}
