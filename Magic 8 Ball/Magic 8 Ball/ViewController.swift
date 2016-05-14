//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 18/04/2016.
//  Copyright (c) 2015 Peter Mavridis. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    var EightBall = EightBallModel()
    var historyList = [QuestionResponseModel]()
    let eightBall = EightBallModel(extraResponseArray: ["No", "Yes"])
    let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
                                                    NSSearchPathDomainMask.UserDomainMask,
                                                    true)[0] as AnyObject
    var filePath:String = ""
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var outputText: UILabel!
    
    override func viewDidLoad() {
        
        outputText.alpha = 0.0

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        filePath = path.stringByAppendingPathComponent("historydata")
        
        // Retrieve and save
        if let historyData = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? [QuestionResponseModel] {
            for data in historyData{
                historyList.append(QuestionResponseModel(questionAsked: data.question, answer: data.answer))
            }
        }
        // For the GO button onscreen keyboard
        inputText.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getAnswer(sender:AnyObject) {
        circleImage.alpha = 0
        let imagedName = "circle" + String(arc4random() % UInt32(6) + 1)
        
        circleImage.image = UIImage(named: imagedName)
        
        UIImageView.animateWithDuration(0.5, animations: {
            self.circleImage.alpha = 1
        })
        outputText.text = eightBall.responseToQuestion(inputText.text!)
        
        
        // Append question and answer to historList
        historyList.append(QuestionResponseModel(questionAsked: inputText.text!, answer: outputText.text!))
        
        // Save to filepath
        NSKeyedArchiver.archiveRootObject(historyList, toFile: filePath)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showHistoryView" {
            let controller = segue.destinationViewController as! HistoryViewController
            controller.historyList = historyList
        }
    }
    // For the GO button onscreen keyboard.
    func textFieldShouldReturn(inputText: UITextField) -> Bool {
        inputText.resignFirstResponder()
        getAnswer(inputText)
        
        return true
    }
    
//    func fadeIn() {
//        outputText.alpha = 0
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(2)
//        outputText.alpha = 1
//        UIView.commitAnimations()
//    }
//    
//    func changeCircle() {
//        circleImage.image = UIImage(named:
//            EightBall.changeImage[Int(arc4random_uniform(UInt32(EightBall.changeImage.count)))])
//    }
//    
//    func changeLabel() {
//        outputText.text = EightBall.responseArray![Int(arc4random_uniform(UInt32(EightBall.responseArray!.count)))]
//        fadeIn()
//    }
    

}

