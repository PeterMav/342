//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 3/08/2015.
//  Copyright (c) 2015 Peter Mavridis. All rights reserved.
//

import UIKit
var EightBall = EightBallModel()
class ViewController: UIViewController {

    
    @IBOutlet weak var inputText: UITextField!
   
    @IBOutlet weak var outputText: UILabel!
    
    override func viewDidLoad() {
        
        println("Peter Mavridis")
        
        var age : Double = 107.392294029
        print("My age: ")
        println(String(format: "%.2f", age))
        
        var nameVariable : String = "Peter Mavridis"
        println(nameVariable)
        
        
        EightBall.responseArray += ["Heck Yes!"]
        EightBall.responseArray += [" Heck No!"]
        EightBall.responseArray += [" Maybe"]
        EightBall.responseArray += [" 💩"]
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
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func shakeButtonPressed(sender: AnyObject) {
        outputText.text = EightBall.responseArray[Int(arc4random_uniform(UInt32(EightBall.responseArray.count)))]
    }
    
}

