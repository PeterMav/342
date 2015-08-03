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
        EightBall.responseArray += ["Hack Yes!"]
        EightBall.responseArray += ["Heck No!"]
        EightBall.responseArray += ["Maybe"]
        
        println("Will I get full marks for this lab?")
        EightBall.randomSelector()
        
        println("Will the Cronulla Sharks receive a premiership this year?")
        EightBall.randomSelector()
        
        println("Will I end up becoming a cat person when I get old?")
        EightBall.randomSelector()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

