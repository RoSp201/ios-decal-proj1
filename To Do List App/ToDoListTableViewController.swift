//
//  ToDoListTableViewController.swift
//  To Do List App
//
//  Created by Robert Spark on 10/15/16.
//  Copyright © 2016 Robert Spark. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

     // MARK: Properties 
    
    var twentyfo: Double = 3600*24.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var sourceString: ToDoListItem?
    var toDoListItems = [ToDoListItem]()
    var numberCheckedTasks = 0
    var taskName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        func loadSampleItems() {
            let item1 = ToDoListItem(name: "Go to gym", description: "Leg Day")!
            let item2 = ToDoListItem(name: "Eat Dinner", description: "Lots of veggies")!
            let item3 = ToDoListItem(name: "Go to bed", description: "Early")!
            
            toDoListItems += [item1, item2, item3]
            
            if sourceString != nil {
                toDoListItems.append(sourceString!)
            }
        
            
        }
        //Load the sample data.
        loadSampleItems()
    }

    override func viewDidAppear(_ animated: Bool) {
        let copy = toDoListItems.count
        var removeIDs = [Int]()
        for i in 0..<(copy) {
            if toDoListItems[i].completed == true {
                let ref = toDoListItems[i].startTime
                let now = NSDate()
                let diff = now.timeIntervalSince(ref as Date)
                if diff > twentyfo {
                    removeIDs.append(i)
                }
            }
        }
        for id in removeIDs {
            toDoListItems.remove(at: id)
        }
        tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ToDoListTableItemViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! ToDoListItemTableViewCell
        let item = toDoListItems[indexPath.row]
        cell.itemLabel.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        performSegue(withIdentifier: "TaskDetails", sender: self)
    }
    
    //MARK: Actions
    @IBAction func unwindFromAddTaskViewController(sender: UIStoryboardSegue){
        let svc = sender.source as! AddTaskViewController
        toDoListItems.append(ToDoListItem(name: svc.taskTextField.text!, description: "")!)
        }
    
    @IBAction func unwindFromTaskDetailsViewControllerComplete(sender: UIStoryboardSegue){
        let completeVC = sender.source as! TaskDetailsViewController
        let names = toDoListItems.map { $0.name }
        let temp = completeVC.taskLabel!.text!
        if let index = names.index(of: temp){
            if toDoListItems[index].completed == false {
                toDoListItems[index].completed = true
                numberCheckedTasks += 1
                toDoListItems[index].name = toDoListItems[index].doneName!
                
                //resets the clock time
                toDoListItems[index].startTime = NSDate()
            }
            else{
                toDoListItems[index].completed = false
                toDoListItems[index].name = toDoListItems[index].good!
                numberCheckedTasks -= 1
                
            }
        }
        
    }
    @IBAction func unwindFromTaskDetailsViewControllerDelete(sender: UIStoryboardSegue){
        print("came from detailTask delete button")
        let deleteVC = sender.source as! TaskDetailsViewController
        let names = toDoListItems.map { $0.name }
        let temp = deleteVC.taskLabel!.text!
        if let index = names.index(of: temp){
            toDoListItems.remove(at: index)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            switch (id) {
                case "Stats":
                    let statVC: StatsViewController = segue.destination as! StatsViewController
                    statVC.counter = String(numberCheckedTasks)
                case "TaskDetails":
                    let detailVC: TaskDetailsViewController = segue.destination as!TaskDetailsViewController
                    let i = tableView.indexPathForSelectedRow?.row
                    detailVC.str = toDoListItems[(i)!].name
                    if toDoListItems[(i)!].name == toDoListItems[(i)!].doneName {
                    detailVC.status = "Uncheck"
                    }else {
                    detailVC.status = "Check"    
                }
                
            default:
                break
            }
        }
        
    }
}
