//
//  ToDoListItemTableViewCell.swift
//  To Do List App
//
//  Created by Robert Spark on 10/15/16.
//  Copyright © 2016 Robert Spark. All rights reserved.
//

import UIKit

class ToDoListItemTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
