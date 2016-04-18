//
//  HistoryViewController.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 18/04/2016.
//  Copyright © 2016 Peter Mavridis. All rights reserved.
//

import Foundation
import UIKit
var ResponseModel = QuestionResponseModel(coder: NSCoder())
class HistoryViewController: UITableViewController {
    
    
    func showHistory(){
        
    }
    
    func addHistory(){
        ResponseModel?.questionAsked = inputText.text!
        ResponseModel?.answer = outputText.text!
    }
}