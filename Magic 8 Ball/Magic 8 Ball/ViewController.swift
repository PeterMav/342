//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 3/08/2015.
//  Copyright (c) 2015 Peter Mavridis. All rights reserved.
//

import UIKit
var EightBall = EightBallModel()
class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var outputText: UILabel!
    
    override func viewDidLoad() {
        
//        print("Peter Mavridis")
//        
//        let age : Double = 107.392294029
//        print("My age: ")
//        print(String(format: "%.2f", age))
//        
//        let nameVariable : String = "Peter Mavridis"
//        print(nameVariable)
        

        outputText.alpha = 0.0


        /*

        EightBall.responseArray += ["Heck Yes!"]
        EightBall.responseArray += [" Heck No!"]
        EightBall.responseArray += [" Maybe"]
        EightBall.responseArray += [" 💩"]
        */
//        print(())
//        print("Will I get full marks for this lab?\n")
//        EightBall.randomSelector()
//        
//        print("Will the Cronulla Sharks receive a premiership this year?\n")
//        EightBall.randomSelector()
//        
//        print("Will I end up becoming a cat person when I get old?\n")
//        EightBall.randomSelector()
        
        
//        print(EightBall.description)

//        debugPrint("Debug: \(EightBall.debugDescription)")
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
        changeLabel()
        changeCircle()
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
}

