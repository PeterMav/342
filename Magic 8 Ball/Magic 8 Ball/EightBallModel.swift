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

class EightBallModel {
    let initialResponseArray = [String]()
    var responseArray = [String]()
    var temp = " "
    var changeImage = [String]()
    init () {

        changeImage += ["circle1.png"]
        changeImage += ["circle2.png"]
        changeImage += ["circle3.png"]
        changeImage += ["circle4.png"]
        changeImage += ["circle5.png"]
        changeImage += ["circle6.png"]
        

        //initialResponseArray += ["Nobody knows!"];
        responseArray += ["Heck Yes!"]
        responseArray += [" Heck No!"]
        responseArray += [" Maybe"]
        responseArray += [" 💩"]

    }
    
    init(extraResponseArray : Array<String>) {
        
        
    }
    
//    var description : String {
//        // Use a for loop to create a string based on the elements
//        // inside of response array
//        print("=========================\n")
//        print("From description function\n")
//        
//        for var i = 0; i < responseArray.count; i++ {
//            temp += responseArray[i]
//        }
//        return temp
//    }
//    
//    var debugDescription : String {
//        // Use a for loop to create a string based on the elements
//        // inside of response array
//        // Make sure the string starts with the word "Debug:"
//        
//        temp.removeAll(keepCapacity: false)// Resests temp to empty
//        
//        print("******************************\n")
//        print("From debugDescription function\n")
//        for var i = 0; i < responseArray.count; i++ {
//            temp += responseArray[i]
//        }
//        return temp
//    }
    
    func randomSelector() {
        let randomIndex = Int(arc4random_uniform(UInt32(responseArray.count)))
        print(responseArray[randomIndex])
    }
}
