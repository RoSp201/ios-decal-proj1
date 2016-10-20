//
//  TaskDetailsViewController.swift
//  To Do List App
//
//  Created by Robert Spark on 10/19/16.
//  Copyright © 2016 Robert Spark. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {

    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var completeTask: UIButton!
    @IBOutlet var deleteTask: UIButton!
    
    var str: String = ""
    var status: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.taskLabel?.text = self.str
        
        completeTask.setTitle(status, for: .normal)

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
