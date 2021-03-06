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
    let eightBall = EightBallModel(extraResponseArray: [NSLocalizedString("response2", comment: "response"), NSLocalizedString("response3", comment: "response")])
    let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
                                                    NSSearchPathDomainMask.UserDomainMask,
                                                    true)[0] as AnyObject
    var file:String = ""
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var outputText: UILabel!
    
    @IBOutlet weak var historyButton: UIButton!
    override func viewDidLoad() {
        
        outputText.alpha = 0.0

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        file = path.stringByAppendingPathComponent("historydata")
        
        // Retrieve and save
        if let historyData = NSKeyedUnarchiver.unarchiveObjectWithFile(file) as? [QuestionResponseModel] {
            historyList = historyData.reverse()
        }
        // For the GO button onscreen keyboard
        inputText.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        historyButton.setTitle("History", forState: .Normal)
    }
    func getAnswer(sender:AnyObject) {
        circleImage.alpha = 0
        outputText.alpha = 0
        let imagedName = "circle" + String(arc4random() % UInt32(6) + 1)
        
        circleImage.image = UIImage(named: imagedName)
        
        UIImageView.animateWithDuration(0.5, animations: {
            self.circleImage.alpha = 1
            self.outputText.alpha = 1
        })
        
        let randomIndex = eightBall.responseToQuestion()
        outputText.text = eightBall.responseArray![Int(randomIndex)]
        
        let question = inputText.text!
        let answer = outputText.text!
        
        eightBall.playSound(randomIndex)
        RemoteConnection().addEntry(question, answer: answer) { (success) in
            if success {
                print("Success")
            }else{
                print("Failure")
            }
        }
        
        historyList.append(QuestionResponseModel(question: inputText.text!, answer: outputText.text!))
        NSKeyedArchiver.archiveRootObject(historyList, toFile: file)
        
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
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

