//
//  EightBallModel.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 3/08/2015.
//  Copyright (c) 2015 Peter Mavridis. All rights reserved.
//

import UIKit

class EightBallModel: NSObject, Printable, DebugPrintable {
    let initialResponseArray = [String]()
    var responseArray = [String]()

    override init () {
        
        
    }
    
    init(extraResponseArray : Array<String>) {
        
        
    }
    
    override var description : String {
        // Use a for loop to create a string based on the elements
        // inside of response array
        
        for var i = 0; i < responseArray.count; i++ {
            println(responseArray[i])
        }
        return "Hello!"
    }
    
    override var debugDescription : String {
        // Use a for loop to create a string based on the elements
        // inside of response array
        // Make sure the string starts with the word "Debug:"
        for var i = 0; i < responseArray.count; i++ {
            println("Debug: \(responseArray[i])")
        }
        return "Hello!"
    }
    
    func randomSelector() {
        let randomIndex = Int(arc4random_uniform(UInt32(responseArray.count)))
        println(responseArray[randomIndex])
    }
    
    
}
