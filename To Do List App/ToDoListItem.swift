//
//  ToDoListItem.swift
//  To Do List App
//
//  Created by Robert Spark on 10/15/16.
//  Copyright © 2016 Robert Spark. All rights reserved.
//

import UIKit

class ToDoListItem {
    
    
    // MARK: Properties
    var name: String
    var description = "Add Description"
    var completed: Bool
    var startTime: NSDate
    var doneName: String?
    var good: String?
    
    // MARK: Initialization
    
    init?(name: String, description: String) {
        
        // Initialize stored properties.
        self.name = name
        self.description = description
        self.completed = false
        self.startTime = NSDate()
        self.doneName = name + " (checked)"
        self.good = name
        
        // Initialization should fail if there is no name.
        if name.isEmpty {
            return nil
        }
    }
}
