//
//  StatsViewController.swift
//  To Do List App
//
//  Created by Robert Spark on 10/15/16.
//  Copyright © 2016 Robert Spark. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    
    @IBOutlet var statLabel: UILabel!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var counter: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statLabel.text = counter

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
