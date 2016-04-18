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
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var outputText: UILabel!
    
    override func viewDidLoad() {
        
        print("Peter Mavridis")
        
        let age : Double = 107.392294029
        print("My age: ", terminator: "")
        print(String(format: "%.2f", age))
        
        let nameVariable : String = "Peter Mavridis"
        print(nameVariable)
        
        outputText.alpha = 0.0

        print("")
        print("Will I get full marks for this lab?\n", terminator: "")
        EightBall.randomSelector()
        
        print("Will the Cronulla Sharks receive a premiership this year?\n", terminator: "")
        EightBall.randomSelector()
        
        print("Will I end up becoming a cat person when I get old?\n", terminator: "")
        EightBall.randomSelector()
        
        print(EightBall.description)

        debugPrint("Debug: \(EightBall.debugDescription)")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // For the GO button onscreen keyboard
        inputText.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // For the shake button on screen
    @IBAction func shakeButtonPressed(sender: AnyObject) {
//        showHistory()
        

    }
    // For the GO button onscreen keyboard.
    func textFieldShouldReturn(inputText: UITextField) -> Bool {
        inputText.resignFirstResponder()
        changeLabel()
        changeCircle()
        let temp = QuestionResponseModel(questionAsked: inputText.text!, answer: outputText.text!)
        historyList.append(temp)
        return true
    }
    
    func fadeIn() {
        outputText.alpha = 0
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(2)
        outputText.alpha = 1
        UIView.commitAnimations()
    }
    
    func changeCircle() {
        circleImage.image = UIImage(named:
            EightBall.changeImage[Int(arc4random_uniform(UInt32(EightBall.changeImage.count)))])
    }
    
    func changeLabel() {
        outputText.text = EightBall.responseArray[Int(arc4random_uniform(UInt32(EightBall.responseArray.count)))]
        fadeIn()
    }
    
    
  

}

