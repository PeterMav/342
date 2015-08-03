//
//  EightBallModel.swift
//  Magic 8 Ball
//
//  Created by Peter Mavridis on 3/08/2015.
//  Copyright (c) 2015 Peter Mavridis. All rights reserved.
//

import UIKit

class EightBallModel: NSObject, Printable, DebugPrintable {
    let initialResponseArray = [String]();
    var responseArray = [String]();
    
    override init () {
        
        
    }
    
    init(extraResponseArray : Array<String>) {
        
        
    }
    
    func randomSelector() {
        let randomIndex = Int(arc4random_uniform(UInt32(responseArray.count)))
        println(responseArray[randomIndex])
    }
    
    var description : String {
        
    }
    
    var debugDescription : String {
        
    }
}
