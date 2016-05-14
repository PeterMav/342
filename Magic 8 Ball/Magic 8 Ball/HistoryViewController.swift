//
//  HistoryViewController.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 18/04/2016.
//  Copyright © 2016 Peter Mavridis. All rights reserved.
//

import UIKit


class HistoryViewController: UIViewController, UITableViewDelegate {

    var historyList = [QuestionResponseModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return historyList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath)
        
        let row = indexPath.row
        
        cell.textLabel?.text = historyList[row].question
        cell.detailTextLabel?.text = historyList[row].answer
        
        return cell
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
