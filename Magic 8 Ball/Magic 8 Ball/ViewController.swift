//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 3/08/2015.
//  Copyright (c) 2015 Peter Mavridis. All rights reserved.
//

import UIKit
var EightBall = EightBallModel()
var ResponseModel = QuestionResponseModel(coder: NSCoder())
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var outputText: UILabel!
    
    override func viewDidLoad() {
        
        println("Peter Mavridis")
        
        var age : Double = 107.392294029
        print("My age: ")
        println(String(format: "%.2f", age))
        
        var nameVariable : String = "Peter Mavridis"
        println(nameVariable)
        
        outputText.alpha = 0.0

        println()
        print("Will I get full marks for this lab?\n")
        EightBall.randomSelector()
        
        print("Will the Cronulla Sharks receive a premiership this year?\n")
        EightBall.randomSelector()
        
        print("Will I end up becoming a cat person when I get old?\n")
        EightBall.randomSelector()
        
        println(EightBall.description)

        debugPrintln("Debug: \(EightBall.debugDescription)")
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
        showHistory()

    }
    // For the GO button onscreen keyboard.
    func textFieldShouldReturn(inputText: UITextField) -> Bool {
        inputText.resignFirstResponder()
        changeLabel()
        changeCircle()
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
    
    func showHistory(){
        
    }
    
    func addHistory(){
//        ResponseModel.questionAsked = inputText as! String
//        ResponseModel.answer = outputText
    }
}

