//
//  RatingControl.swift
//  To Do List App
//
//  Created by Robert Spark on 10/15/16.
//  Copyright © 2016 Robert Spark. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var rating: Int = 0
    var ratingButtons = [UIButton]()
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        //create a red button
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.cyan
        func intrinsicContentSize() -> CGSize {
            return CGSize(width: 240, height: 44)
        }
        //button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_ :)), for: UIControlEvents.touchDown)
        addSubview(button)
        
    }
    // MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
        
    }
}
