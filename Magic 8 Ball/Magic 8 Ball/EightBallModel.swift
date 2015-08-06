//
//  EightBallModel.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 3/08/2015.
//  Copyright (c) 2015 Peter Mavridis. All rights reserved.
//


/*
    Question 9 
    Storing emoji's in Swift is not a problem as part of a string
    or variable. You can also use an emoji as a var name...

*/
import UIKit

class EightBallModel: NSObject, Printable, DebugPrintable {
    let initialResponseArray = [String]()
    var responseArray = [String]()
    var temp = " "

    override init () {
        
        
    }
    
    init(extraResponseArray : Array<String>) {
        
        
    }
    
    override var description : String {
        // Use a for loop to create a string based on the elements
        // inside of response array
        println("=========================")
        println("From description function")
        
        for var i = 0; i < responseArray.count; i++ {
            temp += responseArray[i]
        }
        return temp
    }
    
    override var debugDescription : String {
        // Use a for loop to create a string based on the elements
        // inside of response array
        // Make sure the string starts with the word "Debug:"
        
        temp.removeAll(keepCapacity: false)// Resests temp to empty
        
        println("******************************")
        println("From debugDescription function")
        for var i = 0; i < responseArray.count; i++ {
            temp += responseArray[i]
        }
        return temp
    }
    
    func randomSelector() {
        let randomIndex = Int(arc4random_uniform(UInt32(responseArray.count)))
        println(responseArray[randomIndex])
    }
    
    
}
