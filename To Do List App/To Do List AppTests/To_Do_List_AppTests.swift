//
//  To_Do_List_AppTests.swift
//  To Do List AppTests
//
//  Created by Robert Spark on 10/14/16.
//  Copyright © 2016 Robert Spark. All rights reserved.
//

import XCTest
@testable import To_Do_List_App

class To_Do_List_AppTests: XCTestCase {
    
    // MARK: ToDoList Tests
    
    func testToDoListItemInitialization() {
        
        //Success Case.
        let potentialItem = ToDoListItem(name: "Mow Lawn", description: "Use Mower")
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = ToDoListItem(name: "", description: "I don't know")
        XCTAssertNil(noName, "Empty name is invalid")

    }
    
}
