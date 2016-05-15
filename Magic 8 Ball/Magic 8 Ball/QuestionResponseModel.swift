//
//  QuestionResponseModel.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 14/05/2016.
//  Copyright © 2016 Peter Mavridis. All rights reserved.
//

import Foundation

class QuestionResponseModel: NSObject, NSCoding{
    var question: String
    var answer: String
    var image: String?
    
    init(question:String, answer:String, image:String? = nil){
        self.question = question
        self.answer = answer
        self.image = image
    }
    
    required convenience init(coder decoder: NSCoder) {
        
        let question = decoder.decodeObjectForKey("question") as! String
        let answer = decoder.decodeObjectForKey("answer") as! String
        
        self.init(question:question, answer: answer)
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.question, forKey: "question")
        coder.encodeObject(self.answer, forKey: "answer")
    }
}