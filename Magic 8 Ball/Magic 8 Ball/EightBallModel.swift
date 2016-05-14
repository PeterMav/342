//
//  EightBallModel.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 11/04/2016.
//  Copyright (c) 2015 Peter Mavridis. All rights reserved.
//


/*
    Question 9 
    Storing emoji's in Swift is not a problem as part of a string
    or variable. You can also use an emoji as a var name...

*/
import UIKit

class EightBallModel: CustomStringConvertible, CustomDebugStringConvertible {
    let initialResponseArray:[String] = ["Maybe no", "Maybe yes"]
    var responseArray:[String]?
    var temp = " "
    var changeImage = [String]()
    
    init(){
        responseArray = initialResponseArray
    }
    
    init(extraResponseArray:[String]) {
        responseArray = initialResponseArray + extraResponseArray
    }
    
    var description : String {
        // Use a for loop to create a string based on the elements
        // inside of response array
        var element = ""
        if let responses = responseArray{
            for response in responses {
                element = element + " " + response
            }
        }
        return element
    }
    
    var debugDescription : String {
        // Use a for loop to create a string based on the elements
        // inside of response array
        // Make sure the string starts with the word "Debug:"
        var element = "Debug:"
        if let responses = responseArray{
            for response in responses {
                element = element + " " + response
            }
        }
        return element
    }
    
    func responseToQuestion(question:String) -> String{
        print(question)
        if let responses = responseArray{
            let randomNumber = arc4random() % UInt32(responses.count)
            print(responses[Int(randomNumber)])
            
            return responses[Int(randomNumber)]
        } else {
            debugPrint("Debug: responseArray is empty")
            
            return "response is empty"
        }
        
        
    }
    
//    func randomSelector() {
//        let randomIndex = Int(arc4random_uniform(UInt32(responseArray!.count)))
//        print(responseArray![randomIndex])
//    }
}



