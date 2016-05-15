//
//  HistoryViewController.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 18/04/2016.
//  Copyright © 2016 Peter Mavridis. All rights reserved.
//

import UIKit


class HistoryViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet weak var navigationTitle: UINavigationBar!
    
    @IBOutlet weak var tableView: UITableView!
    var historyList = [QuestionResponseModel]()
    override func viewDidLoad() {
        RemoteConnection().getHistory(){ success, data in
            if success{
                self.historyList = data!
                self.tableView.reloadData()
                print("success")
            } else {
                print("failed")
            }
        }
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
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath) as! HistoryTableViewCell
        
        let row = indexPath.row
        cell.answer?.text = historyList[row].answer
        cell.question?.text = historyList[row].question
        cell.user?.image = historyList[row].image as? String
//        cell.textLabel?.text = historyList[row].question
//        cell.detailTextLabel?.text = historyList[row].answer
        if let url = NSURL(string: historyList[row].image!){
            let session = NSURLSession.sharedSession()
            session.dataTaskWithURL(url, completionHandler: {(data,response,error) in
                if let e = error {
                    print("error with image url \(e.localizedDescription)")
                } else if let d = data, image = UIImage(data: d) {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        cell.user.image = image
                    })
                }
            }).resume()
        }
        return cell
    }

    @IBAction func doneButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
