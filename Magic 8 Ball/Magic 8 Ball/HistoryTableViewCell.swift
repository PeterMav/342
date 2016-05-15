//
//  HistoryTableViewCell.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 15/05/2016.
//  Copyright © 2016 Peter Mavridis. All rights reserved.
//

import Foundation
import UIKit
class HistoryTableViewCell: UITableViewCell {
    

    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var user: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}