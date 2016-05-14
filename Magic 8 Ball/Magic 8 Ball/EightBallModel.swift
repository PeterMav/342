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
import Foundation
import AVFoundation

class EightBallModel: CustomStringConvertible, CustomDebugStringConvertible {
    let initialResponseArray:[String] = [NSLocalizedString("response0", comment: "response"), NSLocalizedString("response1", comment: "response")]
    let extraResponseArray:[String] = [NSLocalizedString("response2", comment: "response"), NSLocalizedString("response3", comment: "response")]
    var responseArray:[String]?
    
    var changeImage = [String]()
    var soundPlayer: AVAudioPlayer!
    let ss = AVSpeechSynthesizer()
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
        if let response = responseArray{
            for response in response {
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
    
    func responseToQuestion() -> Int{
        let randomIndex = Int(arc4random_uniform(UInt32(responseArray!.count)))
        return randomIndex
    }
    
    func playSound(numb:Int){
        let speechText = NSLocalizedString("response"+String(numb), comment: "response")
        let su = AVSpeechUtterance(string: speechText)
        ss.speakUtterance(su)

    }
    
//    func randomSelector() {
//        let randomIndex = Int(arc4random_uniform(UInt32(responseArray!.count)))
//        print(responseArray![randomIndex])
//    }
}



