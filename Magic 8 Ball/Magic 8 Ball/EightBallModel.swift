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

class EightBallModel: NSObject {
    let initialResponseArray = [String]()
    var responseArray = [String]()
    var temp = " "
    var changeImage = [String]()
    override init () {

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
    
    override var description : String {
        // Use a for loop to create a string based on the elements
        // inside of response array
        print("=========================\n", terminator: "")
        print("From description function\n", terminator: "")
        
        for i in 0 ..< responseArray.count {
            temp += responseArray[i]
        }
        return temp
    }
    
    override var debugDescription : String {
        // Use a for loop to create a string based on the elements
        // inside of response array
        // Make sure the string starts with the word "Debug:"
        
        temp.removeAll(keepCapacity: false)// Resests temp to empty
        
        print("******************************\n", terminator: "")
        print("From debugDescription function\n", terminator: "")
        for i in 0 ..< responseArray.count {
            temp += responseArray[i]
        }
        return temp
    }
    
    func randomSelector() {
        let randomIndex = Int(arc4random_uniform(UInt32(responseArray.count)))
        print(responseArray[randomIndex])
    }
}


class QuestionResponseModel: NSObject, NSCoding {
    var questionAsked : String = ""
    var answer : String = ""
    var ArrayList : NSMutableArray = []
    required init?(coder aDecoder: NSCoder) {
        self.questionAsked = aDecoder.decodeObjectForKey("questionAsked") as! String
        self.answer = aDecoder.decodeObjectForKey("answer") as! String
    }
    func encodeWithCoder(_aCoder: NSCoder) {
        _aCoder.encodeObject(self.questionAsked, forKey: "questionAsked")
        _aCoder.encodeObject(self.answer, forKey:"answer")
        
    }
    
   
}

