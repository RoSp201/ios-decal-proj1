//
//  AddTaskViewController.swift
//  To Do List App
//
//  Created by Robert Spark on 10/18/16.
//  Copyright © 2016 Robert Spark. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet var addButton: UIButton!

    var text: String? = "default"
    override func viewDidLoad() {
        super.viewDidLoad()
        if taskTextField.text != nil {
            text = taskTextField.text
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }
