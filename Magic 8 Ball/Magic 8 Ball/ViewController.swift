//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 3/08/2015.
//  Copyright (c) 2015 Peter Mavridis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        println("Peter Mavridis")
        
        var age : Double = 107.392294029
        println(String(format: "%.2f", age))
        
        var nameVariable : String = "Peter Mavridis"
        println(nameVariable)
        
        var EightBall = EightBallModel()
        EightBall.responseArray += ["Yes!"]
        EightBall.responseArray += ["No!"]
        EightBall.responseArray += ["Maybe"]
        
        println("Will I get full marks for this lab?")
        println(EightBall.responseArray[0])
        
        println("Will the Cronulla Sharks receive a premiership this year?")
        println(EightBall.responseArray[1])
        
        println("Will I end up becoming a cat person when I get old?")
        println(EightBall.responseArray[2])
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

